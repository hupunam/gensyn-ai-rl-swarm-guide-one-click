#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Graceful exit function
graceful_exit() {
    echo ""
    echo ""
    echo -e "${GREEN}╔══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║                        👋 Thank You! 👋                          ║${NC}"
    echo -e "${GREEN}╚══════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${CYAN}🙏 Thank you for using Testnet Terminal's OneClick Setup!${NC}"
    echo ""
    echo -e "${YELLOW}🔗 Stay Connected:${NC}"
    echo -e "${BLUE}📱 Telegram: ${NC}https://t.me/TestnetTerminal"
    echo -e "${BLUE}🐙 GitHub: ${NC}https://github.com/TestnetTerminal" 
    echo -e "${BLUE}🐦 Twitter: ${NC}https://x.com/TestnetTerminal"
    echo -e "${BLUE}🆘 Support: ${NC}https://t.me/Amit3701"
    echo ""
    echo -e "${GREEN}✨ Happy Testing! See you next time! ✨${NC}"
    echo ""
    exit 0
}

# Set trap to catch Ctrl+C and other signals
trap 'graceful_exit' INT TERM

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_success() {
    echo -e "${CYAN}[SUCCESS]${NC} $1"
}

# Display main banner
show_banner() {
    clear
    echo ""
    echo -e "${BLUE}████████╗███████╗███████╗████████╗███╗   ██╗███████╗████████╗    ████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗ █████╗ ██╗     ${NC}"
    echo -e "${BLUE}╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝████╗  ██║██╔════╝╚══██╔══╝    ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗██║     ${NC}"
    echo -e "${BLUE}   ██║   █████╗  ███████╗   ██║   ██╔██╗ ██║█████╗     ██║          ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║███████║██║     ${NC}"
    echo -e "${BLUE}   ██║   ██╔══╝  ╚════██║   ██║   ██║╚██╗██║██╔══╝     ██║          ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══██║██║     ${NC}"
    echo -e "${BLUE}   ██║   ███████╗███████║   ██║   ██║ ╚████║███████╗   ██║          ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║  ██║███████╗${NC}"
    echo -e "${BLUE}   ╚═╝   ╚══════╝╚══════╝   ╚═╝   ╚═╝  ╚═══╝╚══════╝   ╚═╝          ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝${NC}"
    echo ""
    echo -e "${WHITE}╔══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${WHITE}║              🎉 Thank you for using our One-Click Setup! 🎉       ║${NC}"
    echo -e "${WHITE}╚══════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${CYAN}🔗 Our Links:${NC}"
    echo -e "${YELLOW}📱 Telegram: ${NC}https://t.me/TestnetTerminal"
    echo -e "${YELLOW}🐙 GitHub: ${NC}https://github.com/TestnetTerminal"
    echo -e "${YELLOW}🐦 Twitter/X: ${NC}https://x.com/TestnetTerminal"
    echo -e "${YELLOW}🆘 Support: ${NC}https://t.me/Amit3701"
    echo ""
}

# Display menu
show_menu() {
    echo -e "${WHITE}╔══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${WHITE}║            🚀 Gensyn AI RL-Swarm Node OneClick Setup by Amit     ║${NC}"
    echo -e "${WHITE}╚══════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${CYAN}Please select an option:${NC}"
    echo ""
    echo -e "${YELLOW}1. 🛠️  Install Gensyn AI Node${NC}"
    echo -e "${YELLOW}2. 🛜 Install Cloudflared and Tunnel${NC}"
    echo -e "${YELLOW}3. ⬇️  Download Swarm.pem File${NC}"
    echo -e "${YELLOW}4. 📤 Import Swarm.pem From Local Pc To VPS${NC}"
    echo -e "${PURPLE}5. 🔄 Upgrade Gensyn AI Node${NC}"
    echo -e "${RED}6. 🗑️  Delete Gensyn AI Node${NC}"
    echo -e "${RED}7. ❌ Exit${NC}"
    echo ""
    echo -n -e "${WHITE}Select an option (1-7): ${NC}"
}

