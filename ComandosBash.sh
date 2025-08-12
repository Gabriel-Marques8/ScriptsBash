#!/bin/bash

function menu_principal {
    while true; do
        clear # Limpa a tela
        echo "=== Menu Principal ==="
        echo "1) Procurar arquivo"
        echo "2) Informações do kernel"
        echo "3) Tempo de atividade do sistema"
        echo "4) Uso de memória"
        echo "5) IP da máquina"
        echo "6) Testar conectividade (PING)"
        echo "7) Uso de disco"
        echo "8) Sair"
        printf "\n"
        
        read -rp "Escolha uma opção: " opcao

        case $opcao in
            1) procurar_arquivo ;; # Chama a função para procurar arquivo
            2) mostrar_informacoes_kernel ;; # Chama a função para mostrar informações do kernel
            3) saber_tempo_sistema ;; # Chama a função para saber o tempo de atividade do sistema
            4) saber_uso_memoria ;; # Chama a função para saber o uso de memória
            5) mostrar_ip_maquina ;; # Chama a função para mostrar o IP da máquina
            6) testar_conectividade ;; # Chama a função para testar conectividade
            7) mostrar_uso_disco ;; # Chama a função para mostrar o uso de disco
            8) echo "Saindo..."; exit 0 ;; # Sai do script
            *) echo "Opção inválida!"; sleep 1 ;; # Mostra mensagem de erro
        esac
    done
}

# Função para limpar a tela
function limpar_tela {
    clear # Limpa a tela
}

# comando para procurar arquivo
function procurar_arquivo {
    limpar_tela # Limpa a tela
    read -rp "Digite o nome do arquivo a ser procurado: " arquivo # Solicita o nome do arquivo
    find / -name "$arquivo" # Procura o arquivo
    echo "Pressione qualquer tecla para continuar..."
    read -rn 1
}

# comando para mostrar informacoes de kernel
function mostrar_informacoes_kernel {
    limpar_tela # Limpa a tela
    uname -a # Mostra as informações do kernel
    echo "Pressione qualquer tecla para continuar..."
    read -rn 1
}

# comando para saber quanto tempo meu sistema esta ligado
function saber_tempo_sistema {
    limpar_tela # Limpa a tela
    uptime # Mostra o tempo de atividade do sistema
    echo "Pressione qualquer tecla para continuar..."
    read -rn 1
}

# comando para saber o uso total de memoria free -h
function saber_uso_memoria {
    limpar_tela # Limpa a tela
    free -h # Mostra o uso de memória
    echo "Pressione qualquer tecla para continuar..."
    read -rn 1
}

# comando para mostrar o ip da maquina
function mostrar_ip_maquina {
    limpar_tela # Limpa a tela
    echo "Ip Server: $(hostname -I)" # Mostra o IP da máquina
    echo "Pressione qualquer tecla para continuar..."
    read -rn 1
}

# comando para testar conectividade da maquina PING
function testar_conectividade {
    limpar_tela # Limpa a tela
    ping -c 4 google.com # Testa a conectividade
    echo "Pressione qualquer tecla para continuar..."
    read -rn 1
}

# comando para mostrar o uso de disco
function mostrar_uso_disco {
    limpar_tela # Limpa a tela
    df -h # Mostra o uso de disco
    echo "Pressione qualquer tecla para continuar..."
    read -rn 1
}

menu_principal # Inicia o menu principal