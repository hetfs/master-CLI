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

## Essential Neovim Commands

Neovim offers an aesthetically pleasing interface that is easy to navigate, edit files, run version controls, and customize the coding environment. Neovim has four primary modes: `Normal`, `Insert`, `Visual`, and `Command-line`. Below are essential commands for each mode along with examples of how to use them.

## Normal Mode

**Navigation**:

- `h`: Move left
- `j`: Move down
- `k`: Move up
- `l`: Move right
- `w`: Next word
- `b`: Previous word
- `e`: End of the word
- `gg`: Go to the top of the file
- `G`: Go to the bottom of the file
- `{number}G`: Move to line number
- `^`: or `0` Go to the beginning of the line
- `$`: Go to the end of the line
- `{line number}`: Press **ENTER** Move to line number
- `)`: moves the cursor forward to the next sentence
- `(`: moves the cursor backward to the previous sentence
- `}`: moves the cursor forward to the next paragraph.
- `{`: moves the cursor backward to the previous paragraph

**Editing**:

- `dd`: Delete current line
- `yy`: Yank (copy) current line
- `p`: Paste after the cursor
- `u`: Undo last change
- `<C-r>`: Redo last undone change
- `r`: Replace character
- `R`: Replace mode
- `x`: Delete character
- `X`: Delete character before cursor
- `d{motion}`: Delete text over motion (e.g., `dw` deletes a word)
- `dd`: Delete line

**Search**:

- `/pattern`: Search for `pattern`
- `n`: Repeat search in the same direction
- `N`: Repeat search in the opposite direction

**Undo/Redo**:

- `u`: Undo
- `Ctrl + r`: Redo

**Save/Quit**:

- `:w`: Save
- `:w {file}`: Save as
- `:wq`: Save and quit
- `:q`: Quit
- `:q!`: Quit without saving

**Example**: To delete a line, move to it using `j` or `k` and then press `dd`.

**Copy**:

- `yy`: Yank line
- `{Visual mode} y`: Yank selection

**Paste**:

- `p`: Paste after cursor
- `P`: Paste before cursor

**Replace Text**:

- `:%s/{old}/{new}/g`: Replace all occurrences of `{old}` with `{new}`
- `:%s/{old}/{new}/gc`: Replace all occurrences with confirmation

## Insert Mode

- **Entering Insert Mode**
  - `i`: Insert before the cursor
  - `I`: Insert at the beginning of the line
  - `a`: Append after the cursor
  - `A`: Append at the end of the line
  - `o`: Open a new line below and insert
  - `O`: Open a new line above and insert
  - `Ctrl + [`: Exit insert mode
  - `<Esc>`: Switch back to Normal mode

**Example**: To start typing at the end of a line, press `A` and type your text. Press `<Esc>` to return to Normal mode.

## Visual Mode

- **Entering Visual Mode**
  - `v`: Start visual mode (character-wise selection)
  - `V`: Start visual line mode (line-wise selection)
  - `<C-v>`: Start visual block mode (block-wise selection)
  - `Ctrl + v`: Block-wise selection
  - `Esc`: Exit visual mode

**Examples of Using Visual Mode Commands in Neovim**:

- **`v`: Start visual mode (character-wise selection)**
  1. Press `v` in Normal mode.
  2. Use the arrow keys or `h`, `j`, `k`, `l` to select the desired text.
  3. Press `y` to yank (copy) the selected text, or `d` to delete it.

- **`V`: Start visual line mode (line-wise selection)**
  1. Press `V` in Normal mode.
  2. Use the arrow keys or `j`, `k` to extend the selection line by line.
  3. Press `y` to yank (copy) the selected lines, or `d` to delete them.

- **`<C-v>` or `Ctrl + v`: Start visual block mode (block-wise selection)**
  1. Press `<C-v>` (or `Ctrl + v`) in Normal mode.
  2. Use the arrow keys or `h`, `j`, `k`, `l` to extend the selection as a block.
  3. Press `I` to insert text before the block or `A` to append text after the block. Press `<Esc>` to apply the changes to all lines in the block.

