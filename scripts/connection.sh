#!/bin/bash
set -e

echo "Choose connection name"

nmcli -t -f NAME,TYPE connection show

CONNECTION_NAME=""
while [[ -z "${CONNECTION_NAME}" ]]; do
    read -p "Enter: " CONNECTION_NAME
    if [[ -z "${CONNECTION_NAME}" ]]; then
        echo "Please enter a valid connection name"
    fi
done

echo $CONNECTION_NAME

nmcli connection modify "$CONNECTION_NAME" ipv4.dns "192.168.1.XX" ipv4.ignore-auto-dns true
nmcli connection up "$CONNECTION_NAME"

