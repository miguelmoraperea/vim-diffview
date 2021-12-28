# vim-diffview

An effective way to understand how code evolves is by looking at the difference between one commit
and another, for this reason having a practical and easy to use diff view feature is important.

This plugin will generate a quick fix list with the name of the files that changed, and include a
diff view of those changes.

![demo gif](media/vim-diffview.gif)

## Install

```viml
Plug 'miguelmoraperea/vim-diffview'
```

**Requirements: *nvim v0.5***

```viml
Plug 'tpope/vim-fugitive '
```

## Usage

Call *VimDiffView* with the commit hash you are interesting to view.

```viml
:call VimDiffView("<commitHash>")<CR>
```

## Configuration

If you wish you could add these remaps to your *vimrc* file:

```viml
nnoremap <Leader>vd :call VimDiffView()<CR>
nnoremap <Leader>nd :call VimDiffNext()<CR>
nnoremap <Leader>pd :call VimDiffPrev()<CR>
```

## Status

- [X] Add basic diff view based on a target commit.
- [ ] Add support to unfold folds automatically.

## Contributions

If you find this plugin useful and would like to make improvements, please by all means,
contributions are greatly appreciated!.
