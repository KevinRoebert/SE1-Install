@echo off

if "%JAVA_HOME%" == "" (
    echo "JAVA_HOME is not defined"
    for /f %%j in ("java.exe") do (
		for /f tokens^=2-5^ delims^=.-_^" %%v in ('java -fullversion 2^>^&1') do (		
			if %%v LSS 8 (
				echo "Java version is too low"
				echo "at least 1.8 is needed"
			) else (
				"%%~dp$PATH:j\java.exe" -jar karel2020.jar
				goto :continue
			)
		)
    )
) else (
	echo "Found JAVA_HOME at: %JAVA_HOME%"
    "%JAVA_HOME%\bin\java.exe" -jar karel2020.jar
    goto :continue
)
:continue