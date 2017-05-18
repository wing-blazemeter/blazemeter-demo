# blazemeter-demo
Simple App to test CI/CD with Blazemeter Taurus & Jenkins Pipeline

# Run the App
## Traditional Approach (OSX)
Follow [this guide](https://coolestguidesontheplanet.com/get-apache-mysql-php-and-phpmyadmin-working-on-macos-sierra/) to set up Apache, MySql, and PHP (AMP stack).

Once complete, the app will be available at e.g. http://localhost/~David/blazemeter-demo/app/.

## Docker Approach
From the project directory, run ``make network`` so that our containers can communicate with each other.

Then run ``make app`` to run the app inside a Docker container at http://localhost:8888.

# Run Taurus
Follow [this guide](https://gettaurus.org/docs/Installation/) to install Taurus/bzt on the OSX command line. Running from the command line allows for live visualization of performance test runs.

You can ``make bzt`` to run Taurus inside a Docker container. Before you begin, create a ``.bzt-rc`` file as per the provided ``.bzt-rc.sample`` and add your Blazemeter token. Be sure to ``make app`` before you ``make bzt``.

When finished, run ``make clean`` to stop the app and remove stopped containers.

# CI/CD with Jenkins Pipeline
1. Run Jenkins via ``make jenkins`` (be sure to ``make network`` first if you haven't done this already).
2. Create a MultiBranch Pipeline that points to this repo.
3. Add a "Secret Text" Credential to the MultiBranch Pipeline folder called ``blazemeter-token``.
4. Modify the volume mapping under ``bzt-jenkins`` in the ``Makefile`` so that it's specific to your workstation.
5. Build! For more details, see ``Jenkinsfile`` in the project root directory.
