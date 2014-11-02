grizzlies
=========

## How to run the project

First of all you nead to have vagrant and virtualbox installed on yor system.

After that you should install [vagrant-librarian-chef](https://github.com/jimmycuadra/vagrant-librarian-chef) plugin for vagrant:
```
vagrant plugin install vagrant-librarian-chef
```

Next clone repository and go to derectory of the project.

After that run in console:
```
vagrant up
```

This command takes a while because it downloads virtualbox image and configures it using Chef.

After vagrant is upping you should prepate database and run rails server:
```
vagrant ssh
cd /vagrant
rake db:create db:migrate db:seed
rails server
```

When database is prepared and rails server is running you can just open project in your browser:
[http://localhost:3000](http://localhost:3000)
