@echo off
SET anio=%Date:~6%
SET mes=%Date:~3,2%
SET dia=%Date:~0,2%
SET carpeta=%anio%-%mes%-%dia%
SET "ruta_remota=\\192.168.1.4\hospital\respaldoaut"
SET "ruta_local=D:\"
IF EXIST "%ruta_local%" (
   IF exist "%ruta_remota%" (
    FOR /L %%i IN (3306, 1, 3309) DO (
      IF EXIST "%ruta_remota%\%%i" (
         FOR /L %%n IN (2, 1, 5) DO (
            IF EXIST "%ruta_remota%\%%i\%carpeta%-0%%n" (
               xcopy "%ruta_remota%\%%i\%carpeta%-0%%n" "%ruta_local%\%%i\%carpeta%-0%%n" /e /y /i
               echo "Respaldo de Carpeta de Puerto %%i Se Logron Copiar de Manera Exitosa"
               echo "Respaldo de Base de Datos Puerto %%i"
               echo.
            )
         )
      ) ELSE (
         echo "No Se Logro Copiar Respaldo Verifique Carpeta de Puerto %%i"
      )
    )
   ) ELSE (
      echo "No Se Logro Copiar Respaldo Verifique Direccion de Origen"
   )
) ELSE (
   echo "No Se Logro Copiar Respaldo Verifique Direccion de Destino"
)
PAUSE