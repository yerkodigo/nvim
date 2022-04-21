"CHANGE THEME BETWEEN DARK AND LIGHT MODE
:function! ChangeTheme(...)
  :if a:1 ==# 'dark'
    :set background=dark
    execute 'colorscheme ' . a:2
    :hi CursorColumn gui=bold cterm=bold ctermbg=8
    :hi CursorLine gui=bold cterm=bold ctermbg=8
  :elseif a:1 ==# 'light'
    :set background=light
    execute 'colorscheme ' . a:2
    :hi CursorColumn gui=bold cterm=bold ctermbg=6
    :hi CursorLine gui=bold cterm=bold ctermbg=6
  :endif
  :echo 'Changed theme to ' . a:2 . ' ' . a:1
:endfunction
