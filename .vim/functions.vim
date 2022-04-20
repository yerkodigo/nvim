"CHANGE THEME BETWEEN DARK AND LIGHT MODE
:function! ChangeTheme(variant)
  ":let THEME = a:theme
  :if a:variant ==# 'dark'
    :set background=dark
    :colorscheme PaperColor
    :hi CursorColumn gui=bold cterm=bold ctermbg=8
    :hi CursorLine gui=bold cterm=bold ctermbg=8
  :elseif a:variant ==# 'light'
    :set background=light
    :colorscheme PaperColor
    :hi CursorColumn gui=bold cterm=bold ctermbg=6
    :hi CursorLine gui=bold cterm=bold ctermbg=6
  :endif
:endfunction
