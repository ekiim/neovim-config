# Neovim Configuration

> I decided to submit to version control my `nvim` configuration, so here it goes.

Let's start giving an overview of the general purpose of my configuration.

 - I want to edit, _yank_ and _paste_ stuff from the terminal
 - I want it to be lightweight

## Quick Start

Just run `git clone --recurse-submodules https://github.com/ekiim/neovim-config ~/.config/nvim`

> If you executed `git clone` with out `--recurse-submodules` run `git submodule update --init --recursive`.

If you want clipboard support use `xclip` (I have not tried with any other).

### Plugins

#### Color Scheme 

Let's start with the colors, I like a lot the default color scheme that _Visual Studio Code_ provides, so I decided to find a `colorscheme` that mimics it (see file `colors/codedark.vim`) and it's set as default. (This is just the colors file that is used in [`vim-code-dark`](https://github.com/tomasiser/vim-code-dark))

#### UI

##### Start Page

Also I want some kind of _Starting Page_ (most _IDE_s have one), and for this I'm using [`vim-startify`](https://github.com/mhinz/vim-startify).

##### File Tree

Then let us talk about _the file tree_ (this might be changed in the future) but I've being using using [`NERDTree`](https://github.com/preservim/nerdtree) for a while now, with a keybinding to toggle it `<C-f>`.

NERDTree has a way to toggle on and off the `netrw` by doing something they call _hijacking_, via the variable `g:NERDTreeHijackNetrw`, which I've set to `0`, this way if you open a _directory_ you'll be able to use `netwr` with out any issue (which I recommend exploring just because it has some killer features). 

##### Zen Mode

I don't use this a lot but when screen sharing it's very useful, but I'm using [`goyo.vim`](https://github.com/junegunn/goyo.vim).

#### Terminal Buffer and Man

There is not much to say here, except that there is a _special_ type of buffer which you can used, that will host a _program execution_ regularly use to show terminals and I've set a special `autocommand` for the event `TermOpen`, which sets `nonumber` and `nowrap`.

You can open a terminal buffer by running the `term` command, pressing `<F3>`, `<F4>`, or by running `:e term://bash`, `:e term://<your-program>`. (This is useful when you want to monitor a process such as `journalctl`.

Also if you follow this kind of `URI` thinking of the `term` scheme opens terminal buffers, `man`, opens manuals `:e man://bash`, and `scp` opens remote files.

> Getting in and out of the terminal buffer is done by `<C-\><C-n>` (not entirely sure if `/` is because of the `<leader>` key) and then you can do window navigation with `<C-W>{hjkl}`

#### Programming and auto completion

Neovim's team provides with some awesome and solid defaults for the _Language Server Protocol_, which I'm using by adding [`nvim-lspconfig`](https://github.com/preservim/nerdtree.git), the configuration for this is in `lua/lsp.lua`.

This will use `omnifunc` to provide completion, which is pretty good.


### Mappings, commands and usage.

I don't plan to change my keybinding anytime soon, maybe extend them, but most _personal_ keybindings should be under `<leader>`, the few mappings I consider should apply with out it are:

 - `<C-f>` Toggle File Tree.
 - `<F1>` Opens Help (this is the default mapping).
 - `<F3>` Open Horizontal Split with Terminal.
 - `<F4>` Open Vertical Split with Terminal.
 - `<F5>` I call this the _execute button_ (the first IDE I used used this key to trigger a _Build + Run_).
 - `<F8>` Toggle Spell Check.
 - `<F9>` Open a GUI File Explorer (`pcmanfm`) in `pwd`.
 - `<F11>` Zen Mode.
 - `<F12>` Open Horizontal Split with `init.nvim`.

When it comes to completion I can only say that neovim has some a nice completion system (I don't understand why people want to create super complex plugins for this) that turns out to be really effective when you connect to an _lsp_, for more on this I'll refer you to `:help insert_expand` and `:help complete-functions`, in which you'll find (just listing what I consider the most useful, but all are valid)

 - `<C-X><C-N>` keywords in the current file.
 - `<C-X><C-F>` filenames
 - `<C-X><C-O>` omni completion (the one feed by the `lsp` plugin)
 - `<C-X>s` spell (careful to not press `<C-X><C-S>` that might suspend the terminal)
 - `z=` When you are looking for _grammatical_ errors you can put the cursor on top of a word and hit the combination to find suggestions.

#### General recommendation

You can use `tabnew` to open a new tab and navigate them with `tabn` and `tabp` commands, each tab (even window) can have it's own `pwd` via the commands `tcd` and `lcd` which will affect your _tab's_ `tree` instance (you can have multiple tabs on multiple directories), terminals will open in the `pwd` assign to the _window_ you invoke them from.

You have a _buffers list_ that you can see with `:ls` and you can navigate them with `:b <filename-substring>` or with `:b <buffer-number>`, this list is universal across the editor's session, so no matter in which tab you are you'll be able access them.


### Installing Plugins

For some reason, people have been following something I like to think as the _GitHub convention_ which I don't love, in which you specify `<user>/<repo>` and automagically you get the plugin installed. When I use regular `vim`, I used [`vim-pathogen`](https://github.com/tpope/vim-pathogen), which is dead simple, **luckily** neovim implemented the `packadd` which turns `pathogen` obsolete. With the `packadd` you can create a directory `pack` in your `~/.config/nvim` directory, and then start placing your _plugins_ inside (following the rules `:help packadd`).

My recommendation (and what I do) is try to make _separation of concerns_ by having (initially) two directories under `pack`, `neovim` and `ui`. In `neovim` I'm going to place any plugin _officially supported_ by the neovim team such as `nvim-lspconfig` and in `ui` I'll put anything that _affects_ the user interface (such as the file tree or landing page plugins I choose).

> Note: When I resume and decide to re-upload the configuration I'll be adding _language support_ (`languages`), something like `polyglot` but more suited for my needs.

[`git-submodules`](https://git-scm.com/book/en/v2/Git-Tools-Submodules) is a wonderful tool, and I think that it can help organize this repository so I would encourage anyone to use it to keep up to date your configurations if you decide to follow a pattern like the one I'm proposing.

#### Steps to install a plugin

Create a directory under `pack` (I recommend labeling the by categories) let's say `<category>`, then add it as a `git submodule`, `git submodule add <repo-url> pack/<category>/opt/<packname>` and then commit the files to version control and _DONE_.

## Configurations Future

Because this is my personal configuration I might not be uploading all as it is, rather installing stuff, and eventually documenting it to go in to the main branch in this public repo. What I'm sure I need and will work on this in the near future is:

 - [ ] Include multiple language support.
 - [ ] Tree-sitter? (not sure)
 - [ ] Include programming plugins.
    - [ ] Comment Toggle.
    - [ ] Debug Breakpoint Markers.
 - [ ] Including a set of tools for grammar.
 - [ ] Including a set of tools for live note taking.
 - [ ] Include my personal `noffice` plugin which allows `nvim` to work as email client
