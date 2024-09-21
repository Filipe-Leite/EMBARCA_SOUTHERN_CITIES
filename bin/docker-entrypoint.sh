#!/bin/bash

# Verifica se o banco de dados já foi criado antes de rodar db:create e db:migrate
if [[ "${*}" == *"bin/rails"* ]] && [[ "${*}" == *"s -b"* ]]; then
    # Verifica se o banco de dados já tem alguma tabela criada
    if ! ./bin/rails db:version >/dev/null 2>&1; then
        ./bin/rails db:create
        ./bin/rails db:migrate
        ./bin/rails db:seed
    fi
fi

rm -f /app/tmp/pids/server.pid

exec "${@}"
