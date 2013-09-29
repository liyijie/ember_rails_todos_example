# http://emberjs.com/guides/models/defining-a-store/

Todos.Store = DS.Store.extend
  revision: 11
  adapter: DS.RESTAdapter.create()

