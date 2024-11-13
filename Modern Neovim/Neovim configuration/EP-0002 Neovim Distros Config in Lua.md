# What are Neovim Distributions?

Neovim distributions, often called "distros," are pre-configured setups of Neovim that include various plugins, settings, and themes to enhance productivity and usability. These distributions aim to provide a streamlined experience out of the box, catering to the diverse needs and preferences of Neovim users. Here are some key points about Neovim distributions:

1. **Purpose**: They simplify the setup process for Neovim users by offering a curated selection of plugins and configurations that enhance editing capabilities.

2. **Features**: Neovim distros typically include features like syntax highlighting, autocomplete, version control integration, and productivity tools, all preconfigured for immediate use.

3. **Popular Examples**: Popular Neovim distributions include LazyVim, LunarVim, AstroVim, NVChad, and SpaceVim. Each has its own set of features and customization options tailored to different user preferences.

4. **Customization**: While these distributions offer convenience, they also allow extensive customization, enabling users to add or modify plugins and settings according to their specific needs.

5. **Community and Support**: They benefit from active communities that provide ongoing development, support, and updates, ensuring compatibility with the latest Neovim releases.

Exploring the full potential of Neovim reveals its true strength: customizability. By utilizing various plugins, you can significantly enhance its capabilities and tailor it to suit your workflow.

## Some Popular Neovim Distributions

