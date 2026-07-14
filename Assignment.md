# Assignment: Complex Merge Conflict

## Goal
Learn how to resolve a large, complex merge conflict involving extensive overlapping refactoring.

## Instructions
1. The `process_data.sh` script was heavily refactored on this branch (added logging and new metrics features).
2. Meanwhile, someone else refactored the *exact same file* on the `main` branch to add error handling.
3. Run `git merge main` (or rebase). You will get a massive conflict in `process_data.sh`.
4. Resolve the conflict manually. Ensure that the final script contains **both** the error handling (from `main`) and the logging/metrics features (from this branch).
5. Complete the merge commit.
