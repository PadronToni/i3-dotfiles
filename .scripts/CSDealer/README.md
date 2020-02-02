# CSDealer

A "config file wrapper\" that adds variables, Xresources colours, and other cool stuff to config files, using templates.


## How to use

1. Place a copy of your config file in `/template` folder and insert at the top of file, sections and keys (called also properties or variables), like in INI format.

   You <u>**MUST**</u> insert at least the **CSDdir** variable in `[variables]` section with the target directory as value, if not, the file will not be recognised as a template.

   Example:

   ```
   [variables]
   CSDdir = /path/to/file/filename
   [content]
   configuration {
   	combi-modi:     "drun,run";
   	sidebar-mode:   false;
       show-icons:     false;
   ```

   All lines after `[content]` section declaration, will be interpreted as the content to be printed in **CSDdir** directory.

   > NOTE : 
   >
   > - If your config file is in INI format, don't worry... All lines after `[content]` section declaration, will not be modified or interpreted by CSDealer, except for replace variables.
   > - You can declare `CSDdir` with absolute path or using `~`, the script will recognise it anyway.



2. Replace colours and font values with default variables.

   default variables:

   ```
   @bg@ # background color
   @fg@ # foreground color
   @color0@ # base16 color 0 Xresources color
   @color8@ # base16 color 8 Xresources color
   @color1@ # base16 color 1 Xresources color
   ... and so on
   
   @font@ # font defined in .Xresources file like so: *.font: font_family weight size
   ```

   example:

   ```css
   * {
      margin:                     0;
      spacing:                    0;
      border:                     0;
      scrollbar:                  false;
      text-color:                 @fg@;
      background-color:           transparent;
      border-color:               @color4@;
      font:                       "@font@ 8";
   }
   
   ...
   ```



3. You can also define your own variables, locally in `[variables]` section of the current template, or even globally in the `index.ini` file.

   index.ini file

   ```
   [variables]
   inPad =	5px
   pad =	8px
   ```

   template file

   ```
   [variables]
   CSDdir = ~/path/to/file/filename
   radius = 6px
   [content]
   
   ...
   
   #textbox-search {
       padding:            @inPad@ @pad@;
       border-radius:      @radius@;
       str:                "Search";
       background-color:   @defaultBg;
       expand:             false;
   }
   
   ...
   ```

   > NOTE : 
   >
   > - Variable values will be treated as strings, so you can put anything you want.
   > - CSDealer recognise INI format comments, but only in `[variables]` section.
   > - Global variables will be applied before local ones, so you can even set global variables as value of local ones.



## Execution

When executed, **CSD** process every file in `/template` folder (even if there are sub-directories)  that has `CSDdir` variable declared.

## Notice

It works only with **.Xresources** file, because **CSD** uses `xrdb -query` command to gather color values.

## License

This project is licensed under the temrs of the GNU Lesser General Public License v3.0.