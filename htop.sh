#!/bin/bash
#
# ################### #
# Função do menu htop #
# ################### #
htop_menu() {
  while true; do
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
  htop # Abre o htop
  read -rp "Pressione Enter para continuar." # Aguarda o usuário pressionar Enter
}

# ############################# #
# Função para filtrar processos #
# ############################# #
filter_processes() {
    # Lê o nome do processo a ser filtrado
    read -r -p "Digite o nome do processo a ser filtrado: " process_name

    # Mostra os PIDs e nomes dos processos que correspondem ao nome informado (ignora maiúsculas/minúsculas)
    pgrep -ifl "$process_name"

    # Para cada PID encontrado, mostra detalhes do processo
    for pid in $(pgrep -i -f "$process_name"); do
        ps -p "$pid" -o pid,user,pcpu,pmem,comm
    done

    if [ -z "$process_name" ]; then
        echo "Nenhum processo encontrado com o nome '$process_name'."
    fi
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
