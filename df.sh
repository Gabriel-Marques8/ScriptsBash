#!/bin/bash
#
# ####################### #
# Função do menu DiskFree #
# ####################### #
df_menu() {
    while true; do
        clear
        echo "=== Menu DiskFree ==="
        echo "1) Exibir uso de disco (KB)"
        echo "2) Exibir uso de disco (MB)"
        echo "3) Exibir uso de disco (GB)"
        echo "4) Voltar"
        echo
        read -rp "Escolha uma opção: " opcao

        case $opcao in
            1) df_function "K" ;; # kilobytes
            2) df_function "M" ;; # megabytes
            3) df_function "G" ;; # gigabytes
            4) break ;;
            *) echo "Opção inválida!"; sleep 1 ;;
        esac
    done
}

# ################## #
# Função do DiskFree #
# ################## #
df_function() {
    df -B"$1" | column -t # Exibe o uso de disco baseado na unidade especificada
    read -rp "Pressione Enter para continuar." # Aguarda o usuário pressionar Enter
}
