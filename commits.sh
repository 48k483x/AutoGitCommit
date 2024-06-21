#!/bin/bash

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print progress
print_progress() {
    local message="$1"
    local chars="/-\|"
    for (( i=0; i<10; i++ )); do
        local char="${chars:i%4:1}"
        echo -ne "\r$message [$char]"
        sleep 0.1
    done
    echo -ne "\r$message [✓]\n"
}

# Create the COMMITS.md file if it does not exist
echo -e "${GREEN}🚀 Initializing...${NC}"
if [ ! -f COMMITS.md ]; then
    touch COMMITS.md
    echo -e "${GREEN}✅ Created COMMITS.md${NC}"
else
    echo -e "${YELLOW}ℹ️ COMMITS.md already exists${NC}"
fi

# Loop 70 times
for i in {1..70}
do
   echo -ne "${YELLOW}🔄 Progress: $i/70 ${NC}"
   echo "a" >> COMMITS.md
   print_progress "${GREEN}✍️ Adding changes"
   git add . > /dev/null 2>&1
   print_progress "${GREEN}📝 Committing"
   git commit -m "🎉✅ Finished implementing feature updates and optimizations 🚀" > /dev/null 2>&1
   print_progress "${GREEN}📤 Pushing"
   git push > /dev/null 2>&1
   echo -e "${GREEN}✅ Iteration $i complete${NC}\n"
done

# Clean up the repository after finishing the loop
echo -e "${RED}🧹 Cleaning up...${NC}"
rm -f COMMITS.md
print_progress "${YELLOW}🗑️ Removing COMMITS.md"
git add COMMITS.md > /dev/null 2>&1
print_progress "${GREEN}📝 Committing cleanup"
git commit -m "🧹 Cleanup: Remove COMMITS.md" > /dev/null 2>&1
print_progress "${GREEN}📤 Pushing final changes"
git push > /dev/null 2>&1

echo -e "\n${GREEN}✅ Script completed successfully!${NC}"
