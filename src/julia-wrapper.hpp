//
// Created by asdfg on 5/16/2020.
//
#pragma once
#include <string>
#include <vector>
#include "amx/amx.h"
#include "julia.h"

namespace juls {

    struct JulsResource {
        const std::string path;
    };

    class JuliaWrapper {
    public:
        static void Init();

        static void LoadResource(const JulsResource &resource);

        static void LoadResources(const std::vector<JulsResource> &resources);

        static void Dispose();

        static bool HandlePublicCall(AMX* amx, const std::string &name, const cell* params, cell* retval);

    private:
        jl_module_t *gamemodeModule;
        static JuliaWrapper juliaWrapper;
    };
}
