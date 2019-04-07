fo() {
    local files
    IFS=$'\n' files=($(ls -p | grep -v / | fzf --query="$1" --multi --select-1))
    [[ -n "$files" ]] && xdg-open "${files[@]}"
}

fd() {
    local dir
    dir=$(ls -p | grep / | fzf --no-multi --select-1) &&
    cd "$dir"
}

frm() {
    local files
    IFS=$'\n' files=($(ls -p | grep -v / | fzf --query="$1" --multi --select-1))
    [[ -n "$files" ]] && rm -i "${files[@]}"
}

fbr() {
    local branches branch
    branches=$(git branch -vv) &&
    branch=$(echo "$branches" | fzf --no-multi) &&
    git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

fmpc() {
    local song_position
    song_position=$(mpc -f "%position%) %artist% - %title%" playlist | \
                  fzf --query="$1" --reverse --select-1 --exit-0 | \
                  sed -n 's/^\([0-9]\+\)).*/\1/p') || return 1
    [ -n "$song_position" ] && mpc -q play $song_position
}
