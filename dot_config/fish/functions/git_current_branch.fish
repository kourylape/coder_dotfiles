function git_current_branch
    set -l ref (git symbolic-ref --quiet HEAD 2> /dev/null)
    if test -n "$ref"
        echo (string replace "refs/heads/" "" -- $ref)
        return 0
    end
    set -l ref (git rev-parse --short HEAD 2> /dev/null)
    if test -n "$ref"
        echo $ref
        return 0
    end
    echo "unknown"
end