- [LazyVim](https://github.com/LazyVim/LazyVim): Pre-configured Neovim setup powered by [lazy.nvim](https://github.com/folke/lazy.nvim). Easy to customize and extend.
- [Kickstart](https://github.com/nvim-lua/kickstart.nvim): A starting point configuration designed as both a teaching tool and a reference setup.
- [Omakub](https://github.com/basecamp/omakub): An opinionated developer setup for Ubuntu, providing a comprehensive development environment.
- [SpaceVim](https://github.com/SpaceVim/SpaceVim): A modular and community-driven configuration framework for Vim and Neovim.
- [NormalNvim](https://github.com/NormalNvim/NormalNvim): A distribution designed for a stable and straightforward user experience.
- [NvChad](https://github.com/NvChad/NvChad): A framework to transform Neovim into a modern, IDE-like development environment.
- [LunarVim](https://github.com/lunarvim/lunarvim): An IDE layer for Neovim, designed to provide a modern and highly configurable environment.
- [AstroVim](https://github.com/AstroNvim/AstroNvim): A feature-rich Neovim configuration designed to enhance your development environment.

There's a great video walkthrough: [Neovim Distributions](https://www.youtube.com/watch?v=bbHtl0Pxzj8).
Check out this collection of [awesome Neovim](https://github.com/rockerBOO/awesome-neovim?tab=readme-ov-file#terminal-integration) plugins, mostly targeting Neovim-specific features.

## Getting Started with LazyVim

<details>
<summary>LazyVim Setup Overview</summary>

For those in a hurry, here's a quick summary of what you get once you install LazyVim:

1. **Initial Configuration directory path**:
   - **Linux/macOS**: `~/.config/nvim/init.lua`
   - **Windows**: ` %USERPROFILE% \AppData\Local\nvim`
  
   - *open Neovim and execute this command to know your configuration directory path*

   ```vim
   :echo stdpath("config")
   ```

2. **Config Folder**:
   - **lazy.lua**: Bootstraps LazyVim.
   - **keymaps.lua**: Add your custom key mappings here.
   - **autocmd.lua**: Define your custom auto commands.
   - **options.lua**: Set up your custom Neovim options.

3. **Plugins Folder**:
   - Add new plugins or configure built-in ones.
   - Any file added here will be loaded when you open Neovim.
   - It's recommended to create a separate file for each plugin you want to add and configure.
   - The folder includes an `example.lua` file with sample configurations you can use.

4. **Local Init File**:
   - A minimal `.config/local/init.lua` file that loads the config folder.

5. **Plugins Installation**:
   - Plugins are installed in your Neovim data directory, referred to in Neovim’s documentation as `$XDG_DATA_HOME`.
   - On Unix systems, this is typically located at `~/local/share/nvim`.

### Is LazyVim Different from lazy.nvim?

LazyVim is a Neovim setup powered by lazy.nvim to make it easy to customize and extend your config. LazyVim leverages the power of lazy.nvim, a modern plugin manager for Neovim. Here’s the relationship between LazyVim and lazy.nvim:

1. **LazyVim**:
   - **Purpose**: Provides a pre-configured Neovim setup designed to be easy to customize and extend.
   - **Features**: Includes a wide range of plugins and configurations out-of-the-box, saving users time and effort in setting up Neovim from scratch.
   - **Customization**: Users can modify and add their own configurations on top of the existing setup, making it flexible for various workflows.

2. **lazy.nvim**:
   - **Purpose**: A plugin manager for Neovim focused on performance and ease of use.
   - **Features**: Offers fast startup times, a powerful UI for managing plugins, automatic caching, and bytecode compilation of Lua modules for a quicker and more efficient Neovim experience.

3. **Relationship**: LazyVim is built on top of lazy.nvim, using it as the core tool to manage and load its extensive set of plugins and configurations.

</details>

### 🛠️ LazyVim Installation

- **LazyVim**: [LazyVim GitHub Repository](https://github.com/LazyVim/LazyVim). Check the [LazyVim documentation](https://lazyvim.github.io/) for more information.
- **lazy.nvim**: [lazy.nvim GitHub Repository](https://github.com/folke/lazy.nvim). Check the [lazy.nvim documentation](https://lazy.folke.io/) for more information.

### ⚙️ Configuring Neovim using Lua

First things first, create the configuration file, `init.lua`. The location of this file depends on your operating system and environment variables. Neovim allows the use of `init.lua` for configuration, offering a more structured and modern approach compared to `init.vim`.

> Note: The **Neovim** configuration file is `init.lua`, not to be confused with `vimrc` in **Vim**.

## Setting Up Your Neovim Configuration File

To create and manage your Neovim configuration file, follow these steps:
<details>
<summary>Starting your configuration from scratch</summary>
Let's open Neovim and execute this command.

1. **Create the configuration directory**:

   ```vim
   :call mkdir(stdpath("config"), "p")
   ```

   This command creates the folder where the configuration file will be stored.

2. **Check the configuration directory path**:

   ```vim
   :echo stdpath("config")
   ```

   This command displays the path of the configuration folder.

3. **Create the `init.lua` file**:

   ```vim
   :exe "edit" stdpath("config") . "/init.lua"
   ```

   This command opens an empty `init.lua` file in the configuration directory. Since the file doesn't exist yet, it will create a new empty file.

4. **Save the `init.lua` file**:

   ```vim
   :write
   ```

   This command saves the newly created file.

5. **Edit the configuration file in the future**:

   ```vim
   :edit $MYVIMRC
   ```

   Use this command to open and edit the `init.lua` file anytime.

6. **Execute all the above steps with one command**:

   ```sh
   nvim --headless -c 'call mkdir(stdpath("config"), "p") | exe "edit" stdpath("config") . "/init.lua" | write | quit'
   ```

   This single command runs Neovim in headless mode, creates the configuration directory, opens and saves the `init.lua` file, and then quits Neovim.

>Note: The above steps of creating the configuration directory and init.lua file is only needed if you're starting your configuration from scratch.

</details>

## Optimizing Your Neovim Setup

To create a well-organized and efficient Neovim setup, follow these steps:

1. **Location of `init.lua`**
   - Place the `init.lua` file in the appropriate directory for your operating system.
   - The default configuration file path for Neovim varies by operating system:

   - **Linux/macOS**: `~/.config/nvim/init.lua`
   - **Windows**: ` %USERPROFILE% \AppData\Local\nvim`

   To navigate to these directories via the terminal, use the following commands:

   - On **Linux/macOS**:

   ```bash
   cd ~/.config/nvim
   ```

   - On **Windows**:

   ```cmd
    cd %USERPROFILE% \AppData\Local\nvim
   ```

   > Note: The directories might be hidden by default. To navigate to them using a graphical user interface (GUI), you will need to enable the display of hidden files in your system settings.

2. **Modular Configuration**
   - Instead of having a single, large configuration file, divide your settings into separate modules.
   - Store these modules in the `lua/` directory within your Neovim configuration directory (e.g., `~/.config/nvim/lua/`).

3. **Loading Modules**
   - Use the `require` function in your `init.lua` to load these modules, keeping your configuration organized and manageable.

   - Example:

     ```lua
     -- In init.lua
     require('settings')
     require('keymaps')
     require('plugins')
     ```

You can place these modules in the `lua/` directory in your runtime path, and load them in `init.lua` using `require`.

For LazyVim, files under `config` will be automatically loaded at the appropriate time, so manual `require` is unnecessary.
You can add your custom plugin specifications under `lua/plugins/`. All files there will be automatically loaded by `lazy.nvim`.

## 📂 File Structure

- Example:

    ```bash
    tree ~/.config/nvim
    ├── init.lua
    ├── lazy-lock.json
    └── lua
        ├── config
        │   ├── autocmds.lua
        │   ├── custom
        │   ├── keymaps.lua
        │   └── options.lua
        └── plugins
            ├── autopairs.lua
            ├── colorizer.lua
            ├── colorscheme.lua
            ├── comment.lua
            ├── custom
            │   ├── colorscheme.lua
            │   └── lush.lua
            ├── gitsigns.lua
            ├── lsp.lua
            ├── lualine.lua
            ├── neoterm.lua
            ├── telescope.lua
            ├── tree.lua
            └── treesitter.lua
    ```

## ➕ Adding Plugins

Configuring `LazyVim` plugins is the same as using `lazy.nvim` to build a config from scratch. Adding a plugin involves adding the plugin spec to one of the files under `lua/plugins/*.lua`.
You can structure your `lua/plugins` folder with a file per plugin or separate files containing all the plugin specs for specific functionalities.

Neovim reads specific lines on startup to locate and load Lua files from the runtime path, specifically from the `~/.config/nvim` directory. The presence of `lua/` in the runtime path is crucial for this process. Understanding this mechanism allows for effective configuration of Neovim.

## 🗒️ Options

To configure Neovim using Lua, we use the global `vim` module, which provides various utilities for modifying Neovim settings. We'll focus on the `opt` property, which allows us to change Neovim's options using Lua syntax.

There are two ways to set options via Lua: `vim.opt` and `vim.o`. It is recommended to use `vim.opt` for a more Lua-style approach, as it allows manipulation of options with functions like `append()`, `prepend()`, and `remove()`, and setting values to Lua tables.

### How to Set Options

- Use `vim.opt.option_name = value` to set an option.
- You can learn more about each option by using `:h 'option_name'` in Neovim.
- For a detailed guide on the differences between `vim.opt` and `vim.o`, use `:h lua-guide-options`.
- Ensure to `require("config.options")` in your `init.lua` to load your configuration.

### Basic Syntax

To modify an option, use the following syntax:

```lua
vim.opt.option_name = value
```

Here, `option_name` is any valid option, and `value` should be the expected type for that option.

To review the default configuration **options** for LazyVim, you can check the `options.lua` file in the LazyVim GitHub repository. This file contains various settings and options that LazyVim uses by default. You can access the default option configurations for LazyVim [here on GitHub](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua).

### Example Configuration

```lua
-- Enable relative line numbers
vim.opt.relativenumber = true

-- Set tab width to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Enable mouse support
vim.opt.mouse = 'a'

-- Enable 24-bit RGB color in the terminal UI
vim.opt.termguicolors = true

-- Save undo history to an undo file
vim.opt.undofile = true
```

### Scopes of Options

Each option has a scope: some are global, while others only apply to the current window or buffer. You can find the scope of an option in its help page. Use the following command to access the help page for an option:

```vim
:help 'option_name'
```

You can find a comprehensive list of options in Neovim using `:help option-list`.

## Useful Options

These settings offer a foundation for configuring Neovim using Lua.
They can be further customized based on your specific requirements.
The customized configuration file, `Options.lua`, for Neovim will look something like this.

```lua

-- Basic settings
vim.opt.winbar = "%m %f"                     -- Show winbar at the top, very hendy for more split windons 
rim.opt.number = true                        -- Show line numbers
vim.opt.relativenumber = true                -- Show line numbers relative to the cursor
vim.opt.mouse = 'a'                          -- Enable mouse in all modes
vim.opt.ignorecase = true                    -- Case insensitive searching
vim.opt.smartcase = true                     -- Override 'ignorecase' if search pattern contains uppercase letters
vim.opt.hlsearch = true                      -- Highlight search results
vim.opt.wrap = true                          -- Wrap long lines
vim.opt.breakindent = true                   -- Preserve indentation in wrapped lines
vim.opt.tabstop = 2                          -- This setting determines the width of a tab character in the editor
vim.opt.softtabstop = 4                      -- controls how many spaces the cursor moves when you press the tab key
vim.opt.shiftwidth = 4                       -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true                     -- Use spaces instead of tabs
vim.opt.hidden = true                        -- Allows switching buffers without saving
vim.opt.signcolumn = "yes:2"                 -- Always show the sign column with a width of 2
vim.opt.termguicolors = true                 -- Enables 24-bit RGB color in the terminal UI
vim.opt.undofile = true                      -- Save undo history to an undo file
vim.opt.spell = true                         -- Enable spell checking
vim.opt.title = true                         -- Set the terminal's title
vim.opt.wildmode = {"longest:full", "full"}  -- Command-line completion mode
vim.opt.list = true                          -- Display unprintable characters.
vim.opt.scrolloff = 10                       -- Keep at least 10 lines above and below the cursor.
vim.opt.sidescrolloff = 10                   -- Keep at least 10 columns to the left and right of the cursor.
vim.opt.joinspaces = false                   -- Prevents inserting two spaces after a period with a join command.
vim.opt.splitright = true                    -- Vertical splits open to the right.
vim.opt.clipboard = "unnamedplus"            -- Use the system clipboard for all operations.
vim.opt.confirm = true                       -- Ask for confirmation when closing unsaved files.
vim.opt.exrc = true                          -- Allow the use of project-specific .vimrc files.
```

**Note:** When `softtabstop` is set to a different value from `tabstop`, it allows for more flexible indentation behavior. This setup enables inserting spaces instead of tab characters while maintaining the desired tab width for display purposes.

- **tabstop**: Defines the visual representation of tab characters. For example, setting `tabstop=4` will display a tab character as four spaces wide.
- **softtabstop**: Specifies the number of spaces inserted or removed when pressing the tab key. If `softtabstop` is set to a different value than `tabstop`, pressing the tab key will insert the specified number of spaces instead of a tab character.

In summary, `tabstop` determines how tab characters are displayed, while `softtabstop` controls how many spaces are used when you press the tab key, providing more control over your code's indentation style. [Vim documentation: options](https://vimdoc.sourceforge.net/htmldoc/options.html#%27sts%27)

## Understanding Keybindings in Neovim with Lua

Keybindings in Neovim can be managed using two primary functions: `vim.keymap.set` and `vim.api.nvim_set_keymap`. Let's explore their differences, usage, and how to set keybindings effectively.

### `vim.keymap.set` vs. `vim.api.nvim_set_keymap`

1. **Purpose and Simplicity**:
   - **`vim.keymap.set`**: This is a higher-level API introduced to make keymapping more user-friendly by offering sensible defaults and reducing boilerplate code.
   - **`vim.api.nvim_set_keymap`**: A lower-level API that requires explicit specification of keymap options, providing more control but being more verbose.

2. **Default Options**:
   - **`vim.keymap.set`**: Offers sensible defaults, reducing the need to specify options like `noremap` and `silent`.
   - **`vim.api.nvim_set_keymap`**: Requires explicit specification of all options.

3. **Usage Examples**:
   - **`vim.keymap.set`**:

     ```lua
     vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { silent = true })
     ```

   - **`vim.api.nvim_set_keymap`**:

     ```lua
     vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
     ```

4. **Integration and Wrapper**:
   - **`vim.keymap.set`**: Acts as a wrapper around `vim.api.nvim_set_keymap`, streamlining the process.
   - **`vim.api.nvim_set_keymap`**: Directly interfaces with Neovim's core API.

### Keybindings with `vim.keymap.set`

To create custom keybindings in Neovim, use `vim.keymap.set`.

#### Basic Example

```lua
vim.keymap.set('n', '<space>w', '<cmd>write<cr>', { desc = 'Save' })
```

After executing this, pressing `Space + w` will save the file.

#### Parameters

The `vim.keymap.set` function takes four parameters: `mode`, `lhs`, `rhs`, and `opts`.

```lua
vim.keymap.set({mode}, {lhs}, {rhs}, {opts})
```

1. **{mode}**: The mode(s) in which the keybinding should be active. Can be a single mode or a list of modes:
   - `n`: Normal mode
   - `i`: Insert mode
   - `x`: Visual mode
   - `s`: Selection mode
   - `v`: Visual + Selection
   - `t`: Terminal mode
   - `o`: Operator-pending mode
   - `''`: Equivalent to `n + v + o`

2. **{lhs}**: The key sequence to bind.

3. **{rhs}**: The action to execute (command string or Lua function).

4. **{opts}**: A table with optional properties:
   - `desc`: Description of the keybinding.
   - `remap`: Allow recursive keybindings (default: `false`).
   - `buffer`: Make the keybinding buffer-specific.
   - `silent`: Suppress messages (default: `false`).
   - `expr`: Evaluate {rhs} as an expression (default: `false`).

#### Example Breakdown

```lua
vim.keymap.set('n', '<space>w', '<cmd>write<cr>', { desc = 'Save' })
```

- `{mode}`: `'n'` (Normal mode)
- `{lhs}`: `'<space>w'` (Space key followed by 'w')
- `{rhs}`: `'<cmd>write<cr>'` (Execute the write command)
- `{opts}`: `{ desc = 'Save' }` (Description: "Save")

### The Leader Key

The leader key is a customizable prefix for keybindings, defined using `vim.g.mapleader`.

```lua
vim.g.mapleader = ' '
```

After setting this, you can use `<leader>` in your keybindings:

```lua
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')
```

This binds `Space + w` to save the file.

### Useful Keybindings

#### Copy/Paste from Clipboard

Neovim does not use the system clipboard by default. Here are bindings to interact with the clipboard:

- **Copy to clipboard**:

  ```lua
  vim.keymap.set({'n', 'x'}, 'gy', '"+y')
  ```

- **Paste from clipboard**:

  ```lua
  vim.keymap.set({'n', 'x'}, 'gp', '"+p')
  ```

#### Delete without Changing Registers

Prevent text from being saved to a register when deleting:

```lua
vim.keymap.set({'n', 'x'}, 'x', '"_x')
vim.keymap.set({'n', 'x'}, 'X', '"_d')
```

#### Select All Text

Select all text in the current buffer:

```lua
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')
```

### Keybindings with `vim.api.nvim_set_keymap`

*Basic Example*:

```lua
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
```

- `noremap`: Prevents recursive mapping.
- `silent`: Suppresses command output.

### Advanced Keybinding Example

For more complex actions, create Lua functions and bind them:

```lua
local function my_custom_function()
  print("Hello, Neovim!")
end

vim.keymap.set('n', '<leader>hw', my_custom_function, { noremap = true, silent = true })
```

This binds `<leader>hw` to a custom Lua function that prints a message.

### Loading Keybindings from a Separate File

1. Create a `keybindings.lua` file in `~/.config/nvim/lua/`.
2. Add your keybindings to this file.
3. In your `init.lua`, load this file:

```lua
require('keybindings')
```

### Reloading Neovim Configuration

#### Using Command Mode

- For `init.vim`: `:source $MYVIMRC`
- For `init.lua`: `:lua dofile(vim.env.MYVIMRC)`

#### Setting a Keybinding

Add the following to your `init.vim` or `init.lua`:

```vim
" For init.vim
nnoremap <leader>sv :source $MYVIMRC<CR>
```

```lua
-- For init.lua
vim.api.nvim_set_keymap('n', '<leader>sv', ':lua dofile(vim.env.MYVIMRC)<CR>', { noremap = true, silent = true })
```

#### Using a Plugin

Plugins like `nvim-reload` can help manage reloading configurations more smoothly.

#### Manual Reload

For complex setups, manually reload specific Lua modules:

```lua
function ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match('^user') then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
end

vim.api.nvim_set_keymap('n', '<leader>rr', ':lua ReloadConfig()<CR>', { noremap = true, silent = true })
```

These methods help reload your Neovim configuration without restarting, saving time and streamlining your workflow.

To review the default configuration **keymaps** for LazyVim, you can check the `keymaps.lua` file in the LazyVim GitHub repository. This file contains various settings and options that LazyVim uses by default. You can access the default **keymaps** configurations for LazyVim [here on GitHub](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua).

---
**Previous <<**

## [Build Your Neovim Configuration in Lua](/Modern%20Neovim/Neovim%20configuration/EP-0001%20Modern%20Neovim%20Installation.md)
