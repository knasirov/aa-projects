import { createStore, applyMiddleware } from 'redux';
import checkType from '../middleware/thunk';
import rootReducer from '../reducers/root_reducer';

const configureStore = () => createStore(rootReducer, {}, applyMiddleware(checkType));

export default configureStore;
