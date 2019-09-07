#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export GOPATH=$(go env GOPATH)
export PATH="$PATH:$HOME/bin:$HOME/opt/cross/bin:$GOPATH/bin"

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