- **`Esc`: Exit visual mode**
  1. While in any visual mode (character-wise, line-wise, or block-wise), press `<Esc>` to return to Normal mode without making any changes.

**Example**: To copy a block of text

1. Move the cursor to the beginning of the block.
2. Press `<C-v>` to start block-wise visual mode.
3. Use the arrow keys to extend the selection.
4. Press `y` to copy the selected block.
5. Move the cursor to the desired location.
6. Press `p` to paste the copied block.

**Manipulating Selections**:

- `y`: Yank (copy) the selection
- `d`: Delete the selection
- `>`: Indent the selection
- `<`: Outdent the selection

**Example**: To copy a word, move to the beginning of the word, press `v`, move to the end of the word, and press `y`.

## Command-line Mode

**Entering Command-line Mode**:

- `:`: Start command-line mode for ex commands
- `/`: Start command-line mode for searching
- `?`: Start command-line mode for backward searching
- `:e filename`: Open a file

**Switching to Terminal Mode**:

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
6. **save and qui**:
   - `:w`: Save the file
   - `:q`: Quit Neovim
   - `:wq`: Save and quit

**Example**: To save and quit, type `:wq` and press `Enter`.

**Split Windows**:

- `:split`: Horizontal split
- `:vsplit`: Vertical split
- `Ctrl + w h/j/k/l`: Navigate windows
- `:q`: Close window

**Tab Commands**:

- `:tabnew`: New tab
- `:tabclose`: Close tab
- `gt`: Next tab
- `gT`: Previous tab
- `{tab number}gt`: Go to tab number

**Buffer Management**:
Display the buffer index of open files with `:ls`. To switch to a buffer, press the buffer index number followed by `Ctrl + 6`.

- `:e {file}`: Open file
- `:ls`: List buffers
- `:b {buffer number}`: Switch buffer
- `:bd`: Close buffer

**Syntax Highlighting**:

- `:syntax on`: Enable
- `:syntax off`: Disable

## Efficient Navigation in Neovim/Vim

Enhance your navigation efficiency in Neovim/Vim by enabling both absolute and relative line numbers:

```vim
set number
set relativenumber
```

**Optimize Your Keystrokes**
A fundamental principle of Vim/Neovim is to accomplish tasks with minimal keystrokes. If you find yourself repeating commands, there are more efficient alternatives. For example, instead of pressing `dd` five times to delete five lines, you can use `5dd` to achieve the same result with fewer keystrokes.

**Practical Examples**:

- **Jump to Specific Line**: Press the line number followed by `gg` or `G` to jump directly to that line. For instance, `87gg` or `87G` will take you to line 87.
  
- **Relative Movement**: Use relative line numbers to move the cursor efficiently. For example, `10j` moves the cursor ten lines down, and `10k` moves it ten lines up.

Implementing these commands can significantly streamline your workflow and make navigating through your code quicker and more intuitive.

## Use or Set Marks in Neovim/Vim

Marks in Neovim/Vim are incredibly useful for navigating large files efficiently. They allow you to set a position within the file and return to it later. Here’s how to use them correctly:

**Setting a Mark**
To set a mark at your current cursor position, you use the `m` command followed by a lowercase letter (for a local mark) or an uppercase letter (for a global mark):

- `ma`: Sets a mark named 'a' at the current cursor position.

**Navigating to a Mark**
You can jump back to the mark using either the `` ` `` or `'` commands:

- `` `a``: Jumps to the exact position of mark 'a'.
- `'a`: Jumps to the beginning of the line where mark 'a' is set.

**Example**:

1. Open a file in Neovim/Vim and place the cursor where you want to set a mark.
2. Type `ma` to set a mark 'a' at the current position.
3. Move to another part of the file by scrolling or using search commands.
4. When you want to return to the marked position, type `` `a`` to jump to the exact position or `'a` to jump to the start of the line with mark 'a'.

**Practical Usage**
Imagine you are editing a large configuration file and you are currently adjusting settings at line 50 but need to temporarily move to line 200 to check another configuration:

