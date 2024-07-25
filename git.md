1.	How do you initialize a new Git repository named "project1" on your local machine?
```
mkdir project1
cd project1
git init
```

2.	How do you add a new file named "index.html" to the "project1" repository?
```
touch index.html
```

3.	How do you stage the changes made to "index.html" for committing?

```
git add index.html
```

4.	How do you commit the changes made to "index.html" with a commit message of "Add index.html"?

```
git commit -m "Add index.html"
```

5.	How do you view the commit history of the "project1" repository?

```
git log
```

6.	How do you create a new branch named "feature-branch" in the "project1" repository?

```
git branch feature-branch
```

7.	How do you switch to the "feature-branch" in the "project1" repository?

```
git checkout feature-branch
```

8.	How do you make changes to "index.html" in the "feature-branch"?
```
git add index.html
```

9.	How do you stage and commit the changes made in the "feature-branch" with a commit message of "Update index.html in feature branch"?
```
git commit -m "Update index.html"
```

10.	How do you switch back to the main branch in the "project1" repository?
```
git checkout main
```

11.	How do you merge the changes from the "feature-branch" into the main branch?
```
git merge feature-branch
```
12.	How do you resolve any merge conflicts that occur during the merge process?
> get into the index.html and remove the part we don't need which caused the conflict.

13.	How do you view the changes introduced by the merge commit?
```
git diff
```
14.	How do you create a new tag named "v1.0" for the current commit in the "project1" repository?
```
git tag -a v1.0 b70f3c0b68e50bd99ef77454abb81aad0fc4347e -m "tag a commit"
```
15.	How do you push the "project1" repository to a remote repository named "origin"?
```
git push origin main
```

16.	How do you clone the "project1" repository from a remote repository to another machine?
```
git clone https://github.com/AkechiKogoro/project1.git
```

17.	How do you fetch the latest changes from the remote repository to your local "project1" repository?
```
git checkout main
git pull origin main
```

18.	How do you pull the latest changes from the remote repository into your current branch in the "project1" repository?
```
git checkout feature-branch
git pull origin main
```



19.	How do you create a new branch named "bug-fix" in the "project1" repository based on a specific commit?
```
git branch bug-fix
git checkout bug-fix
git cherry-pick c860ef82bdcb5214978cba7665f23ccea200e5d3
git push origin bug-fix
```

20.	How do you revert the last commit made in the "project1" repository?
```
git revert HEAD
```
