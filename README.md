# blazemeter-demo
Simple App to test CI/CD with Blazemeter Taurus & Jenkins Pipeline

# Run the App
## Traditional Approach (OSX)
Follow [this guide](https://coolestguidesontheplanet.com/get-apache-mysql-php-and-phpmyadmin-working-on-macos-sierra/) to set up Apache, MySql, and PHP (AMP stack).

Once complete, the app will be available at e.g. http://localhost/~David/blazemeter-demo/app/

## Docker Approach
From the project directory, ``make app`` to run the app inside a Docker container at http://localhost:8888.

# Install Taurus
Follow [this guide](https://gettaurus.org/docs/Installation/) to install Taurus/bzt on the OSX command line.
