#!/bin/sh

# Função para efeito de "digitando"
digitar() {
  texto="$1"
  for i in $(seq 0 ${#texto}); do
    printf "\r${texto:0:i}"
    sleep 0.02
  done
  echo
}

# Lista de comandos com descrição
menu() {
  clear
  echo "\033[1;32m=== MENU DE COMANDOS DO OPENBSD ===\033[0m"
  echo ""
  echo "Escolha um comando:"
  echo "1) Data e hora atual (date)"
  echo "2) Tempo ligado (uptime)"
  echo "3) Espaço em disco (df -h)"
  echo "4) Endereço IP (ifconfig)"
  echo "5) Processos ativos (top)"
  echo "6) Tabela de rede (netstat)"
  echo "7) Árvore de processos (pstree)"
  echo "8) Monitor de recursos (htop)"
  echo "0) Sair"
  echo ""
  printf "Digite sua escolha: "
}

# Loop principal
while true; do
  menu
  read opcao
  clear

  case $opcao in
    1)
      digitar "📅 Mostrando data e hora atual..."
      echo ""
      date
      ;;
    2)
      digitar "⏱️  Mostrando tempo ligado do sistema..."
      echo ""
      uptime
      ;;
    3)
      digitar "💽 Verificando espaço em disco disponível..."
      echo ""
      df -h
      ;;
    4)
      digitar "🌐 Descobrindo endereço IP..."
      echo ""
      ifconfig | grep inet
      ;;
    5)
      digitar "📊 Exibindo processos com uso de CPU/memória (5s)..."
      echo ""
      top -d1 | head -n 20
      ;;
    6)
      digitar "📡 Mostrando tabela de roteamento de rede..."
      echo ""
      netstat -rn
      ;;
    7)
      digitar "🌲 Mostrando árvore de processos..."
      echo ""
      pstree
      ;;
    8)
      digitar "⚙️  Abrindo o monitor interativo HTOP..."
      echo ""
      echo "Pressione F10 ou q para sair do htop."
      sleep 1
      htop
      ;;
    0)
      digitar "👋 Encerrando apresentação. Até logo!"
      break
      ;;
    *)
      echo "Opção inválida. Pressione ENTER para tentar novamente."
      read lixo
      ;;
  esac

  echo ""
  echo "\033[1;34mPressione ENTER para voltar ao menu...\033[0m"
  read lixo
done
