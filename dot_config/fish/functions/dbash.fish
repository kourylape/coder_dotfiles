# Execute an interactive bash shell in a specified Docker container
function dbash
  docker exec -ti $argv[1] bash
end
