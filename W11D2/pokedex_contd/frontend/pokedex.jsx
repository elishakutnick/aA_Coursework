import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { HashRouter, Route } from "react-router-dom"; 

// Todo for testing purposes
// import * as APIUtil from './util/api_util';
// import * as Actions from './actions/pokemon_actions';
// import { selectAllPokemon } from './reducers/selectors';

// window.fetchAllPokemon = APIUtil.fetchAllPokemon;
// window.receiveAllPokemon = Actions.receiveAllPokemon;
// window.requestAllPokemon = Actions.requestAllPokemon;
// window.selectAllPokemon = selectAllPokemon;

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);

  // window.store = store;
});

