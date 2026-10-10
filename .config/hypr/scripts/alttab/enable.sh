#!/usr/bin/env bash
mkdir -p $XDG_RUNTIME_DIR/hypr/alttab
hyprctl -q eval 'hl.config({ animations = { enabled = false } }); alttab_binds(false)'
footclient -a alttab $HOME/.config/hypr/scripts/alttab/alttab.sh $1
# Safety net: restore state however the switcher was closed
hyprctl -q eval 'hl.config({ animations = { enabled = true } }); alttab_binds(true)'
hyprctl -q eval "hl.dispatch(hl.dsp.focus({ window = \"address:$(cat $XDG_RUNTIME_DIR/hypr/alttab/address)\" })); hl.dispatch(hl.dsp.window.alter_zorder({ mode = \"top\" }))"
