export CC=/usr/bin/gcc-4.2

for project in puppet facter ; do
  export RUBYLIB="$HOME/devel/puppetlabs/$project/lib:$RUBYLIB"
done

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[[ -s "$HOME/.rvm/contrib/ps1_functions" ]] && source "$HOME/.rvm/contrib/ps1_functions"

ps1_set --notime 
