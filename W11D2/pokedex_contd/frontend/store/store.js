import { createStore, applyMiddleware } from 'redux';
// import thunk from 'redux-thunk';
import myThunk from '../middleware/thunk';
import logger from 'redux-logger'
import rootReducer from '../reducers/root_reducer';

const configureStore = () => (
  createStore(rootReducer, applyMiddleware(myThunk, logger))
);

export default configureStore; 

