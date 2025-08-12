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
            1) lsblk ;;
            2) break ;;
            *) echo "Opção inválida!"; sleep 1 ;;
        esac
    done
}
