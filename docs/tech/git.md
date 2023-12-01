# Git

## HowTo

### Init

空目錄: 加一個 `.gitkeep` 檔案

### Branch

```bash title="從舊的commit開新的branch"
git checkout -b new-branch <commit-hash>
```

### Remote branch

```bash title="看所有remote branch"
git branch -r
```

```bash title="Update from remote branch"
$ git fetch origin discover:discover && git checkout discover
# or
$ git fetch origin aRemoteBranch
$ git checkout aLocalBranch
$ git merge origin/aRemoteBranch
```

```bash title="Revert remote repo"
 git reset --hard <commit-hash>
 git push -f origin master
```


