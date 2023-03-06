#!/bin/bash

# verificando se um argumento foi fornecido
if [ $# -eq 0 ]; then
    echo "Erro: Nenhum dado foi especificado."
    exit 1
fi

# separando o número de faces do dado dos ajustes
IFS='+' read -ra DICE <<< "$1"
DICE_SIZE=${DICE[0]}
ADJUSTMENT=${DICE[1]:-0}

IFS='-' read -ra DICE <<< "$1"
DICE_SIZE=${DICE[0]}
ADJUSTMENT=$((ADJUSTMENT-${DICE[1]:-0}))

# gerando um número aleatório entre 1 e o número de faces do dado
ROLL=$(( RANDOM % DICE_SIZE + 1 ))

# exibindo uma animação em ASCII enquanto o dado rola
echo -n "Rolando o dado..."
for i in {1..10}
do
    echo -n " $(( RANDOM % DICE_SIZE + 1 ))"
    sleep 0.1
done
echo ""

# exibindo o resultado do rolamento do dado e o ajuste, se houver
echo "Você rolou um d${DICE_SIZE} e obteve um resultado de $ROLL"
echo "Adicionando um ajuste de $ADJUSTMENT"
echo "O resultado final é $((ROLL+ADJUSTMENT))"