# Install Gensyn AI Node
install_gensyn_node() {
    echo ""
    echo -e "${PURPLE}╔══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║                    🛠️ Installing Gensyn AI Node 🛠️               ║${NC}"
    echo -e "${PURPLE}╚══════════════════════════════════════════════════════════════════╝${NC}"
    echo ""

    print_status "📦 Updating system and installing dependencies..."
    sudo apt update && sudo apt install -y python3 python3-venv python3-pip curl wget screen git lsof

    # Install Node.js if not installed
    if ! command -v node &>/dev/null; then
        print_status "🔧 Installing Node.js..."
        curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
        sudo apt update && sudo apt install -y nodejs
    else
        print_status "✅ Node.js is already installed ($(node --version))"
    fi

    # Install Yarn if not installed
    if ! command -v yarn &>/dev/null; then
        print_status "🔧 Installing Yarn..."
        curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
        echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
        sudo apt update && sudo apt install -y yarn
    else
        print_status "✅ Yarn is already installed ($(yarn --version))"
    fi

    # Check if screen session already exists
    if screen -list | grep -q "gensyn"; then
        print_warning "Screen session 'gensyn' already exists. Stopping the node only (keeping session)..."
        screen -S gensyn -X stuff $'\003'  # Send Ctrl+C gently
        sleep 3
        print_success "✅ Node stopped (session preserved)"
    fi

    print_status "🖥️ Starting screen session 'gensyn'..."

    # Create the screen session with the setup commands
    screen -S gensyn -dm bash -c "
    set -e

    echo '📁 Setting up RL-SWARM...'

    # Remove existing directory if it exists but PRESERVE swarm.pem
    if [ -d 'rl-swarm' ]; then
        echo '🔐 Backing up swarm.pem if it exists...'
        if [ -f 'rl-swarm/swarm.pem' ]; then
            cp rl-swarm/swarm.pem ./swarm_backup.pem
            echo '✅ swarm.pem backed up'
        fi
        echo '🗑️  Removing existing rl-swarm directory...'
        rm -rf rl-swarm
    fi

    echo '📁 Cloning RL-SWARM repo...'
    git clone https://github.com/gensyn-ai/rl-swarm.git
    cd rl-swarm

    # Restore swarm.pem if backup exists
    if [ -f '../swarm_backup.pem' ]; then
        echo '🔐 Restoring swarm.pem from backup...'
        cp ../swarm_backup.pem ./swarm.pem
        rm ../swarm_backup.pem
        echo '✅ swarm.pem restored'
    fi

    echo '🐍 Setting up Python virtual environment...'
    python3 -m venv .venv
    source .venv/bin/activate

    echo '📦 Installing Python packages...'
    pip install --upgrade pip
    pip install --force-reinstall transformers==4.51.3 trl==0.19.1

    echo '📋 Installed packages:'
    pip freeze

    echo ''
    echo '🔑 Checking for swarm.pem file...'
    if [ -f 'swarm.pem' ]; then
        echo '✅ Found swarm.pem file, proceeding with authentication...'
    else
        echo '⚠️  No swarm.pem found in the current directory.'
        echo '📂 Please copy your swarm.pem file to: \$(pwd)'
        echo '📋 Full path: \$(pwd)/swarm.pem'
        echo ''
        echo '⏳ Waiting 50 seconds for you to copy the file...'
        echo '✅ Press 1 and Enter if you have copied the file to continue immediately'
        echo '⏭️  Or wait 50 seconds to continue automatically'
        echo ''
        
        # Countdown with user input option
        for i in \$(seq 50 -1 1); do
            printf \"\\r⏰ Waiting: %02d seconds (Press 1 to continue)\" \$i
            
            # Check for user input with timeout
            if read -t 1 -n 1 user_input 2>/dev/null; then
                if [ \"\$user_input\" = \"1\" ]; then
                    echo \"\"
                    echo \"⚡ Continuing early...\"
                    break
                fi
            fi
        done
        echo \"\"
        
        # Check again for swarm.pem after the wait
        if [ -f 'swarm.pem' ]; then
            echo '✅ Great! Found swarm.pem file, proceeding with authentication...'
        else
            echo '⚠️  Still no swarm.pem found. Continuing without authentication...'
            echo '🔄 You can add it later and restart the swarm.'
        fi
    fi

    echo ''
    echo '🚀 Starting the swarm node...'
    chmod +x run_rl_swarm.sh 2>/dev/null || true

    # Create a loop to handle restarts gracefully
    while true; do
        echo '▶️  Starting/Restarting swarm node...'
        if ./run_rl_swarm.sh; then
            echo '✅ Swarm completed successfully.'
        else
            echo '⏸️  Swarm stopped or interrupted.'
        fi
        
        echo ''
        echo '🔄 Node stopped. Choose action:'
        echo '1️⃣  Press 1 + Enter to restart the node'
        echo '2️⃣  Press 2 + Enter to exit to shell (files preserved)'
        echo '⏳ Auto-restart in 30 seconds...'
        echo ''
        
        # Countdown with user choice
        for i in \$(seq 30 -1 1); do
            printf \"\\r⏰ Auto-restart in: %02d seconds (1=restart now, 2=shell)\" \$i
            if read -t 1 -n 1 user_choice 2>/dev/null; then
                if [ \"\$user_choice\" = \"1\" ]; then
                    echo \"\"
                    echo \"🔄 Restarting node...\"
                    break
                elif [ \"\$user_choice\" = \"2\" ]; then
                    echo \"\"
                    echo \"🐚 Dropping to shell. All files preserved.\"
                    echo \"📋 To restart node: ./run_rl_swarm.sh\"
                    echo \"🚪 To exit screen: type 'exit'\"
                    break 2
                fi
            fi
        done
        echo \"\"
        
        if [ \"\$user_choice\" = \"2\" ]; then
            break
        fi
    done
    
    # Keep shell active if user chose option 2
    echo '🖥️  Shell ready. All files are preserved.'
    echo '📋 Commands available:'
    echo '   ./run_rl_swarm.sh  - Start the swarm node'
    echo '   ls -la             - List files'
    echo '   exit               - Exit screen session'
    bash
    "

    sleep 3

    echo ""
    print_success "✅ Gensyn AI Node setup completed!"
    echo -e "${YELLOW}🔍 To attach to the screen session: ${NC}screen -r gensyn"
    echo -e "${YELLOW}🔍 To detach from screen session: ${NC}Press Ctrl+A then D"
    echo -e "${YELLOW}🔍 To check screen sessions: ${NC}screen -list"
    echo ""
    echo -e "${GREEN}📝 Next Steps:${NC}"
    echo "1. If you have a swarm.pem file, copy it to the rl-swarm directory"
    echo "2. Attach to the screen session to monitor progress: screen -r gensyn"
    echo "3. The swarm node should start automatically"
    echo ""
    
    read -p "Press Enter to return to main menu..."
}

# Install Cloudflared and Tunnel - COMPLETELY FIXED
install_cloudflared() {
    echo ""
    echo -e "${BLUE}╔══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║                🛜 Installing Cloudflared & Tunnel 🛜             ║${NC}"
    echo -e "${BLUE}╚══════════════════════════════════════════════════════════════════╝${NC}"
    echo ""

    LOCAL_URL="http://localhost:3000"

    # Check port 3000 with lsof only (simple check)
    print_status "🔍 Checking if port 3000 is active..."
    PORT_3000_ACTIVE=false
    
    if command -v lsof &> /dev/null && lsof -i:3000 &> /dev/null; then
        PORT_3000_ACTIVE=true
        print_success "✅ Port 3000 is active and ready for tunneling!"
    else
        print_warning "⚠️ Port 3000 not detected, but you can still try tunneling"
        print_status "💡 Make sure Gensyn node is running first (option 1)"
    fi
    echo ""

    # Install UFW and configure firewall - EXACTLY like manual commands
    print_status "🛡️ Installing and configuring UFW firewall..."
    sudo apt install ufw -y
    sudo ufw allow 22
    sudo ufw allow 3000/tcp
    echo "y" | sudo ufw enable
    print_success "🛡️ UFW firewall configured!"

    # Install cloudflared - EXACTLY like manual commands
    if command -v cloudflared &> /dev/null; then
        print_success "✅ Cloudflared is already installed!"
        VERSION_INFO=$(cloudflared --version 2>&1 | head -n1)
        echo -e "${GREEN}   Version: ${NC}$VERSION_INFO"
    else
        print_status "📥 Downloading cloudflared..."
        wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
        
        print_status "📦 Installing cloudflared..."
        sudo dpkg -i cloudflared-linux-amd64.deb
        
        print_status "🔍 Verifying installation..."
        cloudflared --version
        
        print_success "✅ Cloudflared installed! .deb file saved permanently in current directory"
    fi

    echo ""
    
    # Start tunnel
    if [ "$PORT_3000_ACTIVE" = true ]; then
        echo -e "${GREEN}🚀 Port 3000 detected as active! Ready to tunnel...${NC}"
    else
        echo -e "${YELLOW}⚠️ Port 3000 not detected, but you can still try tunneling${NC}"
        print_status "💡 If port 3000 is actually running, tunnel will work"
    fi
    
    echo -e "${CYAN}💡 The tunnel will forward external traffic to localhost:3000${NC}"
    echo -e "${YELLOW}⚠️ This creates a public URL accessible from anywhere${NC}"
    echo ""
    echo -n -e "${WHITE}Start Cloudflare tunnel for localhost:3000? (Y/n): ${NC}"
    read -r confirm
    
    case "${confirm,,}" in
        n|no)
            print_warning "🚫 Tunnel cancelled by user."
            echo ""
            echo -e "${CYAN}💡 To start tunnel manually later:${NC}"
            echo -e "${GREEN}cloudflared tunnel --url ${LOCAL_URL}${NC}"
            ;;
        *|y|yes|"")
            echo ""
            print_success "🚀 Starting Cloudflare tunnel for localhost:3000..."
            echo -e "${YELLOW}⚠️ Press Ctrl+C to stop the tunnel${NC}"
            echo -e "${CYAN}📋 The tunnel URL will appear below - use it to access your service remotely${NC}"
            echo ""
            sleep 2
            cloudflared tunnel --url ${LOCAL_URL}
            ;;
    esac
    
    echo ""
    read -p "Press Enter to return to main menu..."
}

# Download Swarm.pem file
download_swarm_pem() {
    echo ""
    echo -e "${YELLOW}╔══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${YELLOW}║                    ⬇️ Download Swarm.pem File ⬇️                 ║${NC}"
    echo -e "${YELLOW}╚══════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    # Get the current username
    CURRENT_USER=$(whoami)
    
    # Define the rl-swarm directory path
    RL_SWARM_DIR="/home/$CURRENT_USER/rl-swarm"
    SWARM_PEM_PATH="$RL_SWARM_DIR/swarm.pem"
    
    print_status "🔍 Checking for swarm.pem file..."
    echo -e "${CYAN}📂 Looking in: ${NC}$RL_SWARM_DIR"
    echo ""
    
    # Check if rl-swarm directory exists
    if [ ! -d "$RL_SWARM_DIR" ]; then
        print_error "❌ rl-swarm directory not found at: $RL_SWARM_DIR"
        echo ""
        echo -e "${YELLOW}💡 Possible solutions:${NC}"
        echo "1. Run option 1 first to install Gensyn AI Node"
        echo "2. Make sure you're in the correct user account"
        echo "3. Check if rl-swarm is installed in a different location"
        echo ""
        read -p "Press Enter to return to main menu..."
        return
    fi
    
    # Check if swarm.pem exists
    if [ -f "$SWARM_PEM_PATH" ]; then
        print_success "✅ swarm.pem found at: $SWARM_PEM_PATH"
        
        # Show file info
        FILE_SIZE=$(du -h "$SWARM_PEM_PATH" | cut -f1)
        FILE_DATE=$(ls -la "$SWARM_PEM_PATH" | awk '{print $6, $7, $8}')
        
        echo ""
        echo -e "${CYAN}📄 File Information:${NC}"
        echo -e "${CYAN}   Size: ${NC}$FILE_SIZE"
        echo -e "${CYAN}   Modified: ${NC}$FILE_DATE"
        echo -e "${CYAN}   Location: ${NC}$SWARM_PEM_PATH"
        echo ""
        
        # Simple file display option
        echo -n -e "${WHITE}Show file content to copy? (y/N): ${NC}"
        read -r show_content
        if [[ "${show_content,,}" == "y" || "${show_content,,}" == "yes" ]]; then
            echo ""
            echo -e "${YELLOW}📄 swarm.pem content:${NC}"
            echo -e "${CYAN}════════════════════════════════════════${NC}"
            cat "$SWARM_PEM_PATH"
            echo -e "${CYAN}════════════════════════════════════════${NC}"
            echo -e "${GREEN}💡 Copy the above content and save as 'swarm.pem' on your local machine${NC}"
        fi
    else
        print_error "❌ swarm.pem not found at: $SWARM_PEM_PATH"
        echo ""
        echo -e "${YELLOW}💡 To get your swarm.pem file:${NC}"
        echo "1. Make sure you've run option 1 (Install Gensyn AI Node) first"
        echo "2. Copy your swarm.pem file to: $RL_SWARM_DIR/"
        echo "3. Download your swarm.pem from: https://app.gensyn.ai/"
        echo ""
        echo -e "${CYAN}📋 Current rl-swarm directory contents:${NC}"
        if [ -d "$RL_SWARM_DIR" ]; then
            ls -la "$RL_SWARM_DIR" | head -10
        fi
    fi
    
    echo ""
    read -p "Press Enter to return to main menu..."
}

# Upgrade Gensyn AI Node - FIXED to preserve files
upgrade_gensyn_node() {
    echo ""
    echo -e "${PURPLE}╔══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║                    🔄 Upgrading Gensyn AI Node 🔄                ║${NC}"
    echo -e "${PURPLE}╚══════════════════════════════════════════════════════════════════╝${NC}"
    echo ""

    # Get current user and check for rl-swarm directory
    CURRENT_USER=$(whoami)
    RL_SWARM_DIR="/home/$CURRENT_USER/rl-swarm"
    
    # Check if rl-swarm directory exists
    if [ ! -d "$RL_SWARM_DIR" ]; then
        print_error "❌ rl-swarm directory not found at: $RL_SWARM_DIR"
        echo ""
        print_status "💡 Please run option 1 first to install Gensyn AI Node"
        echo ""
        read -p "Press Enter to return to main menu..."
        return
    fi
    
    print_status "📁 Found rl-swarm directory: $RL_SWARM_DIR"
    echo ""
    
    print_status "🔄 Upgrade process will:"
    echo "1. Stop ONLY the running node process (preserve files & screen)"
    echo "2. Backup your swarm.pem file safely"
    echo "3. Pull the latest updates from GitHub"
    echo "4. Restore your swarm.pem file"
    echo "5. Restart the node with latest version"
    echo ""
    
    print_warning "⚠️ This will temporarily interrupt training/tasks but preserve all files"
    echo ""
    echo -n -e "${WHITE}Continue with upgrade? (Y/n): ${NC}"
    read -r confirm
    
    case "${confirm,,}" in
        n|no)
            print_warning "🚫 Upgrade cancelled by user."
            echo ""
            read -p "Press Enter to return to main menu..."
            return
            ;;
        *|y|yes|"")
            ;;
    esac
    
    echo ""
    print_status "🔄 Starting upgrade process..."
    
    # Step 1: Gently stop the running process only (DON'T kill screen)
    if screen -list | grep -q "gensyn"; then
        print_status "⏸️  Stopping Gensyn node process (preserving session and files)..."
        screen -S gensyn -X stuff $'\003'  # Send Ctrl+C gently
        sleep 5
        print_success "✅ Node process stopped (screen session and files preserved)"
    else
        print_status "ℹ️ No active screen session found"
    fi
    
    # Step 2: Navigate to directory and backup swarm.pem
    print_status "📁 Navigating to rl-swarm directory..."
    cd "$RL_SWARM_DIR" || {
        print_error "❌ Failed to access rl-swarm directory"
        return 1
    }
    
    # CRITICAL: Backup swarm.pem before any git operations
    if [ -f "swarm.pem" ]; then
        print_status "🔐 Backing up swarm.pem file..."
        cp swarm.pem ../swarm_backup.pem
        print_success "✅ swarm.pem backed up safely"
    else
        print_warning "⚠️ No swarm.pem found to backup"
    fi
    
    print_status "🔄 Updating repository..."
    echo ""
    
    # Check if we're in a git repository
    if [ ! -d ".git" ]; then
        print_error "❌ Not a git repository. Please reinstall using option 1."
        echo ""
        read -p "Press Enter to return to main menu..."
        return
    fi
    
    # Show current version/commit before upgrade
    print_status "📋 Current version:"
    git log --oneline -1 2>/dev/null || echo "Unable to get current version"
    echo ""
    
    # Perform the upgrade commands
    print_status "🔄 Switching to main branch..."
    if git switch main 2>/dev/null; then
        print_success "✅ Switched to main branch"
    else
        print_warning "⚠️ Switch to main failed, trying checkout..."
        git checkout main 2>/dev/null || {
            print_error "❌ Failed to switch to main branch"
            echo ""
            read -p "Press Enter to return to main menu..."
            return
        }
    fi
    
    print_status "🔄 Resetting repository state..."
    git reset --hard
    print_success "✅ Repository reset complete"
    
    print_status "🔄 Cleaning repository..."
    git clean -fd
    print_success "✅ Repository cleaned"
    
    print_status "📥 Pulling latest updates..."
    if git pull origin main; then
        print_success "✅ Updates pulled successfully"
    else
        print_error "❌ Failed to pull updates"
        echo ""
        print_status "💡 Check your internet connection and try again"
        read -p "Press Enter to return to main menu..."
        return
    fi
    
    echo ""
    
    # CRITICAL: Restore swarm.pem after git operations
    if [ -f "../swarm_backup.pem" ]; then
        print_status "🔐 Restoring swarm.pem file..."
        cp ../swarm_backup.pem ./swarm.pem
        rm ../swarm_backup.pem
        print_success "✅ swarm.pem restored successfully"
    else
        print_warning "⚠️ No backup swarm.pem to restore"
    fi
    
    # Show new version after upgrade
    print_status "📋 New version:"
    git log --oneline -1 2>/dev/null || echo "Unable to get new version"
    echo ""
    
    # Final check for swarm.pem
    if [ -f "swarm.pem" ]; then
        print_success "✅ swarm.pem file confirmed present"
    else
        print_warning "⚠️ swarm.pem file not found"
        print_status "💡 You may need to copy your swarm.pem file to this directory"
    fi
    
    echo ""
    print_status "🚀 Restarting upgraded Gensyn node in existing screen session..."
    
    # Send restart command to existing screen session (don't create new one)
    if screen -list | grep -q "gensyn"; then
        screen -S gensyn -X stuff "cd $RL_SWARM_DIR && source .venv/bin/activate && ./run_rl_swarm.sh$(printf \\r)"
        print_success "✅ Restart command sent to screen session"
    else
        # If screen doesn't exist, create new one
        screen -S gensyn -dm bash -c "
        cd '$RL_SWARM_DIR'
        source .venv/bin/activate
        echo '🔄 Starting upgraded Gensyn AI Node...'
        echo '📁 Working directory: \$(pwd)'
        echo '📋 Git version: \$(git log --oneline -1 2>/dev/null || echo \"Unknown\")'
        echo ''
        
        if [ -f 'swarm.pem' ]; then
            echo '✅ swarm.pem found, proceeding with authentication...'
        else
            echo '⚠️ swarm.pem not found, you may need to add it'
        fi
        
        echo '🚀 Starting the upgraded swarm node...'
        chmod +x run_rl_swarm.sh 2>/dev/null || true
        
        while true; do
            echo '▶️  Starting/Restarting swarm node...'
            if ./run_rl_swarm.sh; then
                echo '✅ Swarm completed successfully.'
            else
                echo '⏸️  Swarm stopped or interrupted.'
            fi
            
            echo ''
            echo '🔄 Node stopped. Choose action:'
            echo '1️⃣  Press 1 + Enter to restart the node'
            echo '2️⃣  Press 2 + Enter to exit to shell (files preserved)'
            echo '⏳ Auto-restart in 30 seconds...'
            echo ''
            
            for i in \$(seq 30 -1 1); do
                printf \"\\r⏰ Auto-restart in: %02d seconds (1=restart, 2=shell)\" \$i
                if read -t 1 -n 1 user_choice 2>/dev/null; then
                    if [ \"\$user_choice\" = \"1\" ]; then
                        echo \"\"
                        echo \"🔄 Restarting node...\"
                        break
                    elif [ \"\$user_choice\" = \"2\" ]; then
                        echo \"\"
                        echo \"🐚 Shell ready. All files preserved.\"
                        break 2
                    fi
                fi
            done
            echo \"\"
            
            if [ \"\$user_choice\" = \"2\" ]; then
                break
            fi
        done
        
        echo '🖥️  Shell ready. All files preserved.'
        echo '📋 Commands: ./run_rl_swarm.sh (restart), exit (quit)'
        bash
        "
        print_success "✅ New screen session created with upgraded node"
    fi
    
    sleep 3
    
    echo ""
    print_success "✅ Gensyn AI Node upgrade completed!"
    echo ""
    echo -e "${CYAN}📋 Upgrade Summary:${NC}"
    echo "• Repository updated to latest version"
    echo "• swarm.pem file preserved and restored"
    echo "• Node restarted with new code"
    echo "• Screen session 'gensyn' is active"
    echo ""
    echo -e "${YELLOW}🔍 Next steps:${NC}"
    echo -e "${GREEN}screen -r gensyn${NC}          # Attach to node session"
    echo -e "${GREEN}Ctrl+A then D${NC}            # Detach from screen"
    echo ""
    
    read -p "Press Enter to return to main menu..."
}

# Import Swarm.pem file via web interface
import_swarm_pem() {
    echo ""
    echo -e "${GREEN}╔══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║                    📤 Import Swarm.pem File 📤                   ║${NC}"
    echo -e "${GREEN}╚══════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    # Get the current username and directories
    CURRENT_USER=$(whoami)
    RL_SWARM_DIR="/home/$CURRENT_USER/rl-swarm"
    IMPORT_DIR="/home/$CURRENT_USER"
    
    print_status "🔍 Setting up import server..."
    echo -e "${CYAN}📂 Import will save to: ${NC}$RL_SWARM_DIR (if exists) or $IMPORT_DIR"
    echo ""
    
    # Check if rl-swarm directory exists
    if [ -d "$RL_SWARM_DIR" ]; then
        TARGET_DIR="$RL_SWARM_DIR"
        print_success "✅ rl-swarm directory found - files will be imported there"
    else
        TARGET_DIR="$IMPORT_DIR"
        print_warning "⚠️ rl-swarm directory not found - files will be imported to home directory"
    fi
    
    # Find an available port (try 8090, 8091, etc. - avoiding 3000)
    IMPORT_PORT=8090
    while lsof -i:$IMPORT_PORT &>/dev/null; do
        ((IMPORT_PORT++))
        if [ $IMPORT_PORT -gt 8100 ]; then
            print_error "❌ No available ports found between 8090-8100"
            return
        fi
    done
    
    print_status "🔍 Using port: $IMPORT_PORT"
    
    # Create a temporary directory for the import server
    TEMP_IMPORT_DIR=$(mktemp -d)
    cd "$TEMP_IMPORT_DIR"
    
    # Create the import web interface
    cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Import swarm.pem - Testnet Terminal</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body { 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
            text-align: center; 
            padding: 20px; 
            background: #080c14;
            color: #19c1ff; 
            min-height: 100vh;
            position: relative;
            overflow-x: hidden;
        }
        
        .bg-animation {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 0;
        }
        
        .particle {
            position: absolute;
            width: 2px;
            height: 2px;
            background: #19c1ff;
            border-radius: 50%;
            opacity: 0.6;
            animation: float 8s infinite ease-in-out;
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0px) translateX(0px); opacity: 0.6; }
            50% { transform: translateY(-20px) translateX(10px); opacity: 1; }
        }
        
        .watermark {
            position: fixed;
            bottom: 10px;
            right: 10px;
            font-size: 10px;
            color: rgba(25, 193, 255, 0.3);
            z-index: 1000;
            font-weight: bold;
        }
        
        .container { 
            max-width: 90%;
            width: 600px;
            margin: 0 auto; 
            background: rgba(25, 193, 255, 0.05);
            padding: 30px 20px;
            border-radius: 15px;
            border: 1px solid rgba(25, 193, 255, 0.2);
            box-shadow: 0 8px 32px rgba(25, 193, 255, 0.1);
            backdrop-filter: blur(10px);
            position: relative;
            z-index: 10;
        }
        
        .logo { 
            font-size: 4em; 
            margin-bottom: 20px;
            background: linear-gradient(45deg, #19c1ff, #0066cc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            filter: drop-shadow(0 0 10px rgba(25, 193, 255, 0.3));
        }
        
        h1 {
            color: #19c1ff;
            margin-bottom: 10px;
            font-size: 1.8em;
            font-weight: 600;
        }
        
        h3 {
            color: rgba(25, 193, 255, 0.8);
            margin-bottom: 30px;
            font-weight: 400;
        }
        
        .upload-area {
            border: 3px dashed rgba(25, 193, 255, 0.3);
            border-radius: 15px;
            padding: 40px 20px;
            margin: 30px 0;
            transition: all 0.3s ease;
            background: rgba(25, 193, 255, 0.02);
            cursor: pointer;
        }
        
        .upload-area:hover, .upload-area.dragover {
            border-color: #19c1ff;
            background: rgba(25, 193, 255, 0.08);
            transform: translateY(-2px);
        }
        
        .upload-icon {
            font-size: 3em;
            margin-bottom: 15px;
            opacity: 0.7;
        }
        
        .upload-text {
            font-size: 1.1em;
            margin-bottom: 10px;
        }
        
        .upload-subtext {
            color: rgba(25, 193, 255, 0.6);
            font-size: 0.9em;
        }
        
        #fileInput {
            display: none;
        }
        
        .upload-btn { 
            background: linear-gradient(45deg, #19c1ff, #0066cc);
            color: #080c14; 
            padding: 15px 30px; 
            border: none;
            border-radius: 25px; 
            font-size: 16px; 
            font-weight: 600;
            display: inline-block;
            margin: 20px 10px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 20px rgba(25, 193, 255, 0.3);
            cursor: pointer;
        }
        
        .upload-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 30px rgba(25, 193, 255, 0.5);
        }
        
        .status {
            padding: 15px;
            border-radius: 10px;
            margin: 20px 0;
            display: none;
        }
        
        .status.success {
            background: rgba(40, 167, 69, 0.1);
            border: 1px solid rgba(40, 167, 69, 0.3);
            color: #28a745;
            display: block;
        }
        
        .status.error {
            background: rgba(220, 53, 69, 0.1);
            border: 1px solid rgba(220, 53, 69, 0.3);
            color: #dc3545;
            display: block;
        }
        
        .status.info {
            background: rgba(25, 193, 255, 0.1);
            border: 1px solid rgba(25, 193, 255, 0.3);
            color: #19c1ff;
            display: block;
        }
        
        .info-box { 
            background: rgba(25, 193, 255, 0.08); 
            padding: 20px; 
            border-radius: 10px; 
            margin: 20px 0; 
            border-left: 3px solid #19c1ff;
            text-align: left;
        }
        
        .info-box h4 {
            color: #19c1ff;
            margin-bottom: 10px;
            font-size: 1.1em;
        }
        
        .info-box p {
            color: rgba(25, 193, 255, 0.9);
            line-height: 1.6;
            margin-bottom: 8px;
        }
        
        .social-links {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid rgba(25, 193, 255, 0.2);
        }
        
        .social-links a {
            color: #19c1ff;
            text-decoration: none;
            margin: 0 10px;
            padding: 8px 15px;
            border: 1px solid rgba(25, 193, 255, 0.3);
            border-radius: 20px;
            display: inline-block;
            margin: 5px;
            transition: all 0.3s ease;
            font-size: 0.9em;
        }
        
        .social-links a:hover {
            background: rgba(25, 193, 255, 0.1);
            border-color: #19c1ff;
            transform: translateY(-1px);
        }
        
        @media (max-width: 768px) {
            body { padding: 10px; }
            .container { 
                padding: 20px 15px; 
                width: 95%;
            }
            .logo { font-size: 3em; }
            .upload-area { padding: 30px 15px; }
        }
    </style>
</head>
<body>
    <div class="bg-animation"></div>
    
    <div class="watermark">
        Testnet Terminal © 2025
    </div>
    
    <div class="container">
        <div class="logo">📤</div>
        <h1>Import Your swarm.pem File</h1>
        <h3>Testnet Terminal - Gensyn AI Import</h3>
        
        <div class="upload-area" onclick="document.getElementById('fileInput').click()">
            <div class="upload-icon">📁</div>
            <div class="upload-text">Click here or drag & drop your swarm.pem file</div>
            <div class="upload-subtext">Only .pem files are accepted</div>
        </div>
        
        <input type="file" id="fileInput" accept=".pem" />
        
        <button class="upload-btn" onclick="document.getElementById('fileInput').click()">
            📂 Browse Files
        </button>
        
        <div id="status" class="status"></div>
        
        <div class="info-box">
            <h4>📋 Import Information</h4>
            <p><strong>Accepted files:</strong> .pem files only</p>
            <p><strong>Target location:</strong> Your server's rl-swarm directory</p>
            <p><strong>File will be renamed to:</strong> swarm.pem</p>
        </div>
        
        <div class="social-links">
            <a href="https://t.me/TestnetTerminal" target="_blank">📱 Telegram</a>
            <a href="https://github.com/TestnetTerminal" target="_blank">🐙 GitHub</a>
            <a href="https://x.com/TestnetTerminal" target="_blank">🐦 Twitter</a>
        </div>
    </div>
    
    <script>
        function createParticles() {
            const bgAnimation = document.querySelector('.bg-animation');
            for (let i = 0; i < 50; i++) {
                const particle = document.createElement('div');
                particle.className = 'particle';
                particle.style.left = Math.random() * 100 + '%';
                particle.style.top = Math.random() * 100 + '%';
                particle.style.animationDelay = Math.random() * 8 + 's';
                particle.style.animationDuration = (Math.random() * 4 + 6) + 's';
                bgAnimation.appendChild(particle);
            }
        }
        
        function showStatus(message, type) {
            const status = document.getElementById('status');
            status.className = 'status ' + type;
            status.innerHTML = message;
            status.style.display = 'block';
        }
        
function uploadFile(file) {
            if (!file.name.endsWith('.pem')) {
                showStatus('❌ Please select a .pem file only', 'error');
                return;
            }
            
            // Disable upload area after first attempt
            document.querySelector('.upload-area').style.pointerEvents = 'none';
            document.querySelector('.upload-area').style.opacity = '0.5';
            document.getElementById('fileInput').disabled = true;
            
            showStatus('⏳ Uploading file to VPS...', 'info');
            
            const formData = new FormData();
            formData.append('file', file);
            
            fetch('/upload', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    showStatus('✅ File uploaded successfully! Redirecting to thank you page...', 'success');
                    setTimeout(() => {
                        window.location.reload();
                    }, 2000);
                } else {
                    showStatus('❌ Upload failed: ' + data.error, 'error');
                    // Re-enable if upload failed
                    document.querySelector('.upload-area').style.pointerEvents = 'auto';
                    document.querySelector('.upload-area').style.opacity = '1';
                    document.getElementById('fileInput').disabled = false;
                }
            })
            .catch(error => {
                showStatus('❌ Upload failed: ' + error.message, 'error');
                // Re-enable if upload failed
                document.querySelector('.upload-area').style.pointerEvents = 'auto';
                document.querySelector('.upload-area').style.opacity = '1';
                document.getElementById('fileInput').disabled = false;
            });
        }
        
        // File input change handler
        document.getElementById('fileInput').addEventListener('change', function(e) {
            if (e.target.files.length > 0) {
                uploadFile(e.target.files[0]);
            }
        });
        
        // Drag and drop handlers
        const uploadArea = document.querySelector('.upload-area');
        
        uploadArea.addEventListener('dragover', function(e) {
            e.preventDefault();
            uploadArea.classList.add('dragover');
        });
        
        uploadArea.addEventListener('dragleave', function(e) {
            e.preventDefault();
            uploadArea.classList.remove('dragover');
        });
        
        uploadArea.addEventListener('drop', function(e) {
            e.preventDefault();
            uploadArea.classList.remove('dragover');
            
            if (e.dataTransfer.files.length > 0) {
                uploadFile(e.dataTransfer.files[0]);
            }
        });
        
        window.onload = function() {
            createParticles();
        };
    </script>
