@echo off

if "%JAVA_HOME%" == "" (
    echo "JAVA_HOME is not defined"
    for /f %%j in ("java.exe") do (
		for /f tokens^=2-3^ delims^=.-_^" %%v in ('java -fullversion 2^>^&1') do (
			set version = false
			
			if %%v GEQ 8 set version=true
			if %%w GEQ 8 set version=true
		
			if "%version%" == "true" (
				echo "Java version (%%v.%%w) is too low"
				echo "at least 1.8 is needed"
			) else (
				echo "Found Java in version %%v.%%w at: %%~dp$PATH:j"
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