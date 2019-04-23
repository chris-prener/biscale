# Contributing to this Lesson
Thanks for using this package. Before filing an issue or opening a pull
request, there are a few places to explore and pieces to put together to make
the process as smooth as possible.

## Getting Started
Start by making a minimal reproducible example (**reprex**) using the
[reprex](http://reprex.tidyverse.org/) package. If you haven't heard of or used
reprex before, you're in for a treat! Seriously, reprex will make all of your
R-question-asking endeavors easier (which is a pretty insane ROI for the five to
ten minutes it'll take you to learn what it's all about). For additional reprex
pointers, check out the [Get help!](https://www.tidyverse.org/help/) section of
the tidyverse site.

Armed with your reprex, the next step is to figure out [where to ask](https://www.tidyverse.org/help/#where-to-ask).

  * If it's a question: start with [community.rstudio.com](https://community.rstudio.com/).
    There are more people there to answer questions.  
  * If it's a bug: you're in the right place, file an issue.  
  * If it's a feature request: you're in the right place, file an issue.  
  * If you're not sure: let the community help you figure it out! If your
    problem _is_ a bug or a feature request, you can easily return here and
    report it. You can use our _other inquiry_ issue template to get our
    feedback.

## Before Opening an Issue
Before opening a new issue, be sure to [search issues and pull requests][issuesLink]
to make sure the bug or typo hasn't been reported and/or already fixed.
Similarly, search to make sure someone has not already made a suggestion. If
there is a suggestion and you want to express support for it, please comment
in the existing issue.

By default, the search will be pre-populated with `is:issue is:open`. You can
[edit the qualifiers](https://help.github.com/articles/searching-issues-and-pull-requests/)
(e.g. `is:pr`, `is:closed`) as needed. For example, you'd simply
remove `is:open` to search _all_ issues in the repo, open or closed.

## Issue Templates
When you go to open an issue, you are encouraged to select from one of the
three templates: bug reports, feature requests, or other inquiries. These will
help you craft an issue that is as helpful and clear as possible!

## PR process
If you've found a way to contribute, please follow the PR process described
here to fork, edit, and push your proposed changes. We recommend opening an
issue to gauge our interest before spending time working on a PR!

### Fork, clone, branch
The first thing you'll need to do is to [fork](https://help.github.com/articles/fork-a-repo/)
[this lesson][repoLink], and then clone it locally.
We recommend that you create a branch for each PR.

### Style
Match the existing code or documentation style. Be careful to only make style changes
to the code you are contributing.

### Document
Make sure to update the help files if your changes impact
any of those documents. If you add a new package dependency, please also update
the `DESCRIPTION` file so that the dependency is part of our continuous integration
testing.

### Check
Once you are done, make sure that all changed `.Rmd` documents knit without error.

### Commit
When you've made your changes, write a clear commit message describing what
you've done. If you've fixed or closed an issue, make sure to include keywords
(e.g. `fixes #101`) at the end of your commit message (not in its
title) to automatically close the issue when the PR is merged.

### Push and pull
Once you've pushed your commit(s) to a branch in _your_ fork, you're ready to
make the pull request. Pull requests should have descriptive titles to remind
reviewers/maintainers what the PR is about. You can easily view what exact
changes you are proposing using either the [Git diff](http://r-pkgs.had.co.nz/git.html#git-status)
view in RStudio, or the [branch comparison view](https://help.github.com/articles/creating-a-pull-request/)
you'll be taken to when you go to create a new PR. If the PR is related to an
issue, provide the issue number and slug in the _description_ using
auto-linking syntax (e.g. `#15`).

## Code of Conduct
Please note that this project is released with a [Contributor Code of
Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to
abide by its terms.

## Acknowledgements
These contributing guidelines are modified from those used by [Jenny Bryan](https://github.com/jennybc).

[repoLink]: https://github.com/slu-openGIS/biscale
[issuesLink]: https://github.com/slu-openGIS/biscale/issues
