project "yaml-cpp"
	kind "StaticLib"
	language "C++"
    cppdialect "C++17"
    staticruntime "off"

	targetdir ("bin/" .. outputDir .. "/%{prj.name}")
	objdir ("bin/intermediate/" .. outputDir .. "/%{prj.name}")

	files {
        "%{prj.location}/src/**.h",
		"%{prj.location}/src/**.cpp",
        "%{prj.location}/include/**.h"
	}

    includedirs {
        "%{prj.location}/include"
    }

    defines {
        "YAML_CPP_STATIC_DEFINE"
    }

    filter "toolset:gcc"
        buildoptions {
            "-Wall", "-Wextra", "-Wshadow", "-Weffc++", "-Wno-long-long",
            "-pedantic", "-pedantic-errors"
        }
       
    filter "toolset:msc*"
        buildoptions {
            "/W3", "/wd4127", "/wd4355"
        }

	filter "system:linux"
		pic "On"
		systemversion "latest"

	filter "system:windows"
		systemversion "latest"

		defines {
            "_CRT_SECURE_NO_WARNINGS"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "speed"
        symbols "off"
