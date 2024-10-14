require('luasnip.session.snippet_collection').clear_snippets 'go'

local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node

local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('all', {
  -- print large banner
  s(
    'plb',
    fmt(
      [[
 **************************************************************** 
 * {}
 **************************************************************** 
 {}
  ]],
      { i(i), i(2) }
    )
  ),

  -- print small banner
  s(
    'psb',
    fmt(
      [[
 ***************  {}  ***************
 {}
  ]],
      { i(i), i(2) }
    )
  ),
})