</body>
</html>
EOF

# Create the Python server script
    cat > server.py << EOF
#!/usr/bin/env python3
import os
import json
import shutil
import time
import threading
from http.server import HTTPServer, BaseHTTPRequestHandler
from urllib.parse import urlparse, parse_qs
import cgi
import tempfile

TARGET_DIR = "$TARGET_DIR"
UPLOADED = False
SERVER_INSTANCE = None

def shutdown_server():
    """Shutdown server after delay"""
    time.sleep(20)  # Wait 20 seconds
    if SERVER_INSTANCE:
        print("\\n🔄 Server shutting down automatically...")
        print("💾 Upload completed successfully!")
        # Create a flag file to signal upload completion
        with open("/tmp/upload_complete.flag", "w") as f:
            f.write("1")
        SERVER_INSTANCE.shutdown()

class UploadHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        global UPLOADED
        if self.path == '/':
            if UPLOADED:
                # Show thank you page
                self.send_response(200)
                self.send_header('Content-type', 'text/html')
                self.end_headers()
                self.wfile.write(self.get_thank_you_page().encode())
            else:
                self.send_response(200)
                self.send_header('Content-type', 'text/html')
                self.end_headers()
                with open('index.html', 'rb') as f:
                    self.wfile.write(f.read())
        else:
            self.send_response(404)
            self.end_headers()
    
    def do_POST(self):
        global UPLOADED
        if self.path == '/upload':
            if UPLOADED:
                self.send_json_response({'success': False, 'error': 'File already uploaded. Only one file allowed.'})
                return
                
            try:
                # Parse the form data
                form = cgi.FieldStorage(
                    fp=self.rfile,
                    headers=self.headers,
                    environ={'REQUEST_METHOD': 'POST'}
                )
                
                if 'file' not in form:
                    self.send_json_response({'success': False, 'error': 'No file provided'})
                    return
                
                fileitem = form['file']
                if not fileitem.filename:
                    self.send_json_response({'success': False, 'error': 'No file selected'})
                    return
                
                if not fileitem.filename.endswith('.pem'):
                    self.send_json_response({'success': False, 'error': 'Only .pem files are allowed'})
                    return
                
                # Save the file
                target_path = os.path.join(TARGET_DIR, 'swarm.pem')
                
                # Create target directory if it doesn't exist
                os.makedirs(TARGET_DIR, exist_ok=True)
                
                # Write the file
                with open(target_path, 'wb') as f:
                    f.write(fileitem.file.read())
                
                # Set proper permissions
                os.chmod(target_path, 0o600)
                
                UPLOADED = True
                
                # Print to VPS console
                print(f"\\n✅ SUCCESS: File uploaded to VPS at {target_path}")
                print(f"📁 File size: {os.path.getsize(target_path)} bytes")
                print(f"🔒 Permissions set to 600 (read/write owner only)")
                print("🔄 Server will close in 20 seconds...")
                
                # Start shutdown timer
                threading.Thread(target=shutdown_server, daemon=True).start()
                
                self.send_json_response({
                    'success': True, 
                    'path': target_path,
                    'message': 'File uploaded successfully! Server will close shortly.'
                })
                
            except Exception as e:
                print(f"\\n❌ UPLOAD FAILED: {str(e)}")
                self.send_json_response({'success': False, 'error': str(e)})
        else:
            self.send_response(404)
            self.end_headers()
    
    def get_thank_you_page(self):
        return '''<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Complete - Testnet Terminal</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
            text-align: center; padding: 20px; background: #080c14; color: #19c1ff; 
            min-height: 100vh; position: relative; overflow-x: hidden;
        }
        .bg-animation { position: fixed; top: 0; left: 0; width: 100%; height: 100%; pointer-events: none; z-index: 0; }
        .particle { position: absolute; width: 2px; height: 2px; background: #19c1ff; border-radius: 50%; opacity: 0.6; animation: float 8s infinite ease-in-out; }
        @keyframes float { 0%, 100% { transform: translateY(0px) translateX(0px); opacity: 0.6; } 50% { transform: translateY(-20px) translateX(10px); opacity: 1; } }
        .container { 
            max-width: 90%; width: 600px; margin: 0 auto; background: rgba(25, 193, 255, 0.05); padding: 40px 20px; 
            border-radius: 15px; border: 1px solid rgba(25, 193, 255, 0.2); box-shadow: 0 8px 32px rgba(25, 193, 255, 0.1); 
            backdrop-filter: blur(10px); position: relative; z-index: 10;
        }
        .logo { font-size: 5em; margin-bottom: 20px; background: linear-gradient(45deg, #28a745, #20c997); -webkit-background-clip: text; -webkit-text-fill-color: transparent; filter: drop-shadow(0 0 10px rgba(40, 167, 69, 0.3)); }
        h1 { color: #28a745; margin-bottom: 15px; font-size: 2.2em; font-weight: 600; }
        h3 { color: rgba(25, 193, 255, 0.8); margin-bottom: 30px; font-weight: 400; }
        .success-message { background: rgba(40, 167, 69, 0.1); border: 1px solid rgba(40, 167, 69, 0.3); color: #28a745; padding: 20px; border-radius: 10px; margin: 30px 0; font-size: 1.2em; }
        .countdown { font-size: 2em; color: #ffc107; font-weight: bold; text-shadow: 0 0 10px rgba(255, 193, 7, 0.5); margin: 20px 0; }
        .info-box { background: rgba(25, 193, 255, 0.08); padding: 20px; border-radius: 10px; margin: 20px 0; border-left: 3px solid #19c1ff; text-align: left; }
        .info-box h4 { color: #19c1ff; margin-bottom: 10px; font-size: 1.1em; }
        .info-box p { color: rgba(25, 193, 255, 0.9); line-height: 1.6; margin-bottom: 8px; }
        .social-links { margin-top: 30px; padding-top: 20px; border-top: 1px solid rgba(25, 193, 255, 0.2); }
        .social-links a { color: #19c1ff; text-decoration: none; margin: 0 10px; padding: 8px 15px; border: 1px solid rgba(25, 193, 255, 0.3); border-radius: 20px; display: inline-block; margin: 5px; transition: all 0.3s ease; font-size: 0.9em; }
        .social-links a:hover { background: rgba(25, 193, 255, 0.1); border-color: #19c1ff; transform: translateY(-1px); }
        @media (max-width: 768px) { body { padding: 10px; } .container { padding: 20px 15px; width: 95%; } .logo { font-size: 4em; } }
    </style>
    <script>
        function createParticles() {
            const bgAnimation = document.querySelector('.bg-animation');
            for (let i = 0; i < 50; i++) {
                const particle = document.createElement('div');
                particle.className = 'particle';
                particle.style.left = Math.random() * 100 + '%';
                particle.style.top = Math.random() * 100 + '%';
                particle.style.animationDelay = Math.random() * 8 + 's';
                particle.style.animationDuration = (Math.random() * 4 + 6) + 's';
                bgAnimation.appendChild(particle);
            }
        }
        
        let countdown = 20;
        function updateCountdown() {
            const countdownEl = document.getElementById('countdown');
            if (countdownEl) { countdownEl.textContent = countdown; }
            if (countdown > 0) { countdown--; setTimeout(updateCountdown, 1000); }
            else { document.getElementById('message').innerHTML = '<div style="color: #dc3545;">🔒 Service closed. Thank you!</div>'; }
        }
        
        window.onload = function() { createParticles(); updateCountdown(); };
    </script>
</head>
<body>
    <div class="bg-animation"></div>
    <div class="container">
        <div class="logo">✅</div>
        <h1>Upload Successful!</h1>
        <h3>Thank you for using Testnet Terminal</h3>
        
        <div class="success-message">
            🎉 Your swarm.pem file has been successfully uploaded to your VPS!
        </div>
        
        <div id="message">
            <div style="color: #ffc107; font-size: 1.3em;">Service closing in <span id="countdown" class="countdown">20</span> seconds</div>
        </div>
        
        <div class="info-box">
            <h4>✅ Upload Complete</h4>
            <p><strong>Status:</strong> File successfully transferred to your VPS</p>
            <p><strong>Location:</strong> Saved to rl-swarm directory (or home directory)</p>
            <p><strong>Security:</strong> File permissions set to 600 (secure)</p>
            <p><strong>Next:</strong> You can now use your Gensyn AI node with authentication</p>
        </div>
        
        <div class="social-links">
            <a href="https://t.me/TestnetTerminal" target="_blank">📱 Telegram</a>
            <a href="https://github.com/TestnetTerminal" target="_blank">🐙 GitHub</a>
            <a href="https://x.com/TestnetTerminal" target="_blank">🐦 Twitter</a>
            <a href="https://t.me/Amit3701" target="_blank">🆘 Support</a>
        </div>
    </div>
</body>
</html>'''
    
    def send_json_response(self, data):
        self.send_response(200)
        self.send_header('Content-type', 'application/json')
        self.send_header('Access-Control-Allow-Origin', '*')
        self.end_headers()
        self.wfile.write(json.dumps(data).encode())
    
    def log_message(self, format, *args):
        return  # Suppress default logging

