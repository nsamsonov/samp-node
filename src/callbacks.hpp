#pragma once

#include <stdint-gcc.h>

#include <utility>
#include <unordered_map>
#include "v8.h"
#include "amx/amx.h"
#include "typeconverter.hpp"

namespace sampnode
{
	class callback
	{
	public:

		struct data {
			std::string name;
			std::string param_types;
			std::string alias;
		};

		static void init();
		static void add_event_definitions(v8::Isolate* isolate, v8::Local<v8::ObjectTemplate>& global);
		static void call(const v8::FunctionCallbackInfo<v8::Value>& info);
		static void call_float(const v8::FunctionCallbackInfo<v8::Value>& info);
	};

	extern bool js_calling_public;
}

namespace jules {
    class Event {
    public:
        struct Signature {
            const std::string name;
            const std::vector<Argument::Type> argumentTypes;

            Signature(std::string name, const std::string &argTypes): name(std::move(name)), argumentTypes(fromStr(argTypes)) {
            }

        private:
            static std::vector<Argument::Type> fromStr(const std::string &argTypes) {
                std::vector<Argument::Type> result;
                for (char const &c: argTypes) {
                    result.push_back(Argument::fromChar(c));
                }
                return result;
            }
        };

        static const std::unordered_map<std::string, Event::Signature> sampCallbacks;

    private:
        static std::unordered_map<std::string, Event::Signature> eventMapFromList(const std::vector<Event::Signature> &events) {
            std::unordered_map<std::string, Event::Signature> map;
            for (auto &event : events) {
                map.insert({ event.name, event });
            }
            return map;
        }
    };

    constexpr uint16_t length(const char* str)
    {
        return *str ? 1 + length(str + 1) : 0;
    }
}
