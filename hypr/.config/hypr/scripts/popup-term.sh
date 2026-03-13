#!/bin/bash


FOCUSED_PID  = $(hyprctl activewindow -j | jq .pid)
CWD = $(readlink /proc/$FOCUSED_PID/cwd 2>/dev/null || echo "$HOME")


if [ - f "$CWD/.venv/bin/activate"]; then 
	VENV_CMD = "source $CWD/.venv/bin/activate/"
