function ggbr
  git branch --sort=-committerdate | fzf --header Checkout | xargs git checkout
end
