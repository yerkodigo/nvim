local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Snippet para TODO personalizado
ls.add_snippets("all", {
  s("ycortes", {
    t("-- TODO: ycortes - "),
  }),
})
