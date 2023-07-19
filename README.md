# Less with syntax highlighting

The only package dependency is `source-highlight`, which should be available in the package manager of most Linux distributions. It can also be obtained from the [GNU page for the source-highlight project](https://www.gnu.org/software/src-highlite/).

## Installation

1. Ensure `source-highlight` is installed
2. Clone this git repo
3. Run `install.sh`, which will create necessary symlinks into `~.local/bin` and `~/.config/source-highlight`

## Usage

Use `lessh` the same way you use `less` in your terminal.

`lang.map` contains custom language mappings for extra file types that I use. Feel free to add more into this config file to extend support to more file types. All supported languages can be found in `/usr/share/source-highlight/`, which is also where custom styles can be added as well. Like the base `source-highlight` package, this script will look for a `lang.map` file in the working directory where the `lessh` command is run, which can be used to specify folder-specific mappings.

If your terminal supports 256 colors, this script will default to using them. Otherwise it will fallback to source-highlight's default 6-bit color scheme.

And as one more note, the colors configured in esc256.outlang are tuned to my specific terminal theme which is the [Gogh Smyck theme](https://github.com/Gogh-Co/Gogh/blob/master/themes/Smyck.yml). Only the shade of red & yellow have been changed in my outlang file, but depending on your terminal theme you might want to adjust these or other colors to your preference.

## Future improvements

* Proper testing & handling for passing multiple files into the command
* Better language inferencing for piped content. Piping into lessh will not 
  detect the language but it is possible to manually infer some languages within
  the pipewrapper and send the appropriate params into `source-highlight` to 
  make code detected. For example, (jaygooby has written a  Gist to do language 
  inference)[https://gist.github.com/jaygooby/9494858d3d481a64819d227a9318f6c7]
  like what I'd like to do. However I think it might be possible to expand this
  to even more languages.
* More integration with source-highlight's documented configuration hooks. The
  app allows setting configuration files and other settings with environment
  variables which aren't currently being used but could be to make this script
  more robust.
