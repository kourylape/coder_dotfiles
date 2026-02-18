# Get branches, process them to show last commit information, and display in a formatted table
function ggbo
    git branch | string trim | grep -v "HEAD" | while read -l branch
        # For each branch, get the last commit info and format it
        git log --color --format="%ci *%C(magenta) %cr^ %C(bold cyan)$branch%Creset^ %s^ %C(bold blue)%an%Creset" "$branch" | head -n 1
    end | sort -r | string replace -r '.*\*(.*)' '$1' | string replace -a 'origin/' '' | awk -F^ -vOFS=^ 'NR{$3=substr($3,1,60)}1' | head -15 | column -t -s '^'
end
