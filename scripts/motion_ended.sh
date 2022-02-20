#!/bin/bash
LAST_FRAME=${HOME}/frames/$(ls -1tr ${HOME}/frames/|tail -n1)
${HOME}/scripts/send_pgpmime.sh Motion ${LAST_FRAME} 'Motion ended.'
