project "OpenAL"
    language "C++"
    cppdialect "C++20"
    kind "StaticLib"
    staticruntime "on"

	targetdir ("%{wks.location}/bin/" .. outputDir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputDir .. "/%{prj.name}")

    files {
        "al/**.h",
        "al/**.cpp",
        "alc/**.cpp",
        "alc/**.h",
        "common/**.cpp",
        "common/**.h"
    }

    excludes {
        "alc/mixer/mixer_neon.cpp",
        "alc/backends/sdl2.cpp",
        "alc/backends/alsa.cpp",
        "alc/backends/jack.cpp",
        "alc/backends/oboe.cpp",
        "alc/backends/opensl.cpp",
        "alc/backends/oss.cpp",
        "alc/backends/pipewire.cpp",
        "alc/backends/portaudio.cpp",
        "alc/backends/pulseaudio.cpp",
        "alc/backends/sndio.cpp",
        "alc/backends/coreaudio.cpp",
        "alc/backends/solaris.cpp"
    }


    defines { 
        "NOMINMAX",
        "_CRT_SECURE_NO_WARNINGS",
        "AL_LIBTYPE_STATIC",
        "AL_ALEXT_PROTOTYPES",
        "RESTRICT=__restrict"
    }

    includedirs {
        "include",
        "./",
        "common"
    }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"

   filter "system:windows"
      defines {"winmm"}
      systemversion "latest"
