alias tmux="env TERM=screen-256color tmux"
alias make="make -j9"

set -x GOPATH $HOME/gopath
set -x GOBIN $GOPATH/bin
set -Ux PYTHONSTARTUP (python -m jedi repl)

# Fuzzy cd with FZF
function -d "Fuzzy change directory"  fcd
    if set -q argv[1]
        set searchdir $argv[1]
    else
        set searchdir $HOME
    end

    # https://github.com/fish-shell/fish-shell/issues/1362
    set -l tmpfile (mktemp)
    find $searchdir \( ! -regex '.*/\..*' \) ! -name __pycache__ -type d | fzf > $tmpfile
    set -l destdir (cat $tmpfile)
    rm -f $tmpfile

    if test -z "$destdir"
        return 1
    end

    cd $destdir
end
