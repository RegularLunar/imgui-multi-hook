workspace("MultiHook")
configurations({ "Release" })
platforms({ "x64" })

project("MultiHook")
kind("SharedLib")
language("C++")
cppdialect("C++latest")
characterset("MBCS")
architecture("x86_64")

targetdir("bin")
objdir("obj")
targetname("MultiHook")

includedirs({ "$(VULKAN_SDK)/Include" })
libdirs({ "$(VULKAN_SDK)/Lib" })

defines({
    "ImTextureID=ImU64",
    "NDEBUG",
})

optimize("Speed")
symbols("Off")
linktimeoptimization("On")
buffersecuritycheck("Off")
buildoptions({ "/Oy", "/Oi", "/Gy", "/GF" })
linkoptions({ "/OPT:REF", "/OPT:ICF" })

files({ "src/**" })

filter("files:**/imgui_impl_dx12.cpp")
defines({ "IMGUI_DISABLE_WIN32_DEFAULT_IME_FUNCTIONS" })
