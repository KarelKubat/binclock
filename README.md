# BinClock

![binclock](binclock.png)

BinClock is a small app for Mac OSX that displays a binary clock: hours, minutes and seconds are displayed as bits, with decimal output on the right side for ease of reading. The above image was taken at 18:43:45.

BinClock uses a "widget-like" display; it stays on top of other windows. But it is just a Mac OSX binary with one (undecorated) output window. It starts in the upper right hand corner (you can modify the source if you want something else).

## To build:

- Fork the repo
- `cd` into the directory where `build.sh` resides
- Run `./build.sh` (you will need XCode tools)

## To install:

- Put the resulting binary (something like `.../binclock/.build/arm64-apple-macosx/release/BinClock`, the build script will tell you) into some directory on your `$PATH`.
- If you want, copy `binclock.sh` (start/stop wrapper) also to some directory in your `$PATH`.

## To run it:

- Start the resulting binary `BinClock`. Add an ampersand if you are running it from the commandline (or from `cron`) so that it runs in the background. From a terminal, use `nohup BinClock &` so that it continues running after closing said terminal.
- If you have copied the wrapper `binclock.sh` to anywhere along `$PATH`, you can use:
  - `binclock.sh start` - to start the clock
  - `binclock.sh stop` - to stop it
  - `binclock.sh status` - to see if it's running



## To stop it:

The UI controls are minimal, by design. Kill it from the commandline by running `killall BinClock`. Or, as shown above, use `binclock.sh stop`.
