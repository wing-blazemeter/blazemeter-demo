# blazemeter-demo
Simple App to demonstrate CI/CD with Blazemeter Taurus & Jenkins Pipeline.

Prerequisites: ``docker`` and ``make`` must be available on your workstation.

# Install & Run the App
## Traditional Approach - Optional
Follow [this guide](https://coolestguidesontheplanet.com/get-apache-mysql-php-and-phpmyadmin-working-on-macos-sierra/) to set up Apache, MySql, and PHP (AMP stack).

Once complete, the app will be available at e.g. http://localhost/~David/blazemeter-demo/app/.

## Docker Approach - Required
Run ``make network`` once. This is required for the app to run, and also for testing the containerized version of Taurus.

Simply run ``make app`` to run the app inside a Docker container at http://localhost:8888.

# Install & Run Taurus
## Traditional Approach - Required
Follow [this guide](https://gettaurus.org/docs/Installation/) to install Taurus/bzt on the OSX command line. Running from the command line allows for live visualization of performance test runs.

Create an account on http://blazemeter.com and get your API token. This is used to publish test results to your personal account and view trends instead of uploading tests anonymously. To install your token into Taurus, create a ``.bzt-rc`` file as per the provided ``.bzt-rc.sample`` and place it at e.g. ``/Users/David/.bzt-rc``.

## Docker Approach - Optional
You can ``make bzt`` to run Taurus inside a Docker container. Before you begin, create a ``.bzt-rc`` file as per the provided ``.bzt-rc.sample`` and add your Blazemeter token. Be sure to ``make app`` before you ``make bzt``.

When finished, run ``make clean`` to stop the app and remove stopped containers.

# CI/CD with Jenkins Pipeline
1. Download and install Jenkins from http://jenkins-ci.org.
2. Install the [Performance Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Performance+Plugin) and [Blue Ocean Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Blue+Ocean+Plugin).
3. In Blue Ocean, create a New Pipeline that points to this repo. You will need to add your GitHub credential.
4. Build! For more details, see ``Jenkinsfile`` in the project root directory.

# TODO
- Add Lockable Resources Plugin to prevent builds on multiple branches from ``make``-ing ``app`` at the same time - it causes naming conflicts. As a result, the first and only first build(s) may fail. Try again or check docker cleanup.
