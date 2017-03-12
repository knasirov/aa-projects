import React from 'react';
import ReactDOM from 'react-dom';

import Root from './components/root';
import configureStore from './store/store';

// import { signup, login, logout } from './util/session_api_util';
import { login, receiveCurrentUser } from './actions/session_actions';

window.receiveCurrentUser = receiveCurrentUser;
// window.signup = signup;
window.login = login;
// window.logout = logout;

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  window.store = store;
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});
