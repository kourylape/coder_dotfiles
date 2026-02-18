# Quickly go to git directories
function ggo
    cd (fd --exact-depth 1 . ~/Repositories | fzf)
end
