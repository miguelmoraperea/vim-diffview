fun! VimDiffView(commitHash)
    let g:vim_diffview_commit = a:commitHash
    lua for k in pairs(package.loaded) do if k:match("^vim%-diffview") then package.loaded[k] = nill end end
    lua require("vim-diffview").diff(vim.g.vim_diffview_commit)
endfun

fun! VimDiffNext()
    lua for k in pairs(package.loaded) do if k:match("^vim%-diffview") then package.loaded[k] = nill end end
    lua require("vim-diffview").diffNext()
endfun

fun! VimDiffPrev()
    lua for k in pairs(package.loaded) do if k:match("^vim%-diffview") then package.loaded[k] = nill end end
    lua require("vim-diffview").diffPrev()
endfun