if __name__ == '__main__':
    SERVER_INSTANCE = HTTPServer(('localhost', $IMPORT_PORT), UploadHandler)
    print(f"🚀 Import server running on port $IMPORT_PORT")
    print("⏰ Server will auto-close 20 seconds after file upload")
    print("📤 Waiting for swarm.pem file upload...")
    try:
        SERVER_INSTANCE.serve_forever()
    except:
        pass
    print("🔒 Import server stopped.")
EOF

    # Make the server script executable
    chmod +x server.py

    # Check if Python3 is available
    if command -v python3 &> /dev/null; then
        # Start the Python server in background
        python3 server.py &
        SERVER_PID=$!

        # Check if cloudflared is available
        if command -v cloudflared &> /dev/null; then
            print_success "🌐 Starting Cloudflare tunnel for swarm.pem import..."
            echo -e "${CYAN}📋 The tunnel will provide a secure upload interface${NC}"
            echo -e "${GREEN}💡 Open the tunnel URL in your browser to import swarm.pem${NC}"
            echo -e "${YELLOW}⚠️ Tunnel will auto-close after file upload or 3 minutes${NC}"
            echo ""
            
            # Start cloudflared tunnel in background and get its PID
            cloudflared tunnel --url http://localhost:$IMPORT_PORT &
            TUNNEL_PID=$!
            
            # Create a monitoring script to check for upload completion or timeout
            (
                TIMEOUT=180  # 3 minutes
                ELAPSED=0
                
                while [ $ELAPSED -lt $TIMEOUT ]; do
                    sleep 5
                    ELAPSED=$((ELAPSED + 5))
                    
                    # Check if file was uploaded
                    if [ -f "$TARGET_DIR/swarm.pem" ]; then
                        echo ""
                        print_success "✅ File uploaded! Closing tunnel in 20 seconds..."
                        sleep 20
                        break
                    fi
                    
                    # Check if processes are still running
                    if ! kill -0 $TUNNEL_PID 2>/dev/null || ! kill -0 $SERVER_PID 2>/dev/null; then
                        break
                    fi
                done
                
                # Kill both processes
                echo ""
                print_status "🔄 Shutting down tunnel and server..."
                kill $TUNNEL_PID 2>/dev/null || true
                kill $SERVER_PID 2>/dev/null || true
                pkill -f "cloudflared tunnel" 2>/dev/null || true
                
                # Wait a moment then check final status
                sleep 3
                echo ""
                print_status "🔍 Final upload status check..."
                if [ -f "$TARGET_DIR/swarm.pem" ]; then
                    print_success "✅ SUCCESS: swarm.pem was uploaded to VPS!"
                    FILE_SIZE=$(du -h "$TARGET_DIR/swarm.pem" | cut -f1)
                    echo -e "${CYAN}   📁 Location: ${NC}$TARGET_DIR/swarm.pem"
                    echo -e "${CYAN}   📏 Size: ${NC}$FILE_SIZE"
                    echo -e "${CYAN}   🔒 Permissions: ${NC}$(ls -l "$TARGET_DIR/swarm.pem" | cut -d' ' -f1)"
                    echo ""
                    print_success "🎉 Thank you for using Testnet Terminal!"
                    echo -e "${GREEN}✨ Your swarm.pem is ready to use with Gensyn AI Node ✨${NC}"
                else
                    print_error "❌ No file was uploaded to VPS"
                    echo -e "${YELLOW}💡 You can try the import process again${NC}"
                fi
                
                echo ""
                echo -e "${CYAN}🔗 Stay Connected:${NC}"
                echo -e "${BLUE}📱 Telegram: ${NC}https://t.me/TestnetTerminal"
                echo -e "${BLUE}🐙 GitHub: ${NC}https://github.com/TestnetTerminal" 
                echo -e "${BLUE}🐦 Twitter: ${NC}https://x.com/TestnetTerminal"
                echo -e "${BLUE}🆘 Support: ${NC}https://t.me/Amit3701"
                echo ""
                
            ) &
            MONITOR_PID=$!
            
            # Wait for tunnel to finish (either by upload completion or manual Ctrl+C)
            wait $TUNNEL_PID 2>/dev/null || true
            
            # Clean up monitoring process
            kill $MONITOR_PID 2>/dev/null || true
            kill $SERVER_PID 2>/dev/null || true
            
        else
            print_warning "⚠️ Cloudflared not found. Server running locally on port $IMPORT_PORT"
            echo "Install cloudflared first using option 2 for external access."
            echo -e "${CYAN}📋 Local access: ${NC}http://localhost:$IMPORT_PORT"
            echo ""
            echo "Press Ctrl+C to stop the server..."
            wait $SERVER_PID
        fi
    else
        print_error "❌ Python3 not found. Cannot start import server."
    fi
    
    # Clean up temporary directory
    cd "$RL_SWARM_DIR" 2>/dev/null || cd "$IMPORT_DIR"
    rm -rf "$TEMP_IMPORT_DIR"
    
    echo ""
    print_status "🔍 Checking if swarm.pem was imported..."
    if [ -f "$TARGET_DIR/swarm.pem" ]; then
        print_success "✅ swarm.pem found at: $TARGET_DIR/swarm.pem"
        
        # Show file info
        FILE_SIZE=$(du -h "$TARGET_DIR/swarm.pem" | cut -f1)
        FILE_DATE=$(ls -la "$TARGET_DIR/swarm.pem" | awk '{print $6, $7, $8}')
        
        echo ""
        echo -e "${CYAN}📄 Imported File Information:${NC}"
        echo -e "${CYAN}   Size: ${NC}$FILE_SIZE"
        echo -e "${CYAN}   Modified: ${NC}$FILE_DATE"
        echo -e "${CYAN}   Location: ${NC}$TARGET_DIR/swarm.pem"
        echo -e "${CYAN}   Permissions: ${NC}$(ls -l "$TARGET_DIR/swarm.pem" | cut -d' ' -f1)"
    else
        print_warning "⚠️ No swarm.pem file was imported"
    fi
    
    echo ""
    read -p "Press Enter to return to main menu..."
}

