ITERM_SESSION_NAME=Default

if [ $TERM_PROGRAM = "iTerm.app" ]; then
  set_term_bgcolor(){
    local R=$1
    local G=$2
    local B=$3
    /usr/bin/osascript <<EOF > /dev/null 2>&1
tell application "iTerm"
  tell the current terminal
    tell the current session
      set background color to {$(($R*65535/255)), $(($G*65535/255)), $(($B*65535/255))}
    end tell
  end tell
end tell
EOF
  }

  function new_tab() {
    osascript\
      -e "tell application \"iTerm\""\
        -e "tell the first terminal"\
          -e "launch session \"${ITERM_SESSION_NAME}\""\
          -e "tell the current session"\
            -e "write text \"$1\""\
            -e "set name to \"$2\""\
          -e "end tell"\
        -e "end tell"\
      -e "end tell"\
      2> /dev/null
  }

  function ssh_iterm() {
      new_tab "clear; /usr/bin/ssh $@; exit" "$@"
      set_term_bgcolor 80 0 0
  }

  alias ssh=ssh_iterm
  #compdef _ssh ssh_iterm=ssh
 fi
