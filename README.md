# teammanager

teammanager is a web application used to manage student information, record forms and payments, and communicate administrative data to students.


## Local development

teammanager supports fully local development. If you want help with any of these steps, talk to the webmaster or a mentor.

1. Install the ruby version specified in .ruby-version
    - [rbenv](https://github.com/rbenv/rbenv) is recommended: `rbenv install`
2. Install dependencies: `bundle install`
3. Setup local database: `rake db:migrate && rake db:fixtures:load`
4. Setup secrets in environment variables
    - [rbenv-vars](https://github.com/rbenv/rbenv-vars) is recommended.
    - Google OAuth client id and secret
5. You should now be able to run the Rails server: `rails s`
    - You may need to install a JS runtime.
    - If you don't have one already, nodejs is usually easy to install.
    - On Ubuntu (including WSL): `sudo apt install nodejs`
6. Start the server: `rails s`
