#!/bin/bash

echo "Executando o script de entrada..."

# Remover o PID do servidor, se existir
rm -f /app/tmp/pids/server.pid

# Verifica se está iniciando o servidor Rails
if [[ "${*}" == *"bin/rails"* ]] && [[ "${*}" == *"s -b"* ]]; then
    # Verifica se o banco de dados existe
    if ! ./bin/rails db:version >/dev/null 2>&1; then
        echo "Banco de dados não encontrado. Criando, migrando e preenchendo..."
        ./bin/rails db:create
        ./bin/rails db:migrate
        ./bin/rails db:seed
        ./bin/rails assets:precompile
    else
        echo "Banco de dados já existe. Executando migrações..."
        ./bin/rails db:migrate
        ./bin/rails db:seed
    fi
fi

# Executa o comando passado como argumento
exec "${@}"