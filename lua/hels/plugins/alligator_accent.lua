-- " g:accent_color or g:accent_colour changes the accent colour.
-- " one of
-- let g:accent_colour = 'yellow' " the default
-- let g:accent_colour = 'orange'
-- let g:accent_colour = 'red'
-- let g:accent_colour = 'green'
-- let g:accent_colour = 'blue'
-- let g:accent_colour = 'magenta'
-- let g:accent_colour = 'cyan'
--
-- " g:accent_darken makes the background and some text colours darker.
-- let g:accent_darken = 0 " the default
-- let g:accent_darken = 1
--
-- " g:accent_invert_status inverts the colour of the status line text.
-- let g:accent_invert_status = 0 " the default
-- let g:accent_invert_status = 1
--
-- " g:accent_auto_cwd_colour sets the accent colour using a hash of the current directory.
-- let g:accent_auto_cwd_colour = 0 " the default
-- let g:accent_auto_cwd_colour = 1
--
-- " g:accent_no_bg stops the background colour being set, which will use the terminal default
-- let g:accent_no_bg = 0 " the default
-- let g:accent_no_bg = 1
--
-- " after changing settings, you'll need to re-apply the colorscheme
-- colorscheme accent

return {
  'alligator/accent.vim',
  priority = 1000,
  init = function()
    vim.g.accent_color = 'blue'
    vim.g.accent_darken = true

    vim.cmd.colorscheme 'accent'
  end,
}
