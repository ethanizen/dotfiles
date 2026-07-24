#!/usr/bin/env bash
# Suspend on idle, but not while anyone is logged in over SSH.
#
# hypridle only knows about local input, so a remote session doing real work
# (a long build, a running agent) still looks idle to it. Instead of suspending
# immediately, wait for the last SSH session to go away first.

# Only ever one of these waiting at a time.
mkdir -p "${XDG_RUNTIME_DIR:-/tmp}/hypr"
exec 9>"${XDG_RUNTIME_DIR:-/tmp}/hypr/idle-suspend.lock"
flock -n 9 || exit 0

ssh_sessions() {
    local id
    for id in $(loginctl list-sessions --no-legend | awk '{print $1}'); do
        [[ $(loginctl show-session "$id" -P Service 2>/dev/null) == sshd ]] && return 0
    done
    return 1
}

# If the screen is locked now, an unlock means the user came back locally and
# the idle period is over, so the pending suspend should be dropped.
was_locked=false
pidof hyprlock >/dev/null && was_locked=true

while ssh_sessions; do
    if [[ $was_locked == true ]] && ! pidof hyprlock >/dev/null; then
        exit 0
    fi
    sleep 60
done

systemctl suspend
