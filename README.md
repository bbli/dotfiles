# Dotfiles

In an effort to become a hotkey spammer like Emacs users/become better at vim, I have created the following guideline for assigning hotkeys.
* **Leader(Space)**: Default memomic maps. Most of my key bindings are here
* **Semi-Colon**: Short command mode stuff in which I don't need to see the input(:w)
* **Leader Leader**: changes to files that conflict with memomic maps(commenting,formatting)

* **Local Leader(-)**: External Interactions(markdown preview,edit config files)

## Things to do on Server
* Install conda environment
* Install neovim appimage
* copy ipython kernel specs

* **If git version is too old -> just rsync over my plugin repo directory**

## List of coc extensions
* coc-yank -> for yank history across vim instances
* coc-ultisnips -> so I can be reminded of snippets
* coc-pairs -> has options to not do for certain files
* coc-lines
* coc-lists
* coc-snippets -> apparantly for lsp supported snippets. Doesn't really work though

* coc-python

* Q: Why do I need to set a list of global extensions?
* TODO: I should get tags working

## HOW TO
* tab during fuzzy for actions

## Useful coc-lists
* mru-Only in the cwd, unlike fzf History
* grep-If I don't need command line options
* yank

## FZF autocompletes
* ssh
* vim
* `'` for exact match, `^` for exact prefix match, `$` for exact suffix match
