import React from 'react';
import ReactDOM from 'react-dom';

import Root from './components/root';
import configureStore from './store/store';

import { login, receiveCurrentUser } from './actions/session_actions';
import {fetchBenches} from './actions/bench_actions';

window.receiveCurrentUser = receiveCurrentUser;
window.login = login;
window.fetchBenches = fetchBenches;

document.addEventListener('DOMContentLoaded', () => {
  let store;
  if (window.currentUser) {
    const preloadedState = { session: { currentUser: window.currentUser }}
    store = configureStore(preloadedState)
  } else {
    store = configureStore();
  }
  window.store = store;
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});
