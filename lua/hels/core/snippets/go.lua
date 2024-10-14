require('luasnip.session.snippet_collection').clear_snippets 'go'

local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node

local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('go', {
  -- fmt {} --> some snippet node
  -- i{INDEX} i = insert

  -- if err
  s(
    'ier',
    fmt(
      [[
  if err != nil {{
    return {}
  }}
  ]],
      { i(1) }
    )
  ),

  -- wrap err
  s(
    'errw',
    fmt(
      [[
fmt.Errf("{}, %w", err)
    ]],
      { i(1) }
    )
  ),

  -- method
  s(
    'meth',
    fmt(
      [[
  func ({} {}) {}({}) {} {{
    {}
  }}
    ]],
      { i(1, 'receiver'), i(2, 'obj'), i(3, 'name'), i(4), i(5), i(6) }
    )
  ),

  -- function
  s(
    'func',
    fmt(
      [[
    func {}({}) {} {{
      {}
    }}
    ]],
      { i(1, 'name'), i(2), i(3), i(4) }
    )
  ),
})
