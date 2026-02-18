# Clean up merged branches, excluding qa, staging, main, and the current branch
function ggbclean
    git for-each-ref --format '%(refname:short)' refs/heads --merged | grep -v "qa\|staging\|main\|"(git_current_branch) | xargs -r git branch -D
end
