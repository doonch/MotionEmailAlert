#!/bin/bash
source ${HOME}/scripts/config.sh

LAST_FRAME=${FRAMES_DIR}/$(ls -1tr ${FRAMES_DIR}/|tail -n1)
${HOME}/scripts/send_pgpmime.sh Motion 'Motion ended.' ${LAST_FRAME}
