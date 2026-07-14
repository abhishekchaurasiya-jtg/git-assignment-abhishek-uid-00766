# Assignment: Rebase with Conflicts

## Goal
Learn how to rebase a branch and resolve conflicts that occur in the middle of the rebase process.

## Instructions
1. This branch is behind `main`, and both this branch and `main` have modified `utils.sh`.
2. Run `git rebase main`.
3. The rebase will pause because of a conflict in `utils.sh`.
4. Resolve the conflict by keeping both the new `multiply` function (from this branch) and the new `divide` function (from main), and combining the changes to `calculate_sum`.
5. Add the resolved file and run `git rebase --continue` to finish.
