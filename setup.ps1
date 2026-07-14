$ErrorActionPreference = 'Stop'

cd "C:\Users\Windows\Documents\antigravity\amazing-galileo"

if (Test-Path -Path ".git") {
    Remove-Item -Recurse -Force .git
}

git init
git config user.name "Abhimanyu Tiwari"
git config user.email "abhimanyu.tiwari@joshtechnologygroup.com"

# 1. Setup main branch
Set-Content -Path README.md -Value @'
# Interactive Git Learning Assignment

Welcome to the Git Interactive Learning Assignment! This repository is designed to help you practice and master advanced Git commands.

## Instructions
Each branch in this repository contains a specific Git exercise.
To complete the assignment, checkout each branch and read the `Assignment.md` file located at the root of the branch. It will tell you exactly what is expected.

Branches to complete:
- `feature/amend-me`
- `feature/squash-me`
- `feature/rebase-me`
- `feature/merge-conflict`
'@

Set-Content -Path process_data.sh -Value @'
#!/bin/bash

function load_data() {
    echo "Loading data from database..."
    sleep 1
    echo "Data loaded."
}

function process_records() {
    echo "Processing records..."
    for i in {1..5}; do
        echo "Record $i processed."
    done
}

function save_results() {
    echo "Saving results..."
    echo "Done."
}

function main() {
    echo "--- Data Processor v1.0 ---"
    load_data
    process_records
    save_results
    echo "--- Finished ---"
}

main
'@

Set-Content -Path config.sh -Value @'
#!/bin/bash
export APP_ENV="development"
export DEBUG=true
export DB_HOST="localhost"
'@

Set-Content -Path utils.sh -Value @'
#!/bin/bash

function log_message() {
    echo "[INFO] $1"
}

function calculate_sum() {
    local a=$1
    local b=$2
    echo $((a + b))
}
'@

git add .
git commit -m "Initial commit: Add base scripts and README"
git branch -M main

# ---------------------------------------------------------
# 2. Setup feature/amend-me
# ---------------------------------------------------------
git checkout -b feature/amend-me

Set-Content -Path Assignment.md -Value @'
# Assignment: Amend Commit

## Goal
Learn how to use `git commit --amend` to modify the previous commit.

## Instructions
1. Look at the last commit on this branch. It accidentally included a secret API key in `config.sh` and contains a typo in the commit message ("Add new fature and API kye").
2. Your task is to remove the `API_KEY` line from `config.sh`.
3. You also need to create a new file called `helper.sh` containing a simple bash function, which was forgotten in the last commit.
4. Stage your changes and use `git commit --amend` to update the previous commit. 
5. During the amend, fix the commit message to simply be: "Add new feature and config".
'@

Set-Content -Path config.sh -Value @'
#!/bin/bash
export APP_ENV="development"
export DEBUG=true
export DB_HOST="localhost"
export API_KEY="sk_live_1234567890abcdef"
'@

git add Assignment.md config.sh
git commit -m "Add new fature and API kye"
git checkout main

# ---------------------------------------------------------
# 3. Setup feature/squash-me
# ---------------------------------------------------------
git checkout -b feature/squash-me

Set-Content -Path Assignment.md -Value @'
# Assignment: Squash Commits

## Goal
Learn how to use interactive rebase (`git rebase -i`) to clean up a messy commit history.

## Instructions
1. This branch has 7 messy commits that were made during development.
2. One of the commits adds unnecessary debug logs (commit message: "add unnecessary debug logs"). You must **drop** this commit entirely during the rebase.
3. **Squash** the remaining commits into a single, clean commit.
4. The final commit message should be: "feat: update config settings for production".
'@
git add Assignment.md
git commit -m "Add assignment instructions for squash"

Set-Content -Path config.sh -Value @'
#!/bin/bash
export APP_ENV="production"
export DEBUG=true
export DB_HOST="localhost"
'@
git add config.sh
git commit -m "wip: start changing config to prod"

Set-Content -Path config.sh -Value @'
#!/bin/bash
export APP_ENV="production"
export DEBUG=false
export DB_HOST="localhost"
'@
git add config.sh
git commit -m "fix debug flag"

Set-Content -Path config.sh -Value @'
#!/bin/bash
export APP_ENV="production"
export DEBUG=false
export DB_HOST="localhost"
echo "DEBUG: Config loaded"
'@
git add config.sh
git commit -m "add unnecessary debug logs"

Set-Content -Path config.sh -Value @'
#!/bin/bash
export APP_ENV="production"
export DEBUG=false
export DB_HOST="db.prod.internal"
echo "DEBUG: Config loaded"
'@
git add config.sh
git commit -m "update db host"

Set-Content -Path config.sh -Value @'
#!/bin/bash
export APP_ENV="production"
export DEBUG=false
export DB_HOST="db.production.internal"
echo "DEBUG: Config loaded"
'@
git add config.sh
git commit -m "typo in db host"

