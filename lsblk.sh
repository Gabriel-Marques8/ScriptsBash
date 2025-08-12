#!/bin/bash
#
# #################### #
# Função do menu lsblk #
# #################### #
lsblk_menu() {
    while true; do
        clear
        echo "=== Menu lsblk ==="
        echo "1) Listar todos os dispositivos"
        echo "2) Voltar"
        printf "\n"
        read -rp "Escolha uma opção: " opcao

        case $opcao in
            1) lsblk_function ;;
            2) break ;;
            *) echo "Opção inválida!"; sleep 1 ;;
        esac
    done
}

# ################# #
# Função do lsblk   #
# ################# #
lsblk_function() {
    clear # Limpa a tela
    lsblk # Lista todos os dispositivos
    read -rp "Pressione Enter para continuar." # Aguarda o usuário pressionar Enter
}

lsblk_menu