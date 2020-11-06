//
// Created by asdfg on 5/16/2020.
//

#include <algorithm>
#include <iostream>
#include <dlfcn.h>
#include <julia.h>
#include "julia-wrapper.hpp"
#include "typeconverter.hpp"
#include "callbacks.hpp"

namespace jules {
    JuliaWrapper JuliaWrapper::juliaWrapper {};

    void JuliaWrapper::Init() {
        dlopen("libjulia.so", RTLD_NOW | RTLD_GLOBAL);
        jl_init();
        jl_eval_string("println(\"Hello from Julia!\")");
    }

    void JuliaWrapper::LoadResource(const JulsResource &resource) {
        std::cout << "Loading " << resource.path << std::endl;
        juliaWrapper.gamemodeModule = reinterpret_cast<jl_module_t *>(jl_eval_string("include(\"res/testgm.jl\")"));
        AssertNoException();
    }

    void JuliaWrapper::LoadResources(const std::vector<JulsResource> &resources) {
        for (const auto& resource: resources) {
            JuliaWrapper::LoadResource(resource);
        }
    }

    bool JuliaWrapper::HandlePublicCall(AMX* amx, const std::string &name, const cell* params, cell* retval) {
//        std::cout << "Received a call for " << name << std::endl;

        // Change to registered callbacks
        const auto eventIter = Event::sampCallbacks.find(name);
        if (eventIter == Event::sampCallbacks.end()) {
            std::cout << "Skipping the call" << std::endl;
            return false;
        }
        jl_function_t* callback = jl_get_function(juliaWrapper.gamemodeModule, name.c_str());
        if (callback == nullptr) {
//            std::cout << "Julia impl not found" << std::endl;
            return false;
        }
        // TODO: check if callback exists
        // if callback == nullptr whatever
        const Event::Signature &event = eventIter->second;
        auto nargs = event.argumentTypes.size();
        jl_value_t **args;
        JL_GC_PUSHARGS(args, nargs);
        for (auto i = 0; i < nargs; ++i) {
            const cell *param = &params[1 + i];
            const Argument::Type &argType = event.argumentTypes.at(i);

            switch (argType) {
                case Argument::kFloat: {
                    auto value = TypeConverter::fromAmxFloat(*param);
                    args[i] = TypeConverter::toJulia(value);
                    break;
                }
                case Argument::kInt: {
                    auto value = TypeConverter::fromAmx<int32_t>(*param);
                    args[i] = TypeConverter::toJulia(value);
                    break;
                }
                case Argument::kUint: {
                    auto value = TypeConverter::fromAmx<int32_t>(*param); // TODO: watch for uint32
                    args[i] = TypeConverter::toJulia(value);
                    break;
                }
                case Argument::kFloatArray: {
                    auto value = TypeConverter::fromAmxFloatArray(amx, *param, *(param+1));
                    args[i] = TypeConverter::toJulia(value);
                    // TODO: skip array size params, i.e. do ++i
                    break;
                }
                case Argument::kArray: {
                    auto value = TypeConverter::fromAmxArray<uint32_t>(amx, *param, *(param+1));
                    args[i] = TypeConverter::toJulia(value);
                    break;
                }
                case Argument::kString:{
                    std::unique_ptr<char[]> value = TypeConverter::fromAmxString(amx, *param);
                    args[i] = TypeConverter::toJulia(value.release());
                    break;
                }
            }
        }
//        std::cout << "Calling... ";
        jl_value_t *resultValue = jl_call(callback, args, event.argumentTypes.size());

        if (AssertNoException() && retval != nullptr) {
            auto result = jl_unbox_int32(resultValue);
//            std::cout << "Result is " << result << " ";
            *retval = static_cast<cell>(result);
        }
//        std::cout << "Done" << std::endl;
        JL_GC_POP();
        return true;
    }

    void JuliaWrapper::Dispose() {
        jl_atexit_hook(0);
    }

    bool JuliaWrapper::AssertNoException() {
        if (jl_exception_occurred()) {
            jl_call2(jl_get_function(jl_base_module, "showerror"),
                     jl_stderr_obj(),
                     jl_exception_occurred());
            jl_printf(jl_stderr_stream(), "\n");
            return false;
        }
        return true;
    }
}
