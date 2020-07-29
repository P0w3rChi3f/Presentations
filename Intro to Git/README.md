# GIT Overview Outline  

## Intro  

 1. What is GIT and how did it come about?  

- Git is a form of version control
- Developed for Software Developers and Organizations  

2. Repository  

- A repository is just a shared directory. Formerly in a central repository.  
- May have to manually do version control
- GIT is designed with a distributed repository in mind

3. Terms  

- Branch – An alternate development path  
- Merge – How you connect a branch to a master  
- GIT Pull – Pulls down just the changes in the repository  
- GIT Push – Push changes to a repository  
- GIT Clone – Pulls down a complete copy of a repository  
- GIT Add – Adds a file or directory to GIT to be tracked  
- GIT Commit – Saves changes to GIT  

## Demo  

1. Creat a Github repository on Github.com

- Log into your personal account
  - GIT-Overview (Repo Name)
  - Here is all my files for my preentation (Description)  

2. Create a local working directory  

```powershell
cd $env:USERPROFILE\Documents\
New-Item -Type Directory -Name WorkingFolder  
```  

3. Now clone your Newly created GITHub Repository to you working directory  

```git
git clone <repository from Github>
cd GITOverview
get-childitem -force
```  

4. Add a comment to the readme.md

- Open up the readme.md and add "## I added my PPTs" to it  
- run the following command and reflect on what you are seeing 
  - Not that `git commit -a` open vi to edit the commit text 

```git
git status
git commit -a
Git status 
Git push
```  

5. Add documents to the repository

- Add a document to the local repository and run the following commands  

```git
git status
git add <name of document>
```

- Now add a second document  

```git  
Git status
git add .
Git status
git commit -m " Now I have added documents"
Git status
git push
```  

6. Double commit

-  Edit the readme.md file and add the following 2 links  
    - [Intro to Git]( https://www.youtube.com/watch?v=SWYqp7iY_Tc)  
    - [Intro to Markdown in VSCode]( https://www.youtube.com/watch?v=pTCROLZLhDM)  
- Now run the following code  

```git
Git status
git add .
git status
```

- Now add the 3rd link  
  - [How to use GIT in VSCode]( https://www.youtube.com/watch?v=F2DBSH2VoHQ)  
- Run the following code

```git
Git status
git add .
Git status
git commit -m "Added some Youtube links"
Git status
git push
```
