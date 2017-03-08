import React from 'react';
import ReactDOM from 'react-dom';

import { receiveTodos, receiveTodo } from './actions/todo_actions';
import rootReducer from './reducers/root_reducer';
import { allTodos } from './reducers/selectors';

import configureStore from './store/store';
import Root from './components/root';

import { fetchTodos } from './actions/todo_actions';


document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  const content = document.getElementById("content");
  ReactDOM.render(<Root store={store} />, content);
});

window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;
window.rootReducer = rootReducer;
const store = configureStore();
window.store = store;
window.allTodos = allTodos;
window.fetchTodos = fetchTodos;
