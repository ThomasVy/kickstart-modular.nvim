require("luasnip.session.snippet_collection").clear_snippets "cmake"

local ls = require "luasnip"

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local extras = require("luasnip.extras")
local rep = extras.rep
local c = ls.choice_node
local f = ls.function_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("cmake", {
    s("lib", fmt(
        [[
        set(PROJECT_NAME "{}")

        add_library(${{PROJECT_NAME}} STATIC "{}")
        if(WIN32)
            target_sources(${{PROJECT_NAME}} PRIVATE "src/windows_platform_info.cpp")
        elseif(UNIX)
            target_sources(${{PROJECT_NAME}} PRIVATE "src/unix_platform_info.cpp")
        endif()

        # being a cross-platform target, we enforce standards conformance on MSVC
        target_compile_options(
            ${{PROJECT_NAME}}
            PUBLIC "$<$<COMPILE_LANG_AND_ID:CXX,MSVC>:/permissive->"
        )

        # Link dependencies
        target_link_libraries(${{PROJECT_NAME}} PRIVATE common_cpp)

        target_include_directories(
            ${{PROJECT_NAME}}
            INTERFACE $<BUILD_INTERFACE:${{CMAKE_CURRENT_SOURCE_DIR}}/include>
            PRIVATE $<BUILD_INTERFACE:${{CMAKE_CURRENT_SOURCE_DIR}}/include/{}>
        )
    ]], { i(1), rep(1), rep(1) }))
})
