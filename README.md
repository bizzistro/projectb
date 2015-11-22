# projectb

Hey everyone. Please clone the project and make a change here, and then commit it and push to origin/master.

branch strategy:

```
master
develop
feature/featureA
feature/featureB
...
```

etc. So if you're working on the login feature, you'll create a branch called `feature/login`.

## Notes on merging:

(Shelby:) I realized I've been merging with fast-forwards but I think it's a good idea to use `git merge [thebranch] --no-ff` from now on so it's easier to make sense of the commit history. (And I'll try to start being consistent about making changes on branches other than master and merging to master later.)

Here are some useful references on git branching:

- https://www.atlassian.com/git/tutorials/using-branches/git-checkout
- http://nvie.com/posts/a-successful-git-branching-model/
