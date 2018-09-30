import { createStore, applyMiddleware } from 'redux';
import { Provider } from 'react-redux';
import { render } from 'react-dom';
import React from 'react';
import thunkMiddleware from 'redux-thunk';

import initialState from './initialState';
import reducer from './reducers';
import HomePage from './pages/home-page/HomePage';
import './app.scss';

const store = createStore(
  reducer,
  initialState,
  applyMiddleware(thunkMiddleware)
);

render(
  <Provider store={store}>
    <HomePage />
  </Provider>,
  document.getElementById('root')
);