# Build Your Neovim Configuration in Lua

Neovim, or Nvim, is a highly extensible text editor perfect for terminal-based text editing. It inherits many features from its predecessor, Vim, while adding enhancements to improve usability. Neovim offers a streamlined and powerful user experience, maintaining full compatibility with Vim's editing features.

Vim, created by Bram Moolenaar in the early 1990s, improved upon the Unix program 'Vi' with additional commands. Neovim, initiated by Thiago de Arruda in 2011, was developed as a fork of Vim to address limitations in extensibility and customization. Neovim has since become a flexible and powerful text editor.

## Key Aspects of Neovim

1. **Extensibility**:
   Neovim supports a wide range of plugins and extensions, allowing extensive customization.
2. **Modern Features**:
   It includes modern terminal features such as cursor styling, focus events, and a built-in terminal emulator, enhancing usability and integration with other tools.
3. **Improved Architecture**:
   Neovim's architecture is designed for better performance and scalability, refactoring Vim's source code to make it more maintainable and extendable.
4. **Compatibility**:
   Neovim is fully compatible with Vim, meaning most Vim plugins and configurations work seamlessly with Neovim.
5. **Community-Driven**:
   The development of Neovim is community-driven, ensuring continuous improvements and innovations based on user feedback and contributions.

Official [Neovim Documentation](https://neovim.io/doc/user/intro.html) | [Neovim on GitHub](https://github.com/neovim/neovim)

## Installing Neovim

Neovim is available for Windows, macOS, Linux, and other systems. On Windows, using Ubuntu via the Windows Subsystem for Linux (WSL) is recommended.

**Linux**:

  ```bash
  sudo apt update
  sudo apt upgrade
  sudo apt install neovim
  ```

**Arch Linux**:

```bash
   sudo pacman -Syu neovim
```

**macOS**:

   ```bash
   brew install neovim
   ```

With the pre-built releases of Neovim then do this instead.

   ```bash
      curl -LO <https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz>
      tar xzf nvim-macos.tar.gz
      ./nvim-macos/bin/nvim
   ```

**Windows**: With package manager like **Chocolatey** or **Scoop**.

- **Using Chocolatey**:

    ```bash
     choco install neovim
   ```

- **Using Scoop**:

   ```powershell
   scoop bucket add extras
   scoop install vcredist2022
   scoop install neovim
   ```

> Note: Installation processes may vary depending on the distribution and package manager.

## Navigating the User Interface (UI)

Neovim offers an aesthetically pleasing interface that is easy to navigate, edit files, run version controls, and customize the coding environment.

Neovim has four modes: `Normal`, `Insert`, `Visual`, and `Command-line`.

1. **Normal Mode**:
   - Default mode when you launch Neovim.
   - Navigate and manipulate text without modifying it directly.
2. **Insert Mode**:
   - Activate by pressing `i` to start typing and editing text.
   - Press `Esc` to return to Normal Mode.
3. **Visual Mode**:
   - Enter by pressing `v` or by left-clicking and dragging to select text.
   - Highlight and copy text for use in external applications.
4. **Command-line Mode**:
   - Press `:` in Normal Mode to enter.
   - Execute various commands, such as saving and quitting with `:wq!`.

## Essential Neovim Commands

### Cursor Movements

- `h`: Move left
- `j`: Move down
- `k`: Move up
- `l`: Move right
- `w`: Next word
- `b`: Previous word
- `e`: End of the word
- `gg`: Beginning of the file
- `G`: End of the file
- `{number}G`: Move to line number
- `:{line number}`: Move to line number

### Editing

- `i`: Insert mode at cursor
- `I`: Insert mode at line start
- `a`: Insert mode after cursor
- `A`: Insert mode at line end
- `o`: New line below
- `O`: New line above
- `r`: Replace character
- `R`: Replace mode
- `x`: Delete character
- `X`: Delete character before cursor
- `d{motion}`: Delete text over motion (e.g., `dw` deletes a word)
- `dd`: Delete line

### Insert Mode Commands

- `Esc`: Exit insert mode
- `Ctrl + [`: Exit insert mode

### Visual Mode Commands

- `v`: Character-wise selection
- `V`: Line-wise selection
- `Ctrl + v`: Block-wise selection
- `Esc`: Exit visual mode

### Undo, Redo, Search, Save, and Exit

- **Undo/Redo**:
  - `u`: Undo
  - `Ctrl + r`: Redo
- **Search**:
  - `/{pattern}`: Search
  - `n`: Next match
  - `N`: Previous match
- **Save/Quit**:
  - `:w`: Save
  - `:w {file}`: Save as
  - `:wq`: Save and quit
  - `:q`: Quit
  - `:q!`: Quit without saving

### Cut, Copy, and Paste

- **Copy**:
  - `yy`: Yank line
  - `{Visual mode} y`: Yank selection
- **Paste**:
  - `p`: Paste after cursor
  - `P`: Paste before cursor

### Replace Text

- `:%s/{old}/{new}/g`: Replace all occurrences of `{old}` with `{new}`
- `:%s/{old}/{new}/gc`: Replace all occurrences with confirmation

### Split Windows

- `:split`: Horizontal split
- `:vsplit`: Vertical split
- `Ctrl + w h/j/k/l`: Navigate windows
- `:q`: Close window

### Tab Commands

- `:tabnew`: New tab
- `:tabclose`: Close tab
- `gt`: Next tab
- `gT`: Previous tab
- `{tab number}gt`: Go to tab number

### Buffer Management

- `:e {file}`: Open file
- `:ls`: List buffers
- `:b {buffer number}`: Switch buffer
- `:bd`: Close buffer

### Syntax Highlighting

- `:syntax on`: Enable
- `:syntax off`: Disable

### Indentation

- `>`: Indent
- `<`: Unindent
- `==`: Auto-indent line
- `=%`: Auto-indent block

## Switching to Terminal Mode

1. **Open a terminal window**:
   - `:terminal` or `term` for shot
2. **Switch to terminal-normal mode**:
   - `Ctrl-w N`
3. **Return to terminal-insert mode**:
   - `i`
4. **Switch between terminal and normal buffers**:
   - `Ctrl-6` or `Ctrl-^`
5. **Split terminal window**:
   - `:split | terminal` (horizontal)
   - `:vsplit | terminal` (vertical)

## Help

- `:help {topic}`: Help for the topic
- `:help user-manual`: Open the user manual

## Creating a Folder

1. **Using Netrw**:
   - `:Explore` or `Ex` in short.
   - Navigate and press `d`
2. **Using `nvim-tree.lua`**:
   - `:NvimTreeToggle`
   - Navigate and use `a` (append `/` for directories)
3. **Using AdvancedNewFile.nvim**:
   - `:ANewFile path/to/new_directory/`
4. **Command line**:
   - `:!mkdir -p path/to/new_directory`

## Efficient Navigation in Neovim/Vim

One of Vim's core principles is to accomplish tasks with the fewest keystrokes possible. If you find yourself repeating commands multiple times, it's time to explore more efficient methods. For example, instead of pressing `dd` five times to delete five lines, you can use `5dd` or `d4j`, reducing the keystrokes from ten to just three.

### Basic Navigation

- **Line Numbers**: Press the line number followed by `gg` or `G` to jump directly to that line. For example, `87gg` or `87G` takes you to line 87.
- **Relative Movement**: Move the cursor relatively using `10j` to go ten lines down or `10k` to go ten lines up.

### Enabling Relative Line Numbers

To make relative movement even easier, enable both absolute and relative line numbers:

```vim
set number
set relativenumber
```

### Efficient Cursor Movement

Vim offers commands like `f`, `t`, `F`, and `T` for precise cursor movement within the current line. These actions can be repeated using `,` or `;` to jump to a character.

The **vim-sneak** plugin resolves issues related to these commands, allowing you to navigate to any visible character in just a few keystrokes. For example, to jump to the character 'i' followed by 'm', press `f`, then `im`.

### Quickly Return to a Previous Edit Position

When you need to move to another part of the file but plan to return, set a mark at your current position:

- `ma`: Create a mark named 'a'.
- `` `a``: Go to the exact position denoted by mark 'a'.
- `'a`: Go to the line denoted by mark 'a'.

Use the **vim-signature** plugin for better mark management.

### Quickly Switching Buffers

Display the buffer index of open files with `:ls`. To switch to a buffer, press the buffer index number followed by `Ctrl + 6`.

For a more efficient solution, use the **vim-airline** plugin to display buffer indices directly on the tabline.

### Essential Commands

```vim
:w              " Save file
:w filename     " Save file under new filename
:q              " Quit file
i               " Switch to INSERT mode
R               " Switch to REPLACE mode
v               " Switch to VISUAL mode
V               " Switch to VISUAL LINE mode
<ctrl>v         " Switch to VISUAL BLOCK mode
o               " Insert a new line below and go to INSERT mode
O               " Insert a new line above and go to INSERT mode
x               " Delete character under the cursor
X               " Delete character left of the cursor
dd              " Delete current line
dw              " Delete current word
D               " Delete to the end of the line
<esc>           " Leave current mode
/               " Search for text
$               " Go to the end of the line
gcc             " Comment out a line
<ctrl>r         " Redo last change
<ctrl>g         " Show file info
<space>e        " Toggle FileTree
<space>n        " Toggle line numbers
<space>w        " Toggle line wrap  
<space>c        " Toggle colorscheme
<space>t        " Open terminal (close with esc)
:PlugInstall    " Install plugins
```

### Surround Commands

```vim
" Change Surround: cs(old)(new)
cs"'            " Changes " to ' surrounding
cs"<p>          " Changes " to <p></p>
cst"            " Changes tags like <p></p> to "

" Delete Surround: ds(alt)
ds"             " Deletes " surrounding
dst             " Deletes tag like <p></p>
```

### Text Search

```vim
/               " Search forward
?               " Search backward
n               " Repeat last search
f{char}         " Jump to the next {char} right
```

### Move Cursor

```vim
0               " To first character in the line
$               " To end of line
G               " To end of file
gg              " To start of file
w               " Word forward
b               " Word backward
)               " Sentence forward
(               " Sentence backward
}               " Paragraph forward
{               " Paragraph backward
```

### Sessions

```vim
:SSave          " Save a session
:SLoad          " Load a session
:SDelete        " Delete a session
:SClose         " Close current session
```

### Split Window

```vim
<ctrl><w>+s or :split   " Split window horizontal
:vsplit                 " Split window vertical
<ctrl><w>+n             " Split window with new file
<ctrl><w>+q             " Close current window
<ctrl><w>+w             " Jump to other window
:sf filename            " Open file in new window
:sf <tab>               " Search file
```

### File Search

```vim
<ctrl>p         " Open fzf fuzzy search
<enter>         " Open found file in current window
<ctrl>t         " Open found file in tab split
<ctrl>s         " Open found file in split  
<ctrl>v         " Open found file in vsplit
```

### In INSERT Mode

```vim
<esc>           " Leave INSERT mode
<del>           " Delete left
<ctrl>w         " Delete word before cursor
<ctrl>u         " Delete left until the end of line
```

In `.html`, `.xhtml`, and `.php` files, tags will be auto-closed. To format them to the next line, press `>` again after closing the tag.

### VimWiki

```vim
<Leader>ww      " Open default wiki index file
<Leader>wt      " Open default wiki index file in a new tab
<Leader>ws      " Select and open wiki index file
<Leader>wd      " Delete wiki file
<Leader>wr      " Rename wiki file
<Enter>         " Follow/Create wiki link
<Shift-Enter>   " Split and follow/create wiki link
<Ctrl-Enter>    " Vertical split and follow/create wiki link
<Backspace>     " Go back to parent wiki link
<Tab>           " Find next wiki link
<Shift-Tab>     " Find previous wiki link
```

### Example Command Usage

```vim
5dd          " Delete five lines
87gg         " Jump to line 87
```

Choose the command style that fits your workflow best. The short commands are quick and efficient for frequent tasks, while the long commands offer more clarity for less frequent, specific actions.