# Delete Gensyn Node completely
delete_gensyn_node() {
    echo ""
    echo -e "${RED}╔══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${RED}║                    🗑️ Delete Gensyn AI Node 🗑️                   ║${NC}"
    echo -e "${RED}╚══════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    # Get current user
    CURRENT_USER=$(whoami)
    RL_SWARM_DIR="/home/$CURRENT_USER/rl-swarm"
    
    print_warning "⚠️ This will completely remove Gensyn AI Node from your system!"
    echo ""
    echo -e "${YELLOW}📋 What will be deleted:${NC}"
    echo "• rl-swarm directory and all contents"
    echo "• Screen session 'gensyn' (if running)"
    echo "• Python virtual environment"
    echo "• All downloaded files and configurations"
    echo "• ⚠️  YOUR SWARM.PEM FILE WILL BE DELETED!"
    echo ""
    
    # First confirmation
    echo -n -e "${WHITE}❓ Are you sure you want to delete Gensyn AI Node? (y/N): ${NC}"
    read -r first_confirm
    
    case "${first_confirm,,}" in
        y|yes)
            ;;
        *)
            print_status "✅ Deletion cancelled. Your Gensyn AI Node is safe!"
            echo ""
            read -p "Press Enter to return to main menu..."
            return
            ;;
    esac
    
    echo ""
    print_warning "🚨 FINAL WARNING - BACKUP YOUR swarm.pem FILE!"
    echo ""
    echo -e "${RED}⚠️ Your swarm.pem file will be PERMANENTLY DELETED!${NC}"
    echo -e "${YELLOW}📄 Have you backed up your swarm.pem file to a safe location?${NC}"
    echo ""
    
    # Show swarm.pem location if it exists
    if [ -f "$RL_SWARM_DIR/swarm.pem" ]; then
        echo -e "${CYAN}📁 Your swarm.pem is located at: ${NC}$RL_SWARM_DIR/swarm.pem"
        echo -e "${GREEN}💡 You can use Option 3 to view/copy it before deletion${NC}"
        echo ""
    fi
    
    # Second confirmation
    echo -n -e "${WHITE}❓ Type 'DELETE' to confirm permanent deletion: ${NC}"
    read -r final_confirm
    
    if [ "$final_confirm" != "DELETE" ]; then
        print_status "✅ Deletion cancelled. Incorrect confirmation."
        echo ""
        read -p "Press Enter to return to main menu..."
        return
    fi
    
    echo ""
    print_status "🗑️ Starting deletion process..."
    
    # Stop screen session if running
    if screen -list | grep -q "gensyn"; then
        print_status "🔄 Stopping Gensyn screen session..."
        screen -S gensyn -X quit 2>/dev/null || true
        print_success "✅ Screen session terminated"
    fi
    
    # Delete rl-swarm directory
    if [ -d "$RL_SWARM_DIR" ]; then
        print_status "📁 Removing rl-swarm directory..."
        rm -rf "$RL_SWARM_DIR"
        print_success "✅ rl-swarm directory deleted"
    else
        print_warning "⚠️ rl-swarm directory not found (already deleted?)"
    fi
    
    # Clean up any remaining processes
    print_status "🔍 Cleaning up any remaining processes..."
    pkill -f "run_rl_swarm" 2>/dev/null || true
    pkill -f "rl-swarm" 2>/dev/null || true
    
    sleep 2
    
    echo ""
    print_success "✅ Gensyn AI Node completely removed!"
    echo ""
    echo -e "${CYAN}📋 Cleanup Summary:${NC}"
    echo "• rl-swarm directory deleted"
    echo "• Screen session terminated"
    echo "• All processes stopped"
    echo "• All files removed (including swarm.pem)"
    echo ""
    echo -e "${GREEN}💡 You can reinstall anytime using option 1${NC}"
    echo ""
    
    read -p "Press Enter to return to main menu..."
}

