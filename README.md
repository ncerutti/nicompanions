# nicompanions
A series of utilities that I developed to ease my work.

To install them, you can use `install.sh`. It will just copy the necessary files in the `.local/bin` folder in your home directory. Since that should (hopefully!) be part of your `PATH`, you will be able to call the commands directly from your favourite terminal.

- `gentext` allows you to copy a bunch of text in different files and subfolders at once, and have it in your clipboard ready to paste.
```bash
usage: gentext [-h] [--i FOLDER_PATH] [--files EXTENSIONS [EXTENSIONS ...]] [--allfiles] [--o OUTPUT_FILE]

Generate project text.

options:
  -h, --help            show this help message and exit
  --i FOLDER_PATH       Path to the project folder
  --files EXTENSIONS [EXTENSIONS ...]
                        File extensions to include (default: .py; all for all files)
  --allfiles            Include all file extensions and ignores none
  --o OUTPUT_FILE       Output file name (optional)
```

The `gentext/` folder contains the source and a template `.sh` file, in case you prefer to use your own python/venv. In that case, install it yourself, because `install.sh` will install it as a standalone binary with python and all dependencies baked in. The price of this convenience is that the executable is 15MB.

- `podman-destroy` allows you to remove a bunch of containers/images/volumes/networks at once.
```bash

This is a utility script to help you delete all podman containers at once.
If you feel wrathful, you can delete images,volumes and networks too.

The options generously offered to you are:

-a | --all                              will delete images, volumes, and networks
-i | --images                           will delete all images
-v | --volumes                          will delete all volumes
-n | --networks                         will delete all networks
-h | --help                             will show this message. But you knew that already, didn't you?
```
