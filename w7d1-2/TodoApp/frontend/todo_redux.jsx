import React from 'react';
import ReactDOM from 'react-dom';

import Root from './components/root';
import configureStore from './store/store';
import { receiveTodos, receiveTodo } from './actions/todo_actions';

window.store = configureStore;
window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodos;

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={configureStore} />, root);
})
