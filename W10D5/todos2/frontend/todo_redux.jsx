import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store.js';
import { receiveTodos, receiveTodo } from './actions/todo_actions';
import  { allTodos }  from './reducers/selectors'

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('content');

  const store = configureStore();
  ReactDOM.render(<Root store={store}/>, root);


  //window stuff
  window.store = store;
  window.receiveTodos = receiveTodos;
  window.receiveTodo = receiveTodo;
  window.allTodos = allTodos;
});
