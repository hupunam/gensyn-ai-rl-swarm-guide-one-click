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
    echo -e "${PURPLE}4. 🔄 Upgrade Gensyn AI Node${NC}"
    echo -e "${PURPLE}5. 🗑️  Delete Gensyn AI Node${NC}"
    echo -e "${RED}6. ❌ Exit${NC}"
    echo ""
    echo -n -e "${WHITE}Select an option (1-6): ${NC}"
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
                upgrade_gensyn_node
                ;;
            5)
                delete_gensyn_node
                ;;
            6)
                exit_script
                ;;
            *)
                echo ""
                print_error "❌ Invalid option. Please select 1-6."
                echo ""
                read -p "Press Enter to continue..."
                ;;
        esac
    done
}

# Initialize and run
main "$@"
