#!/usr/bin/env bash
# Non-root Kariz agent. Usage: ./run.sh kz1_...   (first time)  |  ./run.sh   (later)
cd "$(dirname "$0")"
[ -n "$1" ] && printf '%s' "$1" > join_code.txt
export PATH="$HOME/node/bin:$PATH"
command -v node >/dev/null || { echo "node not found: install Node 18+ (see instructions)"; exit 1; }
chmod +x kariz/bin/* 2>/dev/null
nohup node index.js >> kariz.log 2>&1 &
echo "started (pid $!). Logs: tail -f $(pwd)/kariz.log"
