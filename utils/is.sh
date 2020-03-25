# https://devhints.io/bash

function is_executable() {
	type "$1" >/dev/null 2>&1
}

function is_directory() {
	[ -d $1 ] 2>&1
}

function is_file() {
	[ -f $1 ] 2>&1
}

function is_string_empty() {
	[ -z "$1" ] 2>&1
}

function is_string_nop_empty() {
	[ -n "$1" ] 2>&1
}
