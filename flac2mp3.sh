#!/bin/sh

FLAC_DIR=${1}
MP3_DIR=${2-mp3}

mkdir -p ${MP3_DIR}

FLAC_DIR=${FLAC_DIR%/*}
MP3_DIR=${MP3_DIR%/*}

for FLAC_FILE in ${FLAC_DIR}/*.flac; do
	MP3_FILE=${FLAC_FILE##*/}
	MP3_FILE="${MP3_DIR}/${MP3_FILE%.*}.mp3"

	ffmpeg -i "${FLAC_FILE}" -vcodec copy -ab 320k -map_metadata 0 -id3v2_version 3 "${MP3_FILE}"
done
