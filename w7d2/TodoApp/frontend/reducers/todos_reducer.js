import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO, UPDATE_TODO } from '../actions/todo_actions';
import merge from 'lodash/merge';

const initialState = {
  1: {
    id: 1,
    title: "read book",
    body: "Memories, Dreams, and Reflections by C.G. Jung",
    done: false
  },
  2: {
    id: 2,
    title: "respond to emails",
    body: "dinner with friend",
    done: true
  }
};

function uniqueId() {
  return new Date().getTime();
}

const todosReducer = (state = initialState, action) => {
  let nextState;
  let newTodo;
  switch(action.type) {
    case RECEIVE_TODOS:
      nextState = {};
      action.todos.forEach(todo => { nextState[todo.id] = todo });
      return nextState;
    case RECEIVE_TODO:
      newTodo = { [uniqueId()]: action.todo };
      nextState = merge({}, state, newTodo);
      return nextState;
    case REMOVE_TODO:
      let deleteObj = action.todo.id;
      nextState = merge({}, state);
      delete nextState[deleteObj];
      return nextState;
    case UPDATE_TODO:
      nextState = merge({}, state);
      newTodo = action.todo;
      nextState[newTodo.id].done = !nextState[newTodo.id].done;
      return nextState;
    default:
      return state;
  }
};

export default todosReducer;
