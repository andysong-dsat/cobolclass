02142023

git config --global user.email "andysong.dsat@gmail.com"
git config --global user.name "Andy Song"

git init							initialize project to use git
git add .							add all changes to be saved
git add *filename* 					add single file to be saved
git commit -m 'coboltut examples'	save changes with msg
git pull origin master				push changes to github master
git push origin new-branch			push changes to github new-branch
git pull origin master				pull changes from github master
git checkout -b new-branch			create a new branch
git status							check status of changes
git log								see all previous saved changes
git checkout *commit hash* 			travel back to old commit

git remote add origin https://github.com/andysong-dsat/cobolclass.git

git config --global credential.helper cache
git push -u origin master

personal access token
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

Git:: configurations
	git config --global user.name "First Last"
	git config --global user.email "your-email@email.com"
	git config --global color.ui.true
	git config --list
	
Git: starting a reposi
	git init
	git status
		
Git: staging files
	git add <file-name>
	git add <file-name> <another-file> <one-more>
	git add .
	git add --all
	git add -A
	git rm --cached <file-name>
	git reset <file-name>
	
Git: committing to a repository
	git commit -m "Add something"
	git reset --soft HEAD^
	git commit --amend -m <your message>
	
Git: pulling and pushing from and to repositories
	git remote add origin <link>
	git push -u originn master
	git clone <clone>
	git pull
	
git branch



q
:q
zz


ls -al ~/.ssh
ssh-keygen -t ed25519 -C "andysong.dsat@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
clip < ~/.ssh/id_ed25519.pub
ssh -T git@github.com


cobc -x coboltut.cobc
./coboltut