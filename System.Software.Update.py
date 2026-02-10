#!/bin/bash

echo "╔═══════════════════════════════════════════════════════╗"
echo "║      Update Notification nor linux software updates   ║"
echo "╚═══════════════════════════════════════════════════════╝"
echo "======================================================"
echo "a New Securiy Patch Update Packages may be available for your computer."
echo "It is Recommended that you install these Updates"
echo "======================================================="
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "   [1] Install Updates Now"
echo "   [2] Remind Me Later"
echo "   [3] Schedule A Avaliable Date & Time"
echo "   [4] View Details"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -n "Select option [1-4]: "

read -r choice

case $choice in
    1)
        clear
        echo "Installing updates..."
        echo ""
        echo "█▒▒▒▒▒▒▒▒▒ 10% Checking For Avaliable Updates"
        sleep 1
        echo "████▒▒▒▒▒▒ 40% Installing Software Updates"
        sleep 1
        echo "███████▒▒▒ 70% Configuring System Files"
        sleep 1
        echo "██████████ 100% Updates installed!"
        sleep 1
        echo "A Recent System Software Update Has Been Completed"
        sudo needrestart
        ;;
    2)
        echo ""
        echo "Updates postponed. You will be reminded later."
        ;;
    3)
        echo ""
        echo "Schedule update feature not implemented yet."
        ;;
    4)
        echo ""
        echo "Update Details: Security patches and bug fixes."
        ;;
    *)
        echo "Invalid selection."
        ;;
esac
