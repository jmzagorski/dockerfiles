#!/usr/bin/env bash

# Credit to https://willhaley.com/blog/generate-jwt-with-bash/
# Generates a HS256 JWT
# Arg 1 the secret
# Arg 2 any additional items to add to the jwt
# example: bash jwtgen.sh "your secret here" '"aud":"some audience","sub":"user"'

SECRET=$1

NOW=$(date +%s)
IAT="${NOW}"
# expire 9 minutes in the future
EXP=$((${NOW} + 540))
ARGS=$2
HEADER='{
    "type": "JWT",
    "alg": "HS256"
}'
PAYLOAD='{
    "iat":'"${IAT}"',
    "exp":'"${EXP}"',
    '"${ARGS}"'
}'

function base64_encode() {
    declare input=${1:-$(</dev/stdin)}
    printf '%s' "${input}" | base64 | tr -d '=' | tr '/+' '_-' | tr -d '\n'
}

function rs_sign() {
    declare input=${1:-$(</dev/stdin)}
    printf '%s' "${input}" | openssl dgst -sha256 -hmac "${SECRET}" -binary
}

JWT_HDR_B64="$(echo "${HEADER}" | base64_encode)"
JWT_PAY_B64="$(echo "${PAYLOAD}" | base64_encode)"
UNSIGNED_JWT="${JWT_HDR_B64}.${JWT_PAY_B64}"
SIGNATURE=$(echo -n "$UNSIGNED_JWT" | rs_sign | base64_encode)

echo "$UNSIGNED_JWT.$SIGNATURE"