1. At line 50, set a mark with `ma`.
2. Move to line 200 by typing `200G`.
3. After checking the configuration, return to line 50 by typing `` `a`` or `'a`.

## Using Netrw, builtin file explorer

Netrw, Vim's built-in file explorer, offers convenient ways to manage directories and files directly from Vim/Neovim.

1. **Creating a Folder**:
   - Open Netrw with `:Explore` or its shorthand `:Ex`.
   - Navigate to the directory where you want to create a new folder.
   - Press `d` to create a new directory. Enter the name of the directory when prompted and press Enter.

2. **Creating a File**:
   - Similarly, open Netrw with `:Explore` or `:Ex`.
   - Navigate to the desired location.
   - Press `%` to create a new file. Enter the filename and press Enter.

3. **Deleting a File or Folder**:
   - Open Netrw using `:Explore` or `:Ex`.
   - Navigate to the file or folder you want to delete.
   - Press `D` to delete the file or directory. Confirm the deletion when prompted.

Using Netrw in Vim/Neovim simplifies file and directory management tasks directly from your editor interface. It provides intuitive keybindings for creating directories (`d`), files (`%`), and deleting items (`D`), streamlining your workflow without leaving the editor.

`:help netrw`: Access Netrw's help documentation for more commands and customization.

## Auto-closing tags and formatting in Neovim for `.html`, `.xhtml`, and `.php` files

In Neovim, plugins like HTML AutoCloseTag or similar ones can automatically close HTML tags when you type the closing angle bracket (`>`). This feature is particularly useful in `.html`, `.xhtml`, and `.php` files where HTML tags need proper closure.

To format tags to the next line after auto-closing them:

1. Type out the opening tag (`<tag>`).
2. Neovim will automatically insert the closing tag (`</tag>`).
3. After the closing tag is inserted, press `>` again.
4. Neovim will move the cursor to the next line, ensuring proper indentation for the next tag.

This method helps maintain clean and organized code by ensuring tags are closed correctly and formatted neatly across different file types.

## VimWiki Key Bindings

[VimWiki](https://github.com/lervag/wiki.vim) is a powerful plugin for Vim/Neovim that transforms the text editor into a personal wiki or knowledge base system. It allows users to create and manage notes, to-do lists, and documentation directly within Vim/Neovim using a simple and efficient markup language.

VimWiki key bindings are predefined shortcuts used within VimWiki, a personal wiki system for Vim. These bindings facilitate navigation, editing, and management of wiki pages directly within Vim. Here are some essential VimWiki key bindings:

1. `<Leader>ww`: Opens the default wiki index file.
2. `<Leader>wt`: Opens the default wiki index file in a new tab.
3. `<Leader>ws`: Selects and opens the wiki index file.
4. `<Leader>wd`: Deletes the current wiki file.
5. `<Leader>wr`: Renames the current wiki file.
6. `<Enter>`: Follows or creates a wiki link at the cursor.
7. `<Shift-Enter>`: Splits the current window and follows or creates a wiki link.
8. `<Ctrl-Enter>`: Vertically splits the window and follows or creates a wiki link.
9. `<Backspace>`: Navigates back to the parent wiki link.
10. `<Tab>`: Finds the next wiki link in the document.
11. `<Shift-Tab>`: Finds the previous wiki link.

These bindings enhance productivity by allowing users to quickly navigate between wiki pages, create new links, delete or rename files, and more, all from within Vim using intuitive shortcuts  

## Help

- `:help {topic}`: Display help for a specific topic.
- `:help user-manual`: Open the comprehensive user manual.
- For more assistance, refer to the Neovim [Quick Reference Guide](https://neovim.io/doc/user/quickref.html).

These commands are essential for navigating and utilizing Neovim's extensive documentation effectively.

---

**Next >>**

## [What are Neovim Distributions?](/Modern%20Neovim/Neovim%20configuration/EP-0002%20Neovim%20Distros%20Config%20in%20Lua.md)
