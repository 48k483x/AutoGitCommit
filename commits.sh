#!/bin/bash

# Function to print progressing dots
print_progress() {
  echo -ne "$1\r"
  sleep 0.3
  echo -ne "$1.\r"
  sleep 0.3
  echo -ne "$1..\r"
  sleep 0.3
  echo -ne "$1...\r"
  echo -ne '\n'
}

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Start of the script
echo -e "${GREEN}🚀 Creating file if not created.....${NC}"
[ ! -f COMMITS.md ] && touch COMMITS.md &> /dev/null

for i in {1..100}; do
   print_progress "${YELLOW}✍️ Adding${NC}"
   echo "a" >> COMMITS.md &> /dev/null
   git add COMMITS.md &> /dev/null
   
   print_progress "${GREEN}✅ Committing${NC}"
   git commit -m "🎉✅ Finished implementing feature updates and optimizations 🚀" &> /dev/null
   
   print_progress "${RED}📤 Pushing${NC}"
   git push &> /dev/null # Optional: specify your branch here
done

echo -e "${RED}🧹 Cleaning up.....${NC}"
rm -rf COMMITS.md &> /dev/null
git add COMMITS.md &> /dev/null
git commit -m "🎉✅ Finished implementing feature updates and optimizations 🚀" &> /dev/null
git push &> /dev/null # Optional: specify your branch here
