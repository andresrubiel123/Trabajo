allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

extra.set("compileSdkVersion", 35)
extra.set("targetSdkVersion", 35)

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

subprojects {
    val configureAndroidProject = {
        val android = extensions.findByName("android")
        if (android != null) {
            // 1. Configurar namespace si falta
            try {
                val getNamespace = android.javaClass.getMethod("getNamespace")
                val setNamespace = android.javaClass.getMethod("setNamespace", String::class.java)
                if (getNamespace.invoke(android) == null) {
                    val manifestFile = project.file("src/main/AndroidManifest.xml")
                    var packageNamespace: String? = null
                    if (manifestFile.exists()) {
                        val content = manifestFile.readText()
                        val match = Regex("package=[\"']([^\"']+)[\"']").find(content)
                        if (match != null) {
                            packageNamespace = match.groupValues[1]
                        }
                    }
                    val finalNamespace = packageNamespace ?: "com.example.${project.name.replace("-", "_").replace(":", "_")}"
                    setNamespace.invoke(android, finalNamespace)
                }
            } catch (e: Exception) {
                // Ignorar
            }

            // 2. Configurar compileSdkVersion condicionalmente (mínimo 34)
            try {
                val baseExtension = android as? com.android.build.gradle.BaseExtension
                val current = baseExtension?.compileSdkVersion
                var currentVer = 0
                if (current != null) {
                    if (current is Int) {
                        currentVer = current
                    } else {
                        val str = current.toString()
                        currentVer = str.replace("android-", "").toIntOrNull() ?: 0
                    }
                }
                if (currentVer in 1..33) {
                    baseExtension?.compileSdkVersion(34)
                }
            } catch (e: Exception) {
                // Ignorar si falla
            }
        }
    }

    if (state.executed) {
        configureAndroidProject()
    } else {
        afterEvaluate {
            configureAndroidProject()
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
