#!/bin/bash
# launch tmux sessions for work
# reference: https://tmuxai.dev/tmux-startup-script/
tmux new-session -d -s c0d3z
tmux send-keys -t c0d3z "cd ~/src" C-m

tmux new-session -d -s n0t3z 
tmux send-keys -t n0t3z "cd ~/notes" C-m

GREEN='\033[0;32m'
NC='\033[0m' # No Color
echo -e "tmux sessions created. Attach to a session with ${GREEN}\`tmux attach-session -t c0d3z\`${NC} or just ${GREEN}\`tmux a\`${NC} to connect to any session!"
