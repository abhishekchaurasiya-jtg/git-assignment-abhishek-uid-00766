# Assignment: Amend Commit

## Goal
Learn how to use `git commit --amend` to modify the previous commit.

## Instructions
1. Look at the last commit on this branch. It accidentally included a secret API key in `config.sh` and contains a typo in the commit message ("Add new fature and API kye").
2. Your task is to remove the `API_KEY` line from `config.sh`.
3. You also need to create a new file called `helper.sh` containing a simple bash function, which was forgotten in the last commit.
4. Stage your changes and use `git commit --amend` to update the previous commit. 
5. During the amend, fix the commit message to simply be: "Add new feature and config".