# Exit function
exit_script() {
    echo ""
    echo -e "${GREEN}╔══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║                        👋 Thank You! 👋                          ║${NC}"
    echo -e "${GREEN}╚══════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${CYAN}🙏 Thank you for using Testnet Terminal's OneClick Setup!${NC}"
    echo ""
    echo -e "${YELLOW}🔗 Stay Connected:${NC}"
    echo -e "${BLUE}📱 Telegram: ${NC}https://t.me/TestnetTerminal"
    echo -e "${BLUE}🐙 GitHub: ${NC}https://github.com/TestnetTerminal" 
    echo -e "${BLUE}🐦 Twitter: ${NC}https://x.com/TestnetTerminal"
    echo -e "${BLUE}🆘 Support: ${NC}https://t.me/Amit3701"
    echo ""
    echo -e "${GREEN}✨ Happy Testing! See you next time! ✨${NC}"
    echo ""
    exit 0
}

# Main menu loop
main() {
    while true; do
        show_banner
        show_menu
        
        read -r choice
        
        case $choice in
            1)
                install_gensyn_node
                ;;
            2)
                install_cloudflared
                ;;
            3)
                download_swarm_pem
                ;;
            4)
                import_swarm_pem
                ;;   
            5)
                upgrade_gensyn_node
                ;;
            6)
                delete_gensyn_node
                ;;
            7)
                exit_script
                ;;
            *)
                echo ""
                print_error "❌ Invalid option. Please select 1-7."
                echo ""
                read -p "Press Enter to continue..."
                ;;
        esac
    done
}

# Initialize and run
main "$@"
