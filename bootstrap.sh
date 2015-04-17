# To bootstrap bartlett, run the following:
# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/collectiveidea/bartlett/master/bootstrap)"

INSTALL_DIR = "~/.bartlett"
GIT_URL = "https://github.com/collectiveidea/bartlett"

`git clone #{GIT_URL} #{INSTALL_DIR}`

puts "Add the following to your .bashrc or .zshrc"
puts "PATH=$PATH:$HOME/.bartlett/bin"
