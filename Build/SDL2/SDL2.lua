project "SDL2"
	filter "system:windows"              -- SDL needs to be a DLL on windows for
		kind          "SharedLib"        -- some reason :)
		staticruntime "off"

	filter "system:macosx"
		kind          "StaticLib"
		staticruntime "on"

	filter "system:linux"
		kind          "StaticLib"
		staticruntime "on"

	filter {}

	language      "C++"                  -- Some files are C++ files, although they
	cppdialect    "C++17"                -- are not needed on normal Windows.
                            
	systemversion "latest"

	flags {
		          "NoRuntimeChecks",     -- Only used on Visual Studio.
		          "NoBufferSecurityCheck"
	}

	vectorextensions "SSE"               -- Necessary to run x32.

	location      "../../Intermediate/ProjectFiles/%{_ACTION}"

	targetdir    ("../../Binaries/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}")
	objdir       ("../../Intermediate/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{prj.name}")

	includedirs  {"../../include"}

	filter "system:windows"
		links {
			      "setupapi",
			      "winmm",
			      "imm32",
			      "version",
		}
	filter {}

	files {
		-- All platforms.
		-- Header files.
		"../../include/begin_code.h",            -- You can just use a wildcard to include all of 
		"../../include/close_code.h",            -- the files in this directory, but from what I can
		"../../include/SDL.h",                   -- tell, actual SDL2 does not seem to do this.
		"../../include/SDL_assert.h",
		"../../include/SDL_atomic.h",
		"../../include/SDL_audio.h",
		"../../include/SDL_bits.h",
		"../../include/SDL_blendmode.h",
		"../../include/SDL_clipboard.h",
		"../../include/SDL_config.h",
		"../../include/SDL_copying.h",
		"../../include/SDL_cpuinfo.h",
		"../../include/SDL_egl.h",
		"../../include/SDL_endian.h",
		"../../include/SDL_error.h",
		"../../include/SDL_events.h",
		"../../include/SDL_filesystem.h",
		"../../include/SDL_gamecontroller.h",
		"../../include/SDL_gesture.h",
		"../../include/SDL_haptic.h",
		"../../include/SDL_hints.h",
		"../../include/SDL_joystick.h",
		"../../include/SDL_keyboard.h",
		"../../include/SDL_keycode.h",
		"../../include/SDL_loadso.h",
		"../../include/SDL_log.h",
		"../../include/SDL_main.h",
		"../../include/SDL_messagebox.h",
		"../../include/SDL_mouse.h",
		"../../include/SDL_mutex.h",
		"../../include/SDL_name.h",
		"../../include/SDL_opengl.h",
		"../../include/SDL_opengl_glext.h",
		"../../include/SDL_opengles.h",
		"../../include/SDL_opengles2.h",
		"../../include/SDL_opengles2_gl2.h",
		"../../include/SDL_opengles2_gl2ext.h",
		"../../include/SDL_opengles2_gl2platform.h",
		"../../include/SDL_opengles2_khrplatform.h",
		"../../include/SDL_pixels.h",
		"../../include/SDL_platform.h",
		"../../include/SDL_power.h",
		"../../include/SDL_quit.h",
		"../../include/SDL_rect.h",
		"../../include/SDL_render.h",
		"../../include/SDL_revision.h",
		"../../include/SDL_rwops.h",
		"../../include/SDL_scancode.h",
		"../../include/SDL_sensor.h",
		"../../include/SDL_shape.h",
		"../../include/SDL_stdinc.h",
		"../../include/SDL_surface.h",
		"../../include/SDL_system.h",
		"../../include/SDL_syswm.h",
		"../../include/SDL_test.h",
		"../../include/SDL_test_assert.h",
		"../../include/SDL_test_common.h",
		"../../include/SDL_test_compare.h",
		"../../include/SDL_test_crc32.h",
		"../../include/SDL_test_font.h",
		"../../include/SDL_test_fuzzer.h",
		"../../include/SDL_test_harness.h",
		"../../include/SDL_test_images.h",
		"../../include/SDL_test_log.h",
		"../../include/SDL_test_md5.h",
		"../../include/SDL_test_random.h",
		"../../include/SDL_thread.h",
		"../../include/SDL_timer.h",
		"../../include/SDL_touch.h",
		"../../include/SDL_types.h",
		"../../include/SDL_version.h",
		"../../include/SDL_video.h",
		"../../include/SDL_vulkan.h",

		"../../src/audio/disk/*.h",
		"../../src/audio/dummy/*.h",
		"../../src/audio/*.h",
		"../../src/dynapi/*.h",
		"../../src/events/blank_cursor.h",
		"../../src/events/default_cursor.h",
		"../../src/events/SDL_clipboardevents_c.h",
		"../../src/events/SDL_displayevents_c.h",
		"../../src/events/SDL_dropevents_c.h",
		"../../src/events/SDL_events_c.h",
		"../../src/events/SDL_gesture_c.h",
		"../../src/events/SDL_keyboard_c.h",
		"../../src/events/SDL_mouse_c.h",
		"../../src/events/SDL_sysevents.h",
		"../../src/events/SDL_touch_c.h",
		"../../src/events/SDL_windowevents_c.h",
		"../../src/haptic/SDL_syshaptic.h",
		"../../src/joystick/hidapi/*.h",
		--"../../src/joystick/hidapi/SDL_hidapijoystick_c.h", -- Not there!!
		"../../src/joystick/SDL_hidapijoystick_c.h",
		"../../src/joystick/SDL_joystick_c.h",
		"../../src/joystick/SDL_sysjoystick.h",
		"../../src/libm/*.h",
		"../../src/render/opengl/*.h",
		"../../src/render/opengles/*.h",
		"../../src/render/SDL_yuv_sw_c.h",
		"../../src/render/software/*.h",
		"../../src/render/SDL_sysrender.h",
		"../../src/SDL_dataqueue.h",
		"../../src/SDL_error_c.h",
		"../../src/sensor/dummy/*.h",
		"../../src/sensor/*.h",
		"../../src/thread/*.h",
		"../../src/timer/*.h",
		"../../src/video/dummy/*.h",
		"../../src/video/*.h",

		-- C files.
		"../../src/atomic/*.c",
		"../../src/audio/disk/*.c",
		"../../src/audio/dummy/*.c",
		"../../src/audio/*.c",
		"../../src/cpuinfo/*.c",
		"../../src/dynapi/*.c",
		"../../src/events/*.c",
		"../../src/file/*.c",
		"../../src/haptic/*.c",
		"../../src/joystick/hidapi/*.c",
		"../../src/joystick/*.c",
		"../../src/libm/*.c",
		"../../src/power/*.c",
		"../../src/render/opengl/*.c",
		"../../src/render/opengles2/*.c",
		"../../src/render/SDL_render.c",
		"../../src/render/SDL_yuv_sw.c",
		"../../src/render/software/*.c",
		"../../src/*.c",
		"../../src/sensor/dummy/SDL_dummysensor.c",
		"../../src/sensor/SDL_sensor.c",
		"../../src/stdlib/*.c",
		"../../src/thread/generic/SDL_syscond.c",
		"../../src/thread/*.c",
		"../../src/thread/windows/SDL_sysmutex.c",--
		"../../src/thread/windows/SDL_syssem.c",--
		"../../src/thread/windows/SDL_systhread.c",--
		"../../src/thread/windows/SDL_systls.c",--
		"../../src/timer/*.c",
		"../../src/timer/windows/SDL_systimer.c",--
		"../../src/video/dummy/*.c",
		"../../src/video/*.c",
		"../../src/video/yuv2rgb/*.c"
	}

	filter "system:windows"
		files {
			-- Windows specific files.
			-- Header files.
			"../../include/SDL_config_windows.h",

			"../../src/audio/directsound/*.h",
			"../../src/audio/wasapi/*.h",
			"../../src/audio/winmm/*.h",
			--"../../src/windows/SDL_directx.h", -- Not there!!
			"../../src/core/windows/*.h",
			"../../src/haptic/windows/*.h",
			"../../src/joystick/windows/*.h",
			"../../src/render/direct3d11/SDL_shaders_d3d11.h",
			"../../src/render/direct3d/*.h",
			"../../src/render/SDL_d3dmath.h",
			"../../src/thread/windows/*.h",
			"../../src/video/windows/SDL_vkeys.h",
			"../../src/video/windows/SDL_windowsclipboard.h",
			"../../src/video/windows/SDL_windowsevents.h",
			"../../src/video/windows/SDL_windowsframebuffer.h",
			"../../src/video/windows/SDL_windowskeyboard.h",
			"../../src/video/windows/SDL_windowsmessagebox.h",
			"../../src/video/windows/SDL_windowsmodes.h",
			"../../src/video/windows/SDL_windowsmouse.h",
			"../../src/video/windows/SDL_windowsopengl.h",
			"../../src/video/windows/SDL_windowsshape.h",
			"../../src/video/windows/SDL_windowsvideo.h",
			"../../src/video/windows/SDL_windowsvulkan.h",
			"../../src/video/windows/SDL_windowswindow.h",
			"../../src/video/windows/wmmsg.h",

			-- C files.
			"../../src/audio/directsound/*.c",
			"../../src/audio/winmm/*.c",
			"../../src/audio/wasapi/*.c",
			"../../src/core/windows/*.c",
			"../../src/filesystem/windows/*.c",
			"../../src/haptic/windows/*.c",
			"../../src/joystick/windows/*.c",
			"../../src/hidapi/windows/*.c",
			"../../src/loadso/windows/*.c",
			"../../src/power/windows/*.c",
			"../../src/render/direct3d11/*.c",
			"../../src/render/direct3d/*.c",
			"../../src/render/SDL_d3dmath.c",
			"../../src/video/windows/*.c"
		}

		
	inlining      "Explicit"                 -- General optimisation options.
	intrinsics    "Off"

	filter "system:windows"
		systemversion "latest"
		defines {
			          "_WINDOWS"
		}

	filter "configurations:Debug"
		defines {
			          "_DEBUG"
		}
		runtime       "Debug"
		symbols       "On"

	filter "configurations:Release"
		defines {
			          "NDEBUG"
		}
		runtime       "Release"
		optimize      "Speed"


	filter "configurations:Development"     -- These are the configurations I tend to
		defines {                           -- use in my projects, but I have added 
			          "NDEBUG"              -- the default ones anyway.
		}
		runtime       "Release"
		optimize      "On"

	filter "configurations:Ship"
		defines {
			          "NDEBUG"
		}
		runtime       "Release"
		optimize      "Speed"
