fbr() {
    local branches branch
    branches=$(git branch -vv) &&
    branch=$(echo "$branches" | fzf +m) &&
    git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

fmpc() {
    local song_position
    song_position=$(mpc -f "%position%) %artist% - %title%" playlist | \
                  fzf-tmux --query="$1" --reverse --select-1 --exit-0 | \
                  sed -n 's/^\([0-9]\+\)).*/\1/p') || return 1
    [ -n "$song_position" ] && mpc -q play $song_position
}
