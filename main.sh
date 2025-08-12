#!/bin/bash
#
### BEGIN INFO
#
# Executando novo Menu voltado para comandos linux básicos: HTOP, DF –KH, LSBLK.
#
# descricao: Menu interativo para monitoramento e gerenciamento de recursos do sistema.
#
### END INFO

# ################################################################################################### #
# Script Utilizado para monitoramento e gerenciamento de recursos do sistema.                         #
# Servidor: Linux                                                                                     #
# Responsavel pela Criacao do Script: Gabriel Marques                                                 #
# Data de Criacao: 11-08-2025                                                                         #
# Data Ult Revisao: 11-08-2025                                                                        #
# Versao: 1.0                                                                                         #
# ################################################################################################### #

# ############################## #
# IMPORTANDO FUNCOES NECESSARIAS #
# ############################## #

source ./htop.sh # Carrega funções do htop.sh
source ./df.sh   # Carrega funções do df.sh
source ./lsblk.sh # Carrega funções do lsblk.sh

# ######################## #
# Função do menu principal #
# ######################## #
menu_principal() {
  while true; do
    clear # Limpa a tela
    echo "=== Menu Principal ===" # Exibe o escopo do menu principal para o usuário se informar
    echo "1) htop"
    echo "2) df"
    echo "3) lsblk"
    echo "4) Sair"
    printf "\n"
    read -rp "Escolha uma opção: " opcao

    case $opcao in
      1) htop_menu ;;  # chama função do htop.sh
      2) df_menu ;;    # chama função do df.sh
      3) lsblk_menu ;; # chama função do lsblk.sh
      4) echo "Saindo..."; exit 0 ;; # sai do script
      *) echo "Opção inválida!"; sleep 1 ;; # mostra mensagem de erro
    esac
  done
}

# ################# #
# Inicia o programa #
# ################# #
menu_principal
