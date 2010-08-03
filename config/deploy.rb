set :application, "chorechopper"
set :repository,  "git@github.com:sandfish8/chore_chopper"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
set :deploy_to, "/home/sandfish8/chorechopper.chgworks.com"
set :user, "sandfish8"
set :scm_username, "sandfish8"
set :use_sudo, false

role :app, "siegel.dreamhost.com"
role :web, "siegel.dreamhost.com"
role :db,  "siegel.dreamhost.com", :primary => true