Set-Content -Path config.sh -Value @'
#!/bin/bash
export APP_ENV="production"
export DEBUG=false
export DB_HOST="db.production.internal"
export TIMEOUT=30
echo "DEBUG: Config loaded"
'@
git add config.sh
git commit -m "add timeout"

git checkout main

# ---------------------------------------------------------
# 4. Setup feature/rebase-me (Branch off before main updates)
# ---------------------------------------------------------
git checkout -b feature/rebase-me

Set-Content -Path Assignment.md -Value @'
# Assignment: Rebase with Conflicts

## Goal
Learn how to rebase a branch and resolve conflicts that occur in the middle of the rebase process.

## Instructions
1. This branch is behind `main`, and both this branch and `main` have modified `utils.sh`.
2. Run `git rebase main`.
3. The rebase will pause because of a conflict in `utils.sh`.
4. Resolve the conflict by keeping both the new `multiply` function (from this branch) and the new `divide` function (from main), and combining the changes to `calculate_sum`.
5. Add the resolved file and run `git rebase --continue` to finish.
'@
git add Assignment.md
git commit -m "Add assignment instructions for rebase"

Set-Content -Path utils.sh -Value @'
#!/bin/bash

function log_message() {
    echo "[INFO] $1"
}

function calculate_sum() {
    # Added comment for sum
    local a=$1
    local b=$2
    echo $((a + b))
}

function multiply() {
    local a=$1
    local b=$2
    echo $((a * b))
}
'@
git add utils.sh
git commit -m "Add multiply function and comment to sum"
git checkout main

# ---------------------------------------------------------
# Update MAIN to create rebase conflict and merge conflict baseline
# ---------------------------------------------------------
Set-Content -Path utils.sh -Value @'
#!/bin/bash

function log_message() {
    echo "[INFO] $1"
}

function calculate_sum() {
    local a=$1
    local b=$2
    # Ensure inputs are numbers
    echo $((a + b))
}

function divide() {
    local a=$1
    local b=$2
    echo $((a / b))
}
'@
git add utils.sh
git commit -m "Main update: Add divide function and input check to sum"

# ---------------------------------------------------------
# 5. Setup feature/merge-conflict
# ---------------------------------------------------------
# Branch off the LATEST main
git checkout -b feature/merge-conflict

Set-Content -Path Assignment.md -Value @'
# Assignment: Complex Merge Conflict

## Goal
Learn how to resolve a large, complex merge conflict involving extensive overlapping refactoring.

## Instructions
1. The `process_data.sh` script was heavily refactored on this branch (added logging and new metrics features).
2. Meanwhile, someone else refactored the *exact same file* on the `main` branch to add error handling.
3. Run `git merge main` (or rebase). You will get a massive conflict in `process_data.sh`.
4. Resolve the conflict manually. Ensure that the final script contains **both** the error handling (from `main`) and the logging/metrics features (from this branch).
5. Complete the merge commit.
'@
git add Assignment.md
git commit -m "Add assignment instructions for merge conflict"

Set-Content -Path process_data.sh -Value @'
#!/bin/bash

function load_data() {
    echo "[LOG] Starting data load..."
    echo "Loading data from database..."
    sleep 1
    echo "[LOG] Data load complete."
}

function process_records() {
    echo "[LOG] Starting record processing..."
    local count=0
    for i in {1..5}; do
        echo "Record $i processed."
        count=$((count + 1))
    done
    echo "[METRIC] Processed $count records total."
}

function save_results() {
    echo "[LOG] Saving..."
    echo "Saving results..."
    echo "[LOG] Save done."
}

function main() {
    echo "--- Data Processor v1.0 (with Logging) ---"
    load_data
    process_records
    save_results
    echo "--- Finished ---"
}

main
'@
git add process_data.sh
git commit -m "Refactor process_data to include logging and metrics"
git checkout main

# ---------------------------------------------------------
# Update MAIN to create the complex merge conflict
# ---------------------------------------------------------
Set-Content -Path process_data.sh -Value @'
#!/bin/bash

function load_data() {
    echo "Loading data from database..."
    if ! sleep 1; then
        echo "Error: Failed to sleep/load"
        exit 1
    fi
    echo "Data loaded successfully."
}

function process_records() {
    echo "Processing records..."
    for i in {1..5}; do
        if [ -z "$i" ]; then
             echo "Error: Invalid record"
             continue
        fi
        echo "Record $i processed."
    done
}

function save_results() {
    echo "Saving results securely..."
    echo "Done."
}

function main() {
    echo "--- Data Processor v1.0 (Secure) ---"
    load_data || exit 1
    process_records
    save_results
    echo "--- Execution Completed ---"
}

main
'@
git add process_data.sh
git commit -m "Refactor process_data to include robust error handling"

# Go back to main
git checkout main
Write-Output "Setup complete."
