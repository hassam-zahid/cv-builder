### Install Git Gui version 

```
sudo apt-get install git-gui

```

### Server Setup

```
rake db:drop
rake db:create 
rake db:migrate 
rake db:seed
rails s

```

### Create Model without migration 

```
rails g model ModelName --migration=false

```

