import React from 'react';
import ReactDOM from 'react-dom';
import store from './store/store.js'
import {allTodos} from './reducers/selectors'
import Root from './components/root'

window.store = store;
window.allTodos = allTodos(store.getState());

document.addEventListener("DOMContentLoaded", () => {
  const content = document.getElementById('content');
  ReactDOM.render(<Root store={store}/>, content);
});
