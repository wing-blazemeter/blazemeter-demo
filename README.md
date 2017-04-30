# blazemeter-demo
Simple App to Test BlazeMeter Jenkins Integration

# For OSX Users
Follow [this guide](https://coolestguidesontheplanet.com/get-apache-mysql-php-and-phpmyadmin-working-on-macos-sierra/) to set up Apache, MySql, and PHP (AMP stack).

Once complete, the app will be available at e.g. http://localhost/~David/blazemeter-demo/app/

Or, if you prefer, you can simply ``make app`` to run the app inside a Docker container.

# CI/CD and Docker Integration
See ``Makefile``. Create an ``.env`` file in your workspace as per the provided ``.env.sample`` in order to use ``make`` targets.
