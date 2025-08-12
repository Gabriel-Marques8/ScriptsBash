#!/bin/bash

                                                            # Básico:
# Mostrar uma mensagem simples
echo "Hello, World!"

# Pedir para o usuário digitar algo e mostrar de volta
read -p "Entre com algum valor: " varName
echo "Você digitou: $varName"

# Pedir idade e mostrar
read -p "Digite sua idade: " idade
echo "Sua idade é: $idade"

# Pedir dois números para somar
read -p "Digite um número: " num1
read -p "Digite outro número: " num2

# Fazer a soma usando aritmética do bash
echo "A soma desses dois números é: $((num1 + num2))"

# Listar arquivos e pastas do diretório atual, com detalhes e ordenado por data (mais recente no topo)
ls -lth

                                                        # Intermediário:

# Meu codigo
# function isOdd($number) {
#     if (( $number % 2 == 0)); then
#         echo "$number é par"
#     else
#         echo "$number é ímpar"
#     fi
# }

# read -p "Digite um número: " number
# isOdd $number

# Correto
isOdd() {
    local number=$1   # pega o primeiro parâmetro da função e guarda na variável local "number"

    if (( number % 2 == 0 )); then
        echo "$number é par"
    else
        echo "$number é ímpar"
    fi
}

read -p "Digite um número: " number
isOdd "$number"

# Laco for
for ((count=1; count <11; count++))
do
    echo "$count";
done

# Laco while
read -p "Digite um número: " number

while [ "$number" -ne 0 ]; do
    echo "Você digitou: $number"
    read -p "Digite um número: " number
done

# Descobrir se existe a pasta existe no diretorio atual - ajuda total do chatGPT
if [ -d "nome_da_pasta" ]; then
    echo "A pasta nome_da_pasta existe."
else
    echo "A pasta nome_da_pasta não existe."
fi

# Função para saudação
function nomePessoa(){
    local nome=""
    read -p "Digite seu nome: " nome
    echo "Olá, $nome!"
}
nomePessoa
