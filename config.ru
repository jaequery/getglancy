require './boot'

# set controllers
map('/dashboard') { run DashboardApp }
map('/api') { run ApiApp }
map('/') { run SiteApp }
