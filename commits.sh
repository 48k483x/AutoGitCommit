#!/bin/bash

# Function to print progress spinner
print_progress() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get user input for number of commits
read -p "Enter the number of commits you want to make: " num_commits

# Validate input
if ! [[ "$num_commits" =~ ^[0-9]+$ ]] ; then
   echo -e "${RED}Error: Not a valid number${NC}"
   exit 1
fi

# Start of the script
echo -e "${GREEN}🚀 Starting commit and push process...${NC}"

# Ensure we're in a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo -e "${RED}Error: Not in a git repository. Please run this script from a git repository.${NC}"
    exit 1
fi

# Check if remote exists and we have push access
if ! git push --dry-run > /dev/null 2>&1; then
    echo -e "${RED}Error: Cannot push to remote. Please check your remote configuration and permissions.${NC}"
    exit 1
fi

# Create or clear the COMMITS.md file
echo "" > COMMITS.md

for i in $(seq 1 $num_commits); do
    echo -e "${YELLOW}✍️ Commit $i of $num_commits${NC}"
    
    # Add a new line to COMMITS.md
    echo "Commit $i" >> COMMITS.md
    
    # Stage the changes
    git add .
    
    # Commit
    git commit -m "🎉✅ Commit $i: Implementing feature updates and optimizations 🚀" > /dev/null 2>&1 &
    print_progress $!
    
    # Push (we're not running this in the background to ensure it completes)
    echo -e "${RED}📤 Pushing commit $i${NC}"
    if ! git push; then
        echo -e "${RED}Error: Failed to push commit $i. Stopping script.${NC}"
        exit 1
    fi
    
    echo -e "${GREEN}✅ Successfully pushed commit $i${NC}"
    
    # Optional: Add a small delay to avoid overwhelming the server
    sleep 1
done

echo -e "${GREEN}✅ All $num_commits commits have been made and pushed successfully!${NC}"
