import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer.js';
import { thunkMiddleware } from '../middleware/thunk'

const configureStore = (preloadedState = {}) => {
    const store = createStore(rootReducer, preloadedState, applyMiddleware(thunkMiddleware));
    return store;
};


export default configureStore;