-- Dim unfocused windows using vimade
return {
  "TaDaa/vimade",
  event = "VeryLazy", -- Load on VimEnter for immediate effect
  config = function()
    -- Enable focus fading
    vim.g.vimade = {
      enablefocusfading = 1,
      fadeduration = 300,
      fadelevel = 0.7,
    }

    -- Use autocommands to adjust fade level for specific file types
    vim.cmd([[
      augroup VimadeCustomFadeLevel
        autocmd!
        autocmd FileType nerdtree let g:vimade.fadelevel = 0.5 -- Example for specific file type
      augroup END
    ]])
  end,
}
