# Shell Script

**naming convention: use small case with Hyphens(-). No spaces**

**steps:**
* Create repo in Github
* Clone repo in local laptop
* Start developing
* Add the files to temp area
```
git add <file-name>
```

* Commit the changes
```
git commit -m "Some-MSG"
```

* Push the changes to GitHub/Central repo
```
git push -u origin main
```
* Below is dont ask token in future login
```
git config --global credential.helper store
```

* To run all 3 command at a time
```
git add . ; git commit -m "some-message"; git push -u origin main
```