@echo off

SET "ruta_remota=\\192.168.1.4\hospital"
SET "ruta_local=D:\Hospital Archivos"
set "carpetas="

IF EXIST "%ruta_local%" (
    for /f "tokens=*" %%a in ('dir /ad /b "%ruta_remota%"') do (
        IF "%%a" NEQ "respaldoaut" (
            IF "%%a" NEQ "INFORMATICA" (
                IF EXIST "%ruta_remota%\%%a" (
                    xcopy "%ruta_remota%\%%a" "%ruta_local%\%%a" /s /y /i /h
                ) ELSE (
                echo "No Se Logro Copiar Respaldo Verifique Direccion de Origen"
                )
            )
        )
    )   
) ELSE (
    echo "No Se Logro Copiar Respaldo Verifique Direccion de Destino"
)
PAUSE