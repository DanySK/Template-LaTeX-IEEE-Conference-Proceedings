# LaTeX template repository with continuous integration  

[![Build Status](https://travis-ci.org/DanySK/Template-IEEE-Conference-Proceedings.svg?branch=master)](https://travis-ci.org/DanySK/Template-IEEE-Conference-Proceedings)

This repository is meant to be used as template for quickly starting LaTeX IEEE conference papers,
having them built on a continuous integrator, and having them quickly deployed in GitHub releases.

The build system is based on Gradle, using [the latex-gradle plugin](https://github.com/DanySK/gradle-latex).

The file being built is [the standard IEEE Computer Society Press proceedings style guide](https://www.ieee.org/conferences/publishing/templates.html).

## Using the project

1. Create a new repo using the "Use this template" button
2. Delete existing tex files and add yours
3. Configure the build inside `build.gradle.kts` following instructions on [https://github.com/DanySK/gradle-latex](https://github.com/DanySK/gradle-latex)
4. Test your build locally by `./gradlew buildLatex`
5. Change the `_official-repo` entry in `.travis.yml`
6. Enable your repo on Travis CI
7. Generate a GitHub token and set it as privare variable in your Travis repository, following [the instructions for deployment on GitHub releases provided by Travis](https://docs.travis-ci.com/user/deployment-v2/providers/releases/)
8. Just write, commit, and push, and in few minutes your files will be automagically available on GitHub.

## Contributing to the project

I gladly review pull requests and I'm happy to improve the work.
If the software was useful to you, please consider supporting my development activity
[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=5P4DSZE5DV4H2&currency_code=EUR)
