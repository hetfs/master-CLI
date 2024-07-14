# What is LAZY.NVIM UI?

LAZY.NVIM UI is a user interface provided by the **lazy.nvim** plugin manager for Neovim. It offers a powerful and modern interface to manage Neovim plugins, making it easier to customize and extend your Neovim configuration.

### Key Features

1. **Plugin Management**: Allows users to install, update, and remove plugins through a comprehensive and intuitive UI.
2. **Fast Startup**: Optimizes Neovim startup times by using automatic caching and bytecode compilation.
3. **User-Friendly**: Simplifies the process of managing configurations and plugin setups, especially for those who prefer a more visual approach.

### Components

- **Profile Tab**: Helps users understand startup times and performance metrics, making it easier to debug and optimize configurations.
- **Installation and Updates**: Streamlines the process of keeping plugins up-to-date and ensures compatibility with the latest Neovim versions.

LAZY.NVIM UI is designed to be a convenient and efficient tool for both new and experienced Neovim users, enhancing the overall experience of customizing and managing the editor.
LazyVim includes several plugins to simplify discovering and using key mappings for various features.
Two essential plugins are **which-key** and **Telescope**.

## **which-key**

**which-key** is a Neovim plugin that displays a popup with possible key bindings for the command sequence you have started typing.
This helps you quickly learn and remember key mappings. Here are some default key bindings provided by LazyVim:

- **Find File**: `f`
- **New File**: `n`
- **Recent Files**: `r` (restore the previous session)
- **Find Text**: `g`
- **Config**: `c` (navigate to your Neovim config directory)
- **Lazy Extras**: `x`
- **Lazy**: `l` (comprehensive UI to install, update, debug, profile, uninstall)
- **Quit**: `q`

## **Telescope**

**Telescope** is a powerful fuzzy finder plugin for Neovim.
It allows you to quickly search and execute key mappings and other commands.

### How to Use Telescope with Keymaps

1. **Open Telescope**: Enter command mode in Neovim and run `:Telescope keymaps`, or use the shortcut `<leader>sk` (assuming the default `<leader>` is Space).
2. **Navigate**: Use `CTRL+n` and `CTRL+p` to move up and down the list.
3. **Search for Mappings**: For instance, if you want to find mappings for closing notifications, type `notification`. Telescope will show the `<leader>un` mapping to delete all notifications.
4. **Execute**: Once you find the desired keymap, press Enter to execute it.

Notifications can sometimes obstruct your view of the source code. You can use the `<leader>un` mapping to quickly clear all notifications.

LazyVim includes **which-key** and **Telescope** plugins to help users efficiently discover and use key mappings. **which-key** shows a popup with available key bindings as you type, making it easy to remember commands. **Telescope** provides a fuzzy finder interface to search and execute keymaps, significantly enhancing your workflow in Neovim.


leader cm toinstall extras plugins
    --import your extras modules here
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "LazyVim.plugins.extras.ui.mini-animate" },

## Keyboard Shortcuts in Neovim

<https://medium.com/@shaikzahid0713/the-neovim-series-32163eb1f5d0>

The next steps after adding the builtin features, we have to add some custom keybindings for ease of use of our IDE.
Create a new keymaps.lua file in your lua directory.

---

vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)
---

**Keyboard Shortcuts**

---bash

local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

    -- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts) -- left window
keymap("n", "<C-k>", "<C-w>k", opts) -- up window
keymap("n", "<C-j>", "<C-w>j", opts) -- down window
keymap("n", "<C-l>", "<C-w>l", opts) -- right window

-- Resize with arrows when using multiple windows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<c-down>", ":resize +2<cr>", opts)
keymap("n", "<c-right>", ":vertical resize -2<cr>", opts)
keymap("n", "<c-left>", ":vertical resize +2<cr>", opts)

-- navigate buffers
keymap("n", "<tab>", ":bnext<cr>", opts) -- Next Tab
keymap("n", "<s-tab>", ":bprevious<cr>", opts) -- Previous tab
keymap("n", "<leader>h", ":nohlsearch<cr>", opts) -- No highlight search

-- move text up and down
keymap("n", "<a-j>", "<esc>:m .+1<cr>==gi", opts) -- Alt-j
keymap("n", "<a-k>", "<esc>:m .-2<cr>==gi", opts) -- Alt-k

