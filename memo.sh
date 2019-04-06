#!/bin/bash

function add() {
  if [ -n "$1" ]; then
    touch $MEMO_DIR/$1.md
  fi
}

function list() {
  ls -ls $MEMO_DIR
}

function edit() {
  filename=$(ls -1 $MEMO_DIR | fzf +m)
  if [ -n "$filename" ]; then
    $EDITOR $MEMO_DIR/$filename
  fi
}

function delete() {
  filename=$(ls -1 $MEMO_DIR | fzf +m)
  if [ -n "$filename" ]; then
    rm $MEMO_DIR/$filename
  fi
}

case $1 in
  "add")
    add $2
    ;;
  "list")
    list
    ;;
  "edit")
    edit $2
    ;;
  "delete")
    delete
    ;;
  *)
    ;;
esac

exit 0

