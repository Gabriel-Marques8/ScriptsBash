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

# ################### #
# Função do menu htop #
# ################### #
htop_menu() {
  while true; do
    clear # Limpa a tela
    echo "Escolha uma opção:"
    echo "1. HTOP"
    echo "2. Filtrar processos"
    echo "3. Ordenar por uso de CPU"
    echo "4. Voltar"
    printf "\n"

    check_htop_function # Verifica se o htop está instalado

    read -r -p "Digite a opção desejada: " option_htop

    case $option_htop in
      1) htop_function ;; # Chama a função htop
      2) filter_processes ;; # Chama a função filter_processes
      3) sort_by_cpu ;; # Chama a função sort_by_cpu
      4) break ;; # Volta para o menu principal (sai do loop) e volta para o menu anterior
      *) echo "Opção inválida."; sleep 1 ;; # Mostra mensagem de erro
    esac
  done
}

# ################################# #
# Verifica se o htop está instalado #
# ################################# #
check_htop_function() {
  if ! command -v htop &> /dev/null; then
    echo "HTOP não está instalado. Instalando..."
    sudo apt-get update && sudo apt-get install -y htop
  fi
}

# ############## #
# Função do htop #
# ############## #
htop_function() {
  clear # Limpa a tela
  htop # Abre o htop
  read -rp "Pressione Enter para continuar." # Aguarda o usuário pressionar Enter
}

# ############################# #
# Função para filtrar processos #
# ############################# #
filter_processes() {
  clear # Limpa a tela
  
  # Lê o nome do processo a ser filtrado
  read -r -p "Digite o nome do processo a ser filtrado: " process_name
  
  # Mostra os PIDs e nomes dos processos que correspondem ao nome informado (ignora maiúsculas/minúsculas)
  pgrep -ifl "$process_name"
  
  # Para cada PID encontrado, mostra detalhes do processo
  for pid in $(pgrep -i -f "$process_name"); do
      ps -p "$pid" -o pid,user,pcpu,pmem,comm
  done
  read -rp "Pressione Enter para continuar." # Espera o usuário pressionar Enter
}

# ############################# #
# Função para ordenar por CPU   #
# ############################# #
sort_by_cpu() {
  echo "Abrindo htop ordenado por CPU" # Mensagem informativa
  htop -s PERCENT_CPU # Abre o htop ordenado por uso de CPU
  read -rp "Pressione Enter para continuar." # Aguarda o usuário pressionar Enter
}

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
    clear # Limpa a tela
    df -B"$1" | column -t # Exibe o uso de disco baseado na unidade especificada
    read -rp "Pressione Enter para continuar." # Aguarda o usuário pressionar Enter
}

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
function lsblk_function(){
  clear # Limpa a tela
  lsblk # Lista todos os dispositivos
  read -rp "Pressione Enter para continuar." # Aguarda o usuário pressionar Enter
}

# ################# #
# Inicia o programa #
# ################# #
menu_principal