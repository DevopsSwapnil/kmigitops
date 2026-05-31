#!/bin/bash

# Color configurations
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

REPO_URL="https://github.com/DevopsSwapnil/kmigitops.git"
REPO_DIR="kmigitops"
USERNAME="DevopsSwapnil"

# FORCE GIT TO USE CAT TO PREVENT TERMINAL STICKING / HANGING
export GIT_PAGER=cat

COMMANDS=(
    "1. Check Git Version|git --version"
    "2. View Global Config|git config --list --global"
    "3. Set Global Username|git config --global user.name '$USERNAME'"
    "4. Set Global Email|git config --global user.email 'swapnil@devops.com'"
    "5. Enable Terminal Colors|git config --global color.ui true"
    "6. Force Line Normalization|git config --global core.autocrlf input"
    "7. Mark Safe Directory|git config --global --add safe.directory '*'"
    "8. Check Credential Helper|git config --global credential.helper"
    "9. List Config Aliases|git config --global --get-regexp alias"
    "10. Check Default Init Branch|git config --global init.defaultBranch"

    "11. Clone Repository|git clone $REPO_URL"
    "12. Change Directory|cd $REPO_DIR"
    "13. View Local Config|git config --list --local"
    "14. Check Status|git status"
    "15. Check Status Short|git status -s"

    "16. Create provider.tf|echo 'provider \"aws\" { region = \"us-east-1\" }' > provider.tf"
    "17. Create terraform.tfvars|echo 'environment = \"production\"' > terraform.tfvars"
    "18. Create deployment.yaml|echo 'apiVersion: apps/v1' > deployment.yaml"
    "19. Check Status Untracked|git status"
    "20. Add Single File|git add provider.tf"
    "21. Check Status Staged|git status"
    "22. Unstage Single File|git reset HEAD provider.tf"
    "23. Add All TF Files|git add *.tf"
    "24. Check Status After Add|git status"
    "25. Reset Staged Changes|git reset"
    "26. Add All Files|git add ."
    "27. View Staged Diff|git diff --staged"
    "28. Commit Staged Files|git commit -m 'feat(iac): introduce initial core terraform modules'"
    "29. Modify deployment.yaml|echo 'cluster_version = \"1.30\"' >> deployment.yaml"
    "30. View Unstaged Diff|git diff"

    "31. Commit All Modifications|git commit -a -m 'fix(k8s): update control plane target spec'"
    "32. View Full Git Log|git log -n 5"
    "33. View Oneline Git Log|git log --oneline"
    "34. View Truncated Log|git log -n 2"
    "35. Show Latest Commit Details|git show HEAD"
    "36. Rename File with Git|git mv terraform.tfvars global.tfvars"
    "37. Check Status After Rename|git status"
    "38. Commit Rename Action|git commit -m 'chore(iac): migrate variables to global scope'"
    "39. Remove File with Git|git rm provider.tf"
    "40. Commit Removal Action|git commit -m 'chore(iac): decommission deprecated files'"

    "41. List Local Branches|git branch"
    "42. List Remote Branches|git branch -r"
    "43. List All Branches|git branch -a"
    "44. Create Hotfix Branch|git branch patch-hotfix-prod"
    "45. Switch to Hotfix Branch|git checkout patch-hotfix-prod"
    "46. Show Current Branch Name|git branch --show-current"
    "47. Create and Switch to Branch|git checkout -b env-staging"
    "48. Switch Back to Main|git checkout main || git checkout master"
    "49. List Merged Branches|git branch --merged"
    "50. List Unmerged Branches|git branch --no-merged"
    "51. Delete Hotfix Branch|git branch -d patch-hotfix-prod"
    "52. Rename Current Branch|git branch -m env-staging cluster-migration"
    "53. Restore Branch Name|git branch -m cluster-migration env-staging"
    "54. View Verbose Branch List|git branch -v"
    "55. View Branch Tracking Info|git branch -vv"

    "56. Switch to Staging Branch|git checkout env-staging"
    "57. Commit on Staging Branch|echo 'replicas: 5' >> deployment.yaml && git add deployment.yaml && git commit -m 'fix(k8s): upscale replica targets'"
    "58. Return to Main Line|git checkout main || git checkout master"
    "59. Merge Staging to Main|git merge env-staging"
    "60. View Oneline Graph Log|git log --graph --oneline -n 3"
    "61. Create Telemetry Branch|git checkout -b telemetry-tests"
    "62. Commit on Telemetry Branch|echo 'metrics: true' >> deployment.yaml && git add deployment.yaml && git commit -m 'feat(ops): embed monitoring'"
    "63. Return to Main Line Again|git checkout main || git checkout master"
    "64. Rebase Main on Telemetry|git rebase telemetry-tests"
    "65. Delete Telemetry Branch|git branch -d telemetry-tests"

    "66. Create Dirty Workspace State|echo 'malformed_syntax = {' >> global.tfvars"
    "67. Stash Working Changes|git stash"
    "68. Check Status After Stash|git status"
    "69. List Stash Entries|git stash list"
    "70. Show Specific Stash Data|git show stash@{0} --oneline"
    "71. Apply Stash Entry|git stash apply"
    "72. Hard Reset Local Changes|git reset --hard HEAD"
    "73. Pop Stash Entry|git stash pop"
    "74. Create a Named Stash|git stash save 'wip-emergency-rollback-state'"
    "75. Clear All Stashes|git stash clear"

    "76. View Detailed Patch Log|git log -p -n 1"
    "77. View Commit Summary Stats|git log --stat -n 2"
    "78. Filter Logs by Author|git log --author='$USERNAME' --oneline -n 3"
    "79. Filter Logs by Message Criteria|git log --grep='feat' --oneline"
    "80. Search Inside File History Logs|git log -S 'replicas'"
    "81. Summarize History Shortlog|git shortlog -s -n"
    "82. View Transactional Reflog|git reflog -n 5"
    "83. Show Object Type of HEAD|git cat-file -t HEAD"
    "84. Show Raw Metadata Content|git cat-file -p HEAD | head -n 5"
    "85. View Blame Data for File|git blame deployment.yaml"

    "86. List Assigned Remotes|git remote"
    "87. List Remotes with Protocol URLs|git remote -v"
    "88. Show Detailed Remote Mapping|git remote show origin"
    "89. Fetch Upstream Metadata|git fetch origin"
    "90. Fetch and Prune Obsolete Refs|git fetch --prune origin"
    "91. Execute Pull Sync Sequence|git pull"
    "92. Push Validation Dry Run|git push --dry-run origin HEAD"
    "93. Add Secondary Remote Target|git remote add upstream https://github.com/DevopsSwapnil/upstream.git"
    "94. Review Updated Remotes Mapping|git remote -v"
    "95. Remove Secondary Remote Target|git remote remove upstream"

    "96. Revert Last Commit Impact|git revert HEAD --no-edit"
    "97. Dry Run Workspace Clean|git clean -nd"
    "98. Enforce Clean Expurgation|git clean -fd"
    "99. Soft Reset Last Commit State|git reset --soft HEAD~1"
    "100. Check Final Repo Clean Status|git status"
)

for cmd_info in "${COMMANDS[@]}"; do
    clear
    
    LABEL=$(echo "$cmd_info" | cut -d'|' -f1)
    CMD=$(echo "$cmd_info" | cut -d'|' -f2)
    
    echo -e "${CYAN}[DEVOPS PIPELINE TASK] ${LABEL}${NC}"
    echo -e "${GREEN}Running command: ${CMD}${NC}\n"
    
    sleep 1
    
    if [[ "$CMD" == cd* ]]; then
        eval "$CMD"
    else
        eval "$CMD"
    fi
    
    echo -e "\n${YELLOW}--- Output Block Displayed Above ---${NC}"
    
    sleep 1
done

clear
echo -e "${YELLOW}All 100 DevOps-centric infrastructure operations executed successfully.${NC}"
echo -e "${GREEN}Initializing complete environment expurgation routine...${NC}"

cd ..
if [ -d "$REPO_DIR" ]; then
    rm -rf "$REPO_DIR"
    echo -e "${GREEN}STATUS CLEANUP: The transient GitOps folder '$REPO_DIR' has been wiped out.${NC}"
fi
