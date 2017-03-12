import React from 'react';
import { Provider } from 'react-redux';
import { Router, IndexRoute, Route, hashHistory } from 'react-router';

import App from './app';
import SessionFormContainer from './session_form/session_form_container';

const Root = ({ store }) => (
  <Provider store={store}>
    <Router history={hashHistory}>
      <Route path="/" component={ App } >
        <Route path="/signup" component={ SessionFormContainer } />
        <Route path="/login" component={ SessionFormContainer } />
      </Route>
    </Router>
  </Provider>
);

export default Root;
