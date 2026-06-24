@echo off
title GOL SAINT - Sincronizador Mundial
color 0b

echo =======================================================================
echo               GOL SAINT - POPULANDO COPA DEL MUNDO (WC)
echo =======================================================================
echo.
echo Conectando con el servidor Spring Boot en http://localhost:8081...
echo Por favor, espera mientras se descargan partidos, banderas y resultados.
echo Esto puede tomar unos segundos...
echo.

powershell -Command "try { $res = Invoke-RestMethod -Uri 'http://localhost:8081/api/v1/sync/competicion/WC' -Method Post; Write-Host 'EXITO: ' $res.message -ForegroundColor Green; } catch { Write-Host 'ERROR: No se pudo conectar con el servidor Spring Boot. Asegurate de que el backend este corriendo en el puerto 8081.' -ForegroundColor Red; $_.Exception.Message }"

echo.
echo =======================================================================
echo Proceso finalizado. Al abrir la app de Flutter se sincronizaran los datos
echo a la base de datos local Isar de forma automatica.
echo =======================================================================
echo.
pause
