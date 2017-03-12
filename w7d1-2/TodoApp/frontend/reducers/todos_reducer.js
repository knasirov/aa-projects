import merge from 'lodash/merge';

import {
  RECEIVE_TODOS,
  RECEIVE_TODO,
  REMOVE_TODO,
  UPDATE_TODO } from '../actions/todo_actions';

const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  },
};

const todosReducer = ( state = initialState, action ) => {
  Object.freeze(state);
  let nextState = merge({}, state);
  
  switch (action.type) {
    case RECEIVE_TODOS:
      nextState = {};
      action.todos.forEach( todo => nextState[todo.id] = todo);
      return nextState;
    case RECEIVE_TODO:
      let newTodo = {[action.todo.id]: action.todo};
      return merge({}, state, newTodo);
    case REMOVE_TODO:
      let removeId = action.todo.id;
      delete nextState[removeId];
      return nextState;
    case UPDATE_TODO:
      let updateId = action.todo.id;
      nextState[updateId].done = !nextState[updateId].done;
      return nextState;
    default:
      return state;
  }
};

export default todosReducer;
