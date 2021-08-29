function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function current_repository() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo $(git remote -v | cut -d':' -f 2)
}

function commit {
  if [ $# -eq 0 ]; then
    echo "Please enter a commit message:";
    read msg;
    commit "$msg";
  elif [[ $1 == --help ]] || [[ $1 == --h ]] || [[ $1 == --? ]]; then
    echo "This will commit changes to a local git repo, eg:";
    echo "$ commit 'some changes made'";
    echo "This will do: git commit -s -m 'some changes made'";
  else
    echo git commit -s -a -m "$1"
    git commit -s -a -m "$1";
  fi
}

function current_short_hash() {
  echo $(git rev-parse --short HEAD)
}
