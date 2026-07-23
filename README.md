# todos.vim

> [!WARNING]
> THIS PLUGIN IS A WORK IN PROGRESS! ANYTHING CAN CHANGE AT ANY MOMENT WITHOUT ANY NOTICE! USE IT AT YOUR OWN RISK!

## Installation
> [!NOTE] This is for vim-plugged managed `.vimrc` file

>> Add this to your vim config `.vimrc` file
```vim
    Plug 'Yahm3/todos.vim'
```

After adding to your `.vimrc` file save and source(`:source $MYVIMRC`) it then install it with
```vim
  :PlugInstall
```
## Commands

- `:Time <args>(optional)` # This just displays the day month, day and the time e.g: Jul 21 17:29
                           # More about the command can be viewed in the doc folder.

- `<space>td`  # Generates a `todo.txt` file that has all the todos in the current working directory.
   If the file already exists it gets overwritten and if there are updates like more todos added after the generation
   of the `todo.txt` by pressing `<space>td` the file gets updated in order of priority.

- `<space>tdo` # opens the todo file if it exists and if the file doesn't exist, it gets generated and opened.
               #The `todo.txt` file can be used to navigate between TODOs and FIXMEs by just pressing `<enter>` 
                 under the task.
