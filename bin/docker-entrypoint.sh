#!/bin/bash

if [ "${*}" == "./bin/rails server" ]; then
    ./bin/rails db:create
    ./bin/rails db:migrate
    ./bin/rails db:seed
fi

rm -f /app/tmp/pids/server.pid

exec "${@}"