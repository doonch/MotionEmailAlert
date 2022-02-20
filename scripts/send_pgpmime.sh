#!/bin/bash

ADMIN_EMAIL=my_email@gmail.com
SUBJECT=$1
FRAME=$2
MESSAGE=$3
BOUNDARY_1=b1_$(tr -dc A-Za-z < /dev/urandom | head -c20)
BOUNDARY_2=b2_$(tr -dc A-Za-z < /dev/urandom | head -c20)

sendmail ${ADMIN_EMAIL} << END_OF_EMAIL
Subject: ENCRYPTED from $(hostname): ${SUBJECT}
From: ${USER}
Mime-Version: 1.0
Content-Type: multipart/encrypted; boundary=${BOUNDARY_1}; protocol="application/pgp-encrypted";
Content-Disposition: inline

--${BOUNDARY_1}
Content-Type: application/pgp-encrypted
Content-Disposition: attachment

--${BOUNDARY_1}
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="msg.asc"

$(gpg --encrypt --armor --recipient ${ADMIN_EMAIL} << END_ENCRYPTED
Content-Type: multipart/mixed; boundary="${BOUNDARY_2}"
Content-Disposition: inline

--${BOUNDARY_2}
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

$(~/scripts/greet.sh)
This message was sent on $(date).
Battery $(~/scripts/power.sh)

${MESSAGE}

Enjoy your day!

-
${USER}


--${BOUNDARY_2}
Content-Type: image/jpeg
Content-Disposition: attachment; filename="frame.jpeg"
Content-Transfer-Encoding: base64

$(base64 ${FRAME})

END_ENCRYPTED
)


END_OF_EMAIL

