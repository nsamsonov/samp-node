//
// Created by asdfg on 5/17/2020.
//

#pragma once
#include <cstdint>
#include <string>
#include <type_traits>
#include <memory>
#include <functional>
#include <stdint-gcc.h>
#include <julia.h>
#include "amx/amx.h"
#include "logger.hpp"

namespace jules {
    class Argument {
    public:
        enum Type {
            kFloat,
            kInt,
            kUint,
            kFloatArray,
            kArray,
            kString,
        };

        static constexpr Type fromChar(const char &c) {
            switch (c) {
                case 'f':
                    return kFloat;
                case 'i':
                    return kUint;
                case 'd':
                    return kInt;
                case 'a':
                    return kArray;
                case 'v':
                    return kFloatArray;
                case 's':
                    return kString;
                default:
                    throw std::invalid_argument("Unknown argument type");
            }
        }
    };

    class TypeConverter {
    public:
        template <typename T, std::enable_if_t<std::is_integral<T>::value, int> = 0>
        static T fromAmx(const cell &cell) {
            return static_cast<T>(cell);
        }

        static float fromAmxFloat(const cell &cell) {
            return amx_ctof(cell);
        }

        static std::unique_ptr<char[]> fromAmxString(AMX* amx, const cell &address_cell);

        template <typename T, std::enable_if_t<std::is_integral<T>::value, int> = 0>
        static std::vector<T> fromAmxArray(AMX* amx, const cell &address_cell, const cell &size_cell,
                                                    std::function<T(const cell &)> mapper = fromAmx<T>) {
            return fromAmxArray_internal(amx, address_cell, size_cell, move(mapper));
        }

        static std::vector<float> fromAmxFloatArray(AMX* amx, const cell &address_cell, const cell &size_cell,
                                           std::function<float(const cell &)> mapper = fromAmxFloat) {
            return fromAmxArray_internal(amx, address_cell, size_cell, move(mapper));
        }

        static jl_value_t* toJulia(uint32_t value) {
            return jl_box_uint32(value);
        }

        static jl_value_t* toJulia(int32_t value) {
            return jl_box_int32(value);
        }

        static jl_value_t* toJulia(float value) {
            return jl_box_float32(value);
        }

        static jl_value_t* toJulia(uint32_t* data, const uint16_t length, bool dispose) {
            jl_value_t* array_type = jl_apply_array_type(reinterpret_cast<jl_value_t*>(jl_uint32_type), 1);
            jl_array_t* array = jl_ptr_to_array_1d(array_type, reinterpret_cast<void *>(data), length, dispose);
            return reinterpret_cast<_jl_value_t*>(array);
        }

        static jl_value_t* toJulia(float* data, const uint16_t length, bool dispose) {
            jl_value_t* array_type = jl_apply_array_type(reinterpret_cast<jl_value_t*>(jl_float32_type), 1);
            jl_array_t* array = jl_ptr_to_array_1d(array_type, reinterpret_cast<void *>(data), length, dispose);
            return reinterpret_cast<jl_value_t*>(array);
        }

        static jl_value_t* toJulia(std::vector<uint32_t> &list) {
            return toJulia(list.data(), list.size(), false);
        }

        static jl_value_t* toJulia(std::vector<float> &list) {
            return toJulia(list.data(), list.size(), false);
        }

        static jl_value_t* toJulia(const char *str) {
            return jl_cstr_to_string(str);
        }

        static jl_value_t* toJulia(const std::string &str) {
            return jl_pchar_to_string(str.c_str(), str.length());
        }

    private:
        template <typename T>
        static std::vector<T> fromAmxArray_internal(AMX* amx, const cell &address_cell, const cell &size_cell,
                std::function<T(const cell &)> mapper);
    };
}
