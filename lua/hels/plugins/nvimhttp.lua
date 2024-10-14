return {
  'BlackLight/nvim-http',

  config = function()
    vim.keymap.set('n', '<leader>rr', function ()
      vim.cmd ':Http'
    end)
  end,
}
