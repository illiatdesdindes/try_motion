# Testing the motion gem

the [motion](https://github.com/unabridged/motion) gem allows you to build reactive, real-time frontend UI components in your Rails application using pure Ruby. It leverages the [ViewComponent](https://github.com/github/view_component) library augmenting it with realtime behavior through ActionCable.

## Install and run
```
git clone
bundle install
yarn install
bin/rails s
```

Open 2 browser windows to http://localhost:3000 create/edit/remove some todos in one window. The TopTodos comporent on the index page should reflect those changes.