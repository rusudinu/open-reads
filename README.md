# Open Reads

Open-Source GoodReads clone, with a cleaner UI, book search, friends feed that will show what your friends are reading, personal shelves (currently reading, read, want to read), rating and review functionality.

## Team Members

Rusu Dinu-Ștefan (email: dinu_stefan.rusu@stud.fils.upb.ro)

Mîș Emilia-Oana (email: emilia_oana.mis@stud.fils.upb.ro)

## URLs

The FE is deployed here: https://openreads.codingshadows.com/, but will access the backend hosted on localhost.

### Stories

1. As a user, I want to be able to search for books by title, author, genre, etc.
2. For each book, I want to be able to add it to different shelves. The books that I want to read should be added to the “Want to Read” shelf, the books that I am currently reading should be added to the “Currently Reading” shelf, and the books that I have already read should be added to the “Read” shelf.
3. As a user, I should be able to rate each book with a score ranging from 1 to 5 stars and write a review.
4. As a user, I want to be able to see the books that I have read, the books that I am currently reading, and the books that I want to read, so that I can keep track of my reading progress, on a profile page.
5. As a user, I want to be able to see what my friends are reading, and what books are on the same topic that they are currently reading, so that I can find new books to read.
6. I would also like to see recommended books based on the topics that I am interested in.

## Guidelines
To authenticate just open [localhost:8080](localhost:8080).

For OIDC_USER role just use demo, demo, for OIDC_ADMIN just use rusu, rusu.

### Branches

The branch management and deployment process objectives are:

* allow multiple teams to work in parallel, with minimal friction
* deploy implemented features as soon as possible
* have a clear image at all times of what is latest common code, and what is deployed in production

There will be 4 type of branches:

* master
  * the master branch serves as a merging place for all feature branches
  * all feature branches will be started from the master branch
* release
  * this branch is the only one from which PROD deployments are made
  * commits are brought into the release branch in two ways:
    * preferably, all changes from master are brought into the release branch for an upcoming release; this is done by merging the master branch into release
    * when not all changes should be merged, the relevant commits should be cherry-picked into the release branch
* feature
  * all new features start from current master branch
  * every story is developed in one or more feature branches, but never on master
  * before merging, all commits should be squashed into one, to make cherry-picking easy, and the branch structure easier to read
* hotfix
  * hotfix branches are created from the release branch
  * hotfix branches are merged into the release branch and master branch

### Branch naming

Feature branches should be named ***feature/$ticket-id-ticket-name***.

Hotfix branches should be named ***hotfix/$ticket-id-ticket-name***.

### Commit messages

Each commit message should start with the ticket id, followed by a short description of the changes.

## Pull requests

### Pull request naming

Pull requests should be named ***$ticket-id-ticket-name*** and merged into master.

### Pull request description

Each pull request should have a description that contains a brief description of the changes.

Each pull request must be reviewed by at least one other team member in order for it to be merged. The reviewer should check that the code is clean, that the tests pass, and that the changes are consistent with the ticket description and fulfill the acceptance criteria.

After the pull request is merged, the ticket should be closed.

## Useful Links

Local backend swagger [here](http://localhost:8080/swagger-ui/index.html).

[Figma](https://www.figma.com/file/5n6GkvKFhgsmvVssX9WZpM/Open-Reads)
