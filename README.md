# MultiHook

> Universal graphical hook for Windows apps, although it should work on Linux too if you implement it correctly, that will display an ImGui Demo Window as an example.

![License](https://img.shields.io/github/license/RegularLunar/imgui-multi-hook?style=for-the-badge&color=10b981)
![Stars](https://img.shields.io/github/stars/RegularLunar/imgui-multi-hook?style=for-the-badge&color=f59e0b)
![Last Commit](https://img.shields.io/github/last-commit/RegularLunar/imgui-multi-hook?style=for-the-badge&color=6366f1)

---

### Supported Backends

- DX9 + DX9Ex
- DX10
- DX11
- DX12
- OpenGL
- Vulkan

---

### Building From Source

Prerequisite:
- **Visual Studio 2022**
- **premake5** (premake5 must be in your PATH)
- **Windows SDK**
- **Vulkan SDK**

Building:

```bash
git clone https://github.com/RegularLunar/imgui-multi-hook.git
cd imgui-multi-hook
premake5 vs2022
```

Then open `MultiHook.sln` in Visual Studio, Go to [SetRenderingBackend](https://github.com/RegularLunar/imgui-multi-hook/blob/e87bdb306f78b9fe425e03ef360d671d70c2d3d3/MultiHook/src/dllmain.cpp#L17) and choose your backend. Then build!

---

# How it works

## DirectX

We create a 'dummy device' and a 'dummy swapchain' (for DirectX10 and higher). See the `CreateDeviceD3DX` function in every DirectX backend. [See DX12 example 'CreateDeviceD3D12'](https://github.com/bruhmoment21/UniversalHookX/blob/main/UniversalHookX/src/hooks/backend/dx12/hook_directx12.cpp#L43-L72). The point is to get a pointer to the vTable to get the required functions addresses. We release it right after getting the pointers because we won't use our 'dummy device' and 'dummy swapchain' for drawing. [See code used in DX12 backend hook.](https://github.com/bruhmoment21/UniversalHookX/blob/main/UniversalHookX/src/hooks/backend/dx12/hook_directx12.cpp#L195-L259)

## OpenGL

We hook wglSwapBuffers which is an exported function in opengl32.dll. [See code used in OpenGL backend hook.](https://github.com/bruhmoment21/UniversalHookX/blob/main/UniversalHookX/src/hooks/backend/opengl/hook_opengl.cpp#L39-L56)

## Vulkan

We create a 'dummy device' to get the required functions addresses. The point is to hook into [vkQueuePresentKHR](https://www.khronos.org/registry/vulkan/specs/1.3-extensions/man/html/vkQueuePresentKHR.html) where we will submit the queue with our data from our command pool and our command buffer. [See code used in Vulkan backend hook.](https://github.com/bruhmoment21/UniversalHookX/blob/main/UniversalHookX/src/hooks/backend/vulkan/hook_vulkan.cpp#L314-L349)

---

### Support

Issues and PRs are welcome. For major changes, please open an [issue](https://github.com/RegularLunar/imgui-multi-hook/issues) first.

### Acknowledgements / Credits

- [bruhmoment21](https://github.com/bruhmoment21/UniversalHookX) - Literally everything. All i did was fork their project and clean it up / update it.

---

<sub>Made with 💜 by [RegularLunar](https://github.com/RegularLunar)</sub>