-- insert --
-- press jk fast to exit insert mode
keymap("i", "jk", "<esc>", opts) -- Insert mode -> jk -> Normal mode
keymap("i", "kj", "<esc>", opts) -- Insert mode -> kj -> Normal mode

-- visual --
-- stay in indent mode
keymap("v", "<", "<gv", opts) -- Right Indentation
keymap("v", ">", ">gv", opts) -- Left Indentation

-- move text up and down
keymap("v", "<a-j>", ":m .+1<cr>==", opts)
keymap("v", "<a-k>", ":m .-2<cr>==", opts)

-- Visual Block --
-- Move text up and down
    --Terminal --
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

--Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

---

[Integrate Neovim inside VSCode](https://medium.com/@shaikzahid0713/integrate-neovim-inside-vscode-5662d8855f9d)
[VSCode Neovim](https://github.com/vscode-neovim/vscode-neovim)
[Code Completion for Neovim using Lazy](https://medium.com/@shaikzahid0713/code-completion-for-neovim-6127401ebec2)

First Steps After Installing Neovim
If you have installed Neovim successfully then we can get started with the configuration and turn it into a full featured IDE.
The initial step is to create a file named init.lua inside your nvim folder. This is the main configuration file which is the root of your Neovim Configuration. We will split the configuration in many different files and source them in our main configuration file (init.vim).
This nvim directory should reside in a location that depends on your Operating System.
If you are using Linux/MacOS, then the location should be ~/.config and the absolute path should be ~/.config/nvim/init.lua
If you are using Windows Operating System, then the location is C:\Users\your_username\Appdata\local\ and the absolute path should be C:\Users\your_username\Appdata\local\nvim\init.lua



## What is telescope.nvim?

`telescope.nvim` is a highly extendable fuzzy finder plugin for Neovim. It allows users to quickly find, filter, preview, and pick items from various lists within Neovim, enhancing productivity and efficiency. Built on the latest features from Neovim's core, Telescope is designed to be fast and flexible, supporting various sources and extensions.

**Key Features**:

1. **Fuzzy Finding**: Enables rapid searching and filtering of items like files, buffers, and commands.
2. **Extensibility**: Supports numerous extensions for additional functionality, such as browsing files, managing keymaps, and more.
3. **Customization**: Offers a wide range of customization options to tailor the experience to individual preferences.
4. **Interactive Preview**: Provides real-time previews of search results, enhancing the user experience.

To get started with `telescope.nvim`, you typically add it to your Neovim configuration, set up key mappings, and configure sources and extensions as needed.

## What is telescope-file-browser.nvim?

`telescope-file-browser.nvim` is a file browser extension for the `telescope.nvim` plugin in Neovim. It provides a user-friendly interface for managing files and directories within Neovim, allowing users to create, delete, rename, and move files and folders seamlessly. This extension leverages the power of `telescope.nvim` to offer an efficient and interactive file browsing experience.

**Key Features**:

1. **File and Directory Management**: Allows synchronized creation, deletion, renaming, and moving of files and directories.
2. **Seamless Integration**: Integrates smoothly with `telescope.nvim`, utilizing its search and navigation capabilities.
3. **Customizability**: Supports various customization options for appearance and functionality.

To set up and use `telescope-file-browser.nvim`, you typically need to add it to your Neovim configuration and set up key mappings for easy access and operation. [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim)


---bash
return {
  "nvim-telescope/telescope-file-browser.nvim",
  depencies = { "nvim-telescope.nvim", "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>sB",
      ":Telescope file_browser path=%:p:h=%:p:h<cr>",
      desc = "Browser Files",
    },
  },
  config = function()
    require("telescope").load_extension("file_browser")
  end,
}
---

return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    local logo = [[
         ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
         ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
         ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
         ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
         ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
         ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]]
    opts.section.header.val = vim.split(logo, "\n", { trimempty = true })
  end,
}


https://github.com/nvim-telescope

https://luarocks.org/#quick-start


M.dos_rebel = {
	[[                                                                       ]],
	[[  ██████   █████                   █████   █████  ███                  ]],
	[[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
	[[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
	[[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
	[[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
	[[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
	[[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
	[[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
	[[                                                                       ]],
}
https://github.com/MaximilianLloyd/ascii.nvim/blob/master/lua/ascii/text/neovim.lua