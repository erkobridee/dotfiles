function git_fetch() {
	echo -e "\nUpdating repository...\n"

	git fetch --all -p
	git remote update --prune

	echo -e "\nDone.\n"
}

function git_fetch_tags() {
	echo -e "\nUpdating local tags with remote tags...\n"

	git fetch origin 'refs/tags/*:refs/tags/*'

	echo -e "\nDone.\n"
}

function git_undo_changes() {
	echo -e "\nUndoing changes...\n"

	# Revert changes to modified files.
	git reset --hard

	# Remove all untracked files and directories.
	git clean -fd

	echo -e "\nDone.\n"
}

# Maintaining a Git Repository | Atlassian Documentation
# https://confluence.atlassian.com/bitbucket/maintaining-a-git-repository-321848291.html
function git_gc() {
	# Garbage collecting dead data

	# 1. Prune all of the reflog references from now on back
	# (unless you're explicitly only operating on one branch).
	git reflog expire --expire=now --all

	# 2. Repack the repository by running the garbage collector and pruning old objects.
	git gc --prune=now
}

# Reset local repository branch to be just like remote repository HEAD
function git_reset_branch() {
	if [ "$1" ]; then
		# get last stuff from remote
		git fetch origin

		# reset target branch > branchName :
		# could be master, development, feature/branchName, etc
		git reset --hard origin/$1
	else
		echo "no branch defined"
	fi
}

function git_delete_branch() {
	if [ "$1" ]; then
		git branch -D $1
		git push origin :$1
	else
		echo "no branch defined"
	fi
}

function git_copy_branch_name() {
	local branch=$(git rev-parse --abbrev-ref HEAD)
	echo "$branch >> git current branch copied to the clipboard"
	echo $branch | tr -d '\n' | tr -d ' ' | pbcopy
}
