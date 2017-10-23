#!/usr/bin/env bash

i3status -c $HOME/.config/i3blocks/i3status.conf | while IFS= read -r line; do
    PARTS=($line)

    CHARGE="${PARTS[1]}"
    CHARGE="${CHARGE%\%*}"
    [[ "${CHARGE}" -gt 100 ]] && {
        CHARGE="100"
    }

    STATE=""
    [[ "${PARTS[0]}" = "BAT" ]] && {
        STATE="${PARTS[2]}"
        [[ -n "${STATE}" ]] && {
            STATE="${STATE:0:-3}"
            STATE=" (${STATE})"
        }
    }

    LEVEL=$(( (CHARGE - 1) / 20 ))
    # if [[ "${PARTS[0]}" -eq "CHR" ]]
    # then
        # ICON="f0e7"
    # else
        ICON="f$(( 244 - LEVEL ))"
    # fi

    echo -e " \u${ICON}  ${CHARGE}%${STATE} "

    [[ "${LEVEL}" = "0" ]] && {
        [[ -z "${STATE}" ]] || i3-msg "fullscreen disable" >/dev/null
    }
done