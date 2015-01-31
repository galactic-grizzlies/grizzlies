grizzlies
=========

## Demo
[https://grizzlies.herokuapp.com/](https://grizzlies.herokuapp.com/)

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


## Architecture decisions

### Product recomendations

Product recommendation has been implemented using [Colloborative filtering](http://en.wikipedia.org/wiki/Collaborative_filtering) with [Jaccard index](http://en.wikipedia.org/wiki/Jaccard_index) to determine similarities between items.

We've used open source gem [predictor](https://github.com/Pathgather/predictor) that implements fast and efficient recommendations and predictions using Ruby & Redis.

### Product sorting

Products in catalog are sorted by three counters:
- order count
- view count
- add count
