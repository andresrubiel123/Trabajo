/// Gestor de estado y persistencia de autenticación de usuario con Hive.
///
/// Autor: Rubiel Andres Diaz
/// Fecha: 2026-06-14
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/constants/app_constants.dart';

/// Estado de autenticación.
class AuthState {
  const AuthState({
    this.isAuthenticated = false,
    this.isLoading = false,
    this.errorMessage,
    this.username,
  });

  final bool isAuthenticated;
  final bool isLoading;
  final String? errorMessage;
  final String? username;

  AuthState copyWith({
    bool? isAuthenticated,
    bool? isLoading,
    String? errorMessage,
    String? username,
    bool clearError = false,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      username: username ?? this.username,
    );
  }
}

/// Notifier de autenticación.
class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState()) {
    // Al inicializar, recuperamos si había una sesión activa guardada
    final box = Hive.box(AppConstants.userBox);
    final savedUser = box.get('session_username') as String?;
    if (savedUser != null) {
      state = AuthState(isAuthenticated: true, username: savedUser);
    }
  }

  String get currentUsername {
    final box = Hive.box(AppConstants.userBox);
    return box.get('username', defaultValue: AppConstants.defaultUser) as String;
  }

  String get currentPassword {
    final box = Hive.box(AppConstants.userBox);
    return box.get('password', defaultValue: AppConstants.defaultPassword) as String;
  }

  Future<bool> login(String username, String password) async {
    state = state.copyWith(isLoading: true, clearError: true);

    // Simulación de delay de red
    await Future.delayed(const Duration(milliseconds: 800));

    if (username == currentUsername &&
        password == currentPassword) {
      // Guardar sesión activa en Hive
      final box = Hive.box(AppConstants.userBox);
      await box.put('session_username', username);

      state = state.copyWith(
        isAuthenticated: true,
        isLoading: false,
        username: username,
      );
      return true;
    } else {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Usuario o contraseña incorrectos',
      );
      return false;
    }
  }

  Future<void> updateCredentials(String newUsername, String newPassword) async {
    final box = Hive.box(AppConstants.userBox);
    await box.put('username', newUsername);
    await box.put('password', newPassword);

    if (state.isAuthenticated) {
      // Si está autenticado, actualizamos la sesión activa guardada
      await box.put('session_username', newUsername);
      state = state.copyWith(username: newUsername);
    }
  }

  Future<void> logout() async {
    final box = Hive.box(AppConstants.userBox);
    await box.delete('session_username');
    state = const AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(),
);
