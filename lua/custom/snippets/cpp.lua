require("luasnip.session.snippet_collection").clear_snippets "cpp"

local ls = require "luasnip"

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local extras = require("luasnip.extras")
local rep = extras.rep
local c = ls.choice_node
local f = ls.function_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("cpp", {
    s("main", fmt(
        [[
    #include <iostream>

   int main(int argc, char* argv[]) {{
        std::cout << "Hello World\n";
        {}
        return 0;
    }}
    ]], { i(1) })),

    s("class", fmt(
        [[
    #pragma once
    class {} {{
    public:
        explicit {}();
        ~{}();
    private:
        {}
    }};
    ]], { i(1), rep(1), rep(1), i(2) })),

    s("test", fmt(
        [[
    #include <gtest/gtest.h>
    using namespace ::testing;
    class {}Test : public Test {{
    public:
        {}Test() {{}}

    protected:
        {} patient_;
    }};
    TEST_F({}Test, {}) {{
        {}
    }}
    ]], { i(1), rep(1), rep(1), rep(1), i(2, "TestName"), i(3) })),
    s("mock", fmt(
        [[
    #include <gmock/gmock.h>
    class Mock{} : public I{} {{
    public:
        MOCK_METHOD({}, {}, (), (override));
    }};
    ]], { i(1), rep(1), i(2, "MethodName"), i(3, "ReturnType") })),


})
