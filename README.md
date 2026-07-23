# todos.vim

<div align="center">

![GitHub Repo stars](https://img.shields.io/github/stars/Yahm3/todos.vim?style=for-the-badge&color=yellow)
![GitHub last commit](https://img.shields.io/github/last-commit/Yahm3/todos.vim?style=for-the-badge&color=blue)
![GitHub issues](https://img.shields.io/github/issues/Yahm3/todos.vim?style=for-the-badge&color=red)
![GitHub License](https://img.shields.io/github/license/Yahm3/todos.vim?style=for-the-badge&color=success)
![Vim](https://img.shields.io/badge/Vim-8.0%2B-green?style=for-the-badge&logo=vim)

</div>

> [!WARNING]
> THIS PLUGIN IS A WORK IN PROGRESS! ANYTHING CAN CHANGE AT ANY MOMENT WITHOUT ANY NOTICE! USE IT AT YOUR OWN RISK!

A Vim plugin to manage your TODOs and FIXMEs efficiently without leaving your editor. 

## Demo
![todos.vim demo](./assets/demo.gif)

## Features
* **Project-wide Scanning:** Automatically greps your working directory for `TODO` and `FIXME` comments.
* **Priority Sorting:** Organizes tasks by priority (FIXMEs are prioritized over TODOs).
* **Native Navigation:** Press `<Enter>` on any task in the list to immediately jump to that file and line.
* **Custom Syntax Highlighting:** The `todos.txt` file is automatically color-coded for readability.

## Installation

> [!NOTE] 
> These instructions are for `vim-plug`.

Add this to your `.vimrc`:
```vim
Plug 'Yahm3/todos.vim'

```

After adding to your `.vimrc` file, save and source it (`:source $MYVIMRC`), then install it with:

```vim
:PlugInstall

```

## Commands

* `:Time [args]` — Displays the month, day, and time (e.g., `Jul 21 17:29`).
* Pass `d` to show only the day.
* Pass `t` to show only the time.


* `:TdGen` — Generates (or updates) a `todos.txt` file in your current working directory containing all TODOs/FIXMEs.
* `:TdOpen` — Opens the `todos.txt` file. If it doesn't exist, it generates it first.

## Mappings

By default, the plugin maps the following keys in normal mode:

* `<leader>td` — Generates and updates the `todos.txt` file.
* `<leader>tdo` — Opens the `todos.txt` file.

**Inside the `todos.txt` buffer:**

* `<CR>` (Enter) — Jump directly to the file and line of the TODO/FIXME under your cursor.

## Documentation

For more detailed information, view the built-in help documentation inside Vim:

```vim
:help todos

```
