//
// Created by asdfg on 5/17/2020.
//

#include <vector>
#include "typeconverter.hpp"

namespace juls {
    template<typename T>
    std::vector<T> TypeConverter::fromAmxArray_internal(AMX *amx, const cell &address_cell, const cell &size_cell,
                                                        std::function<T(const cell &)> mapper) {
        cell* array = nullptr;
        if (amx_GetAddr(amx, address_cell, &array) != AMX_ERR_NONE) {
            L_ERROR << "Can't get array address";

            throw std::runtime_error("Can't get array address");;
        }
        auto size = fromAmx<uint32_t>(size_cell);
        L_INFO << "Array size: " << size;

        std::vector<T> result(size);
        for (int j = 0; j < size; j++) {
            result.push_back(mapper(array[j]));
        }
        return result;
    }

    std::unique_ptr<char[]> TypeConverter::fromAmxString(AMX *amx, const cell &address_cell) {
        cell* maddr = nullptr;
        if (amx_GetAddr(amx, address_cell, &maddr) != AMX_ERR_NONE) {
            L_ERROR << "Can't get string address";
            throw std::runtime_error("Can't get string address");
        }
        int len = 0;
        amx_StrLen(maddr, &len);
        std::unique_ptr<char[]> sval(new char[len + 1]);
        if (amx_GetString(sval.get(), maddr, 0, len + 1) != AMX_ERR_NONE) {
            L_ERROR << "Can't get string value";
            throw std::runtime_error("Can't get string value");
        }
        return sval;
    }
}
