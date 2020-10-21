# vim

_**NOTE:**_ My vimrc has numerous plugins, all of which i use everyday.
Since not everyone is as creazy as i am, this file only explains how to install the basic ones.
For any additional info on any of the plugins used in my vimrc, or anything else concerning vim usage
please email me at sotiris4321@gmail.com

Also a good practice would be to check this repo from time to time 
since I update it regurarly adding new features and extending old ones!

## vim plugins

To experience the real power of vim we have to use pluggins.
Pluggins in vim can be compared to libraries in a language. i
They extend the basic functionality of vim and add more features.

### using a pluggin manager

Although we could simpy=ly download the plugins by hand 
and simply place them inside the corresponding dirs, I will show you the more relaxed, automatic
way: Using a plugin manager!

I will demostrate using "Plugged" but you can use any other manager you wish 
and everything should be fairly the same!

To download and enable plug, we just have to run 

```bash
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

in our terminal.

You can also add this script I have created that will automatically 
check your Plug installation and your plugins and update if necessary when you start vim.

```vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
```

:warning: If youre trying this on windows please reffer here since installation is NOT the same.

As you can propably guess by reading the script above, to install any plugins 
and/or add new ones we simply run ":PlugInstall" from whithin vim. Any plugin that is included 
between the plug#begin and plug#end calls will be installed and added to vim.

Let us first figure out what we need though.

### the basics

When using a code editor I, and I believe most of you expect **three basic features**:
- Movement, highlighting and ease-of-use functionality.
- good color highlights, variable trackings, namespaces etc...
- autocompletition and linting and propably debuging if applicable

Since vim has propably the most sophisticated command mode compared to any other editor 
we really needn't worry about the first point mentioned.

#### colorscheme: gruvebox to feel the groove

What we now need, is to choose a colorscheme.
Lucky for us there are thousands of colorschemes with unique  features and a variaty of 
functionalities for everyone to choose.
I have choosen gruvebox since its simple but has really good variable 
tracking and type distinction.

To install gruvebox just add this line to your vimrc, after calling plug (Plug#begin).

```vim
Plug 'gruvbox-community/gruvbox'
```

#### automplete: Coc ftw!

Now lets move on to the real stuff. Autocompletion, linting and debuging.

For autocompletion the choice is a one-way road: Conquer Of Completion or simply coc.

---
**a little history lesson**

> Coc utilizes the recently published language servers initally developed by Microsoft 
(YES i didnt want to believe it either!) and connects lsp engines directly to vim!

You propably have no idea what im talking about, like , what the fuck are lsp's!?

Well the good thing is you dont really need to know because 
everything will just work out of the box.

The bad thing is you propably are falling way behind developments and should really start reading
but thats a topic for some other time!

---

Now lets look at Coc and how to install it.

You simply add the following line to your vimrc (after calling plug obviously):

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Coc on its own wont do anything!!!

Its just the link between some language server/engine and vim. 
Following the link below you can find all available lsp engines.
Just choose the ones you want and install them using the ":CocInstall" command.
For example,to install c/c++ engine i would run ":CocInstall coc-clangd".
After that just visit the plugins repository/site and read about the different options!

CAUTION: Coc does  NOT work with the setpaste option of vim!
If you use that option coc will break and there will be no completion!

Now lets move on to linting!
Many people find that Coc is enough for developing software.
Personally i want a more "intelligent" view of my code, i
and not just plain old stupid compilation.
Here is where ALE comes into play.

ALE is a powerful linter that can help any developer find bugs and logical gaps 
(line unused or uninitialized variables) before he even has to compile or run the code.

To install ALE just add the following line to your vimrc (after you have called plug!):

Plug 'dense-analysis/ale'

ALE has lsp features itself so if you want to use it along with Coc like me you have to add:
"let g:ale_disable_lsp = 1"
to your vimrc and also add the line
"diagnostic.displayByAle" 
 to your coc-config file and set it to true!
