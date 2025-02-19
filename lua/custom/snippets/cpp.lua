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
})
