# Taskr

This is a rails web application to create, track and manage projects using a task based system.

## Getting Started

Start by cloning this repository and run ```bundle install``` from within the project directory to setup the dependencies.

After the dependencies have been successfully installed, enter ```rake db:seed``` and then ```rake db:migrate``` from within the project directory to seed the setup the database correctly with test data.

Next you can enter ```rails server``` also from within the project directory to start the server.

Following the instructions in the terminal you will notifed which localhost port you will be to now access the project from.

Example ```localhost:3000```

## Using 3rd Party Authentication

The application is setup to allow 3rd party authentication through github. However for security reasons, the app ID and key are stored within a .env file not included in this repository. To use this feature simply generate a new app ID and key for authorization and store it within a .env file at the projects directory root in the following format.

```
GITHUB_APP_ID='YOUR ID HERE'
GITHUB_APP_SECRET='YOUR SECRET HERE'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lmjcbs/taskr.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).