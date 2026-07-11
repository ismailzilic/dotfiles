#!/bin/bash

# $1 - target: "output" | "input"
# $2 - action: "mute" | "X%+" | "X%-" | "X"

TARGET="${1}"
ACTION="${2}"

case "${TARGET}" in
	"output")
		DEVICE="@DEFAULT_AUDIO_SINK@"
		;;
	"input")
		DEVICE="@DEFAULT_AUDIO_SOURCE@"
		;;
	"")
		;;
	*)
		echo "Usage: $0 {output|input} {mute|X%+|X%-|X}" >&2
		exit 1
		;;
esac

if [[ -n "${TARGET}" ]]; then
	case "${ACTION}" in
		"mute")
			wpctl set-mute "${DEVICE}" toggle
			;;
		*"+")
			wpctl set-volume -l 1 "${DEVICE}" "${ACTION}"
			;;
		*"-")
			wpctl set-volume "${DEVICE}" "${ACTION}"
			;;
		*)
			wpctl set-volume "${DEVICE}" "${ACTION}%"
			;;
	esac
fi


OUTPUT_VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk -F': *' '{print $NF}')
INPUT_VOL=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk -F': *' '{print $NF}')

[[ "${OUTPUT_VOL}" == "0.00" || "${OUTPUT_VOL,,}" == *"muted"* ]] && OUTPUT_VOL="Muted" || OUTPUT_VOL=$(echo "${OUTPUT_VOL}" | awk '{print $1 * 100}')
[[ "${INPUT_VOL}" == "0.00" || "${INPUT_VOL,,}" == *"muted"* ]] && INPUT_VOL="Muted" || INPUT_VOL=$(echo "${INPUT_VOL}" | awk '{print $1 * 100}')

echo "Spk: ${OUTPUT_VOL} | Mic: ${INPUT_VOL}"
pkill -RTMIN+8 waybar
