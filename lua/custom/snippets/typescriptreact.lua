require("luasnip.session.snippet_collection").clear_snippets "typescriptreact"

local ls = require "luasnip"

local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local extras = require("luasnip.extras")
local rep = extras.rep
local c = ls.choice_node
local f = ls.function_node
local l = require("luasnip.extras").lambda

local fmt = require("luasnip.extras.fmt").fmt

-- Function to get the current filename
local function get_filename(_, snip)
  return snip.env.TM_FILENAME_BASE or "default_filename.txt"
end

ls.add_snippets("typescriptreact", {
   s(
      "useS",
      fmt("const [{}, set{setter}] = useState({})", {
         i(1, "state"),
         i(2, "initialValue"),
         setter = l(l._1:sub(1, 1):upper() .. l._1:sub(2, -1), 1)
      })
   ),
   s(
      "useE",
      fmt(
         [[
         useEffect(() => {{
           {}
         }}, [{}]
         ]],
         {
            i(1, "body"),
            i(2, "dependency")
         }
      )
   ),
   s(
      "rc",
      fmt(
         [[
            type {}Props = {{
            }};

            export default function {}({{}}: {}Props) {{
              return (
                <>
                  {}
                </>
              );
            }}
         ]],
         {
            f(get_filename, {}),
            f(get_filename, {}),
            f(get_filename, {}),
            i(1, "<h1>Hello World</h1>")
         }
      )
   )
})
