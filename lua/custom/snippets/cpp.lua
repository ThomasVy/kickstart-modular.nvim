require('luasnip.session.snippet_collection').clear_snippets 'cpp'

local ls = require 'luasnip'

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require 'luasnip.extras'
local rep = extras.rep
local c = ls.choice_node
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('cpp', {
  s(
    'testfile',
    fmt(
      [[
    #include "stdafx.h"
    class {1} : public ::testing::Test {{
    public:
      {1}() {{
        {2}
      }}
    protected:
    }};
    ]],
      {
        t(vim.fn.expand '%:t:r'),
        i(1),
      }
    )
  ),

  s(
    'main',
    fmt(
      [[
      #include <iostream>
      int main() {{
          {}
          std::cout << "hello world" << std::endl;
          return 0;
      }}
    ]],
      i(1)
    )
  ),

  s(
    'LOG',
    fmt([[{}("{}", {});]], {
      c(1, {
        t 'LOG_INFO',
        t 'LOG_ERROR',
        t 'LOG_DEBUG',
        t 'LOG_EMERGENCY',
        t 'LOG_ALERT',
        t 'LOG_CRITICAL',
        t 'LOG_WARNING',
        t 'LOG_SPAM',
        t 'LOG_NOTICE',
      }),
      i(2),
      i(3),
    })
  ),
})
