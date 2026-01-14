# typee

**Editor Abstraction Layer** - One command, multiple editors.

Switch editors by changing a flag, not your muscle memory.

## Why?

Today you use VS Code, Cursor, Windsurf, Antigravity...
Tomorrow you switch to something new.
With `typee`, you change nothing. It just works.

## Features

- Auto-detects editor paths using [Everything](https://www.voidtools.com/) (`es.exe`)
- Zero configuration - no PATH editing, no manual paths
- Fallback to Notepad if editor not found
- Works with any editor that has an `.exe`

## Requirements

- Windows
- [Everything](https://www.voidtools.com/) installed and running
- [Everything CLI (es.exe)](https://www.voidtools.com/support/everything/command_line_interface/) in PATH

```batch
winget install voidtools.Everything
winget install voidtools.Everything.Cli
```

## Installation

1. Clone this repo (or just grab `typee.bat`)
2. Add the folder to your PATH

```batch
git clone https://github.com/Jeffrey0117/typee.git C:\dev\typee
```

## Usage

```batch
typee test.txt            # type (print to CLI)
typee --m test.txt        # more
typee --n test.txt        # Notepad

typee --vs test.txt       # VS Code
typee --cursor test.txt   # Cursor
typee --wind test.txt     # Windsurf
typee --anti test.txt     # Antigravity
```

## How It Works

1. You run `typee --vs myfile.txt`
2. `typee` calls `es.exe` to search for `Code.exe`
3. Everything instantly returns the path
4. `typee` launches the editor with your file
5. If not found, falls back to Notepad

## Adding New Editors

Edit `typee.bat` and add a new mapping:

```batch
if /i "%OPTION%"=="--myeditor" set "EXE_NAME=MyEditor.exe"
```

That's it. No paths needed.

## License

MIT
