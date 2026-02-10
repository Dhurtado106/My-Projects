#!/bin/bash

while true; do
    clear
    echo "╔═══════════════════════════════════════════════════════╗"
    echo "║     The Linux System Software Update Program          ║"
    echo "╚═══════════════════════════════════════════════════════╝"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "   [1] Install Updates Now"
    echo "   [2] Remind Me Later"
    echo "   [3] Schedule a Restart"
    echo "   [4] Review Important Updates"
    echo "   [5] Review Optional Updates"
    echo "   [6] Restart Tonight"
    echo "   [7] Exit Program"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo -n "Select option [1-7]: "

    read -r choice

    case $choice in
        1)
            clear
            echo "Starting system update..."
            echo ""

            START_TIME=$(date +%s)

            sudo apt update
            if [ $? -ne 0 ]; then
                echo "apt update failed"
                read -rp "Press Enter to return..."
                continue
            fi

            sudo apt upgrade -y
            if [ $? -ne 0 ]; then
                echo "apt upgrade failed"
                read -rp "Press Enter to return..."
                continue
            fi

            END_TIME=$(date +%s)
            ELAPSED=$((END_TIME - START_TIME))

            echo ""
            printf "Update completed in %02d:%02d:%02d\n" \
                $((ELAPSED/3600)) \
                $((ELAPSED%3600/60)) \
                $((ELAPSED%60))

            echo ""
            echo "Checking if reboot is required..."
            command -v needrestart >/dev/null && sudo needrestart -r l

            read -rp "Press Enter to return to menu..."
            ;;
        2)
            echo "Updates postponed."
            sleep 1
            ;;
        3)
            echo "Restart scheduling not implemented yet."
            sleep 1
            ;;
        4)
            apt list --upgradable
            read -rp "Press Enter..."
            ;;
        5)
            echo "Optional updates handled by package manager."
            read -rp "Press Enter..."
            ;;
        6)
            echo "System will reboot now."
            sudo reboot
            ;;
        7)
            echo "Exiting."
            exit 0
            ;;
        *)
            echo "Invalid option."
            sleep 1
            ;;
    esac
done
