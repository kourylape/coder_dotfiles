# Execute an interactive shell in a specified Docker container
function dsh
    docker exec -ti $argv[1] sh
end
