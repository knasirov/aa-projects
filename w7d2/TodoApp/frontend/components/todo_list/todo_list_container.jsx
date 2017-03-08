import { connect } from 'react-redux';
import TodoList from './todo_list';

import { receiveTodos,
        receiveTodo,
        removeTodo,
        updateTodo,
        fetchTodos } from '../../actions/todo_actions';

import { allTodos } from '../../reducers/selectors';

const mapStateToProps = state => ({
  todos: allTodos(state)
});

const mapDispatchToProps = dispatch => ({
  receiveTodo: (todo) => dispatch(receiveTodo(todo)),
  removeTodo: (todo) => dispatch(removeTodo(todo)),
  updateTodo: (todo) => dispatch(updateTodo(todo)),
  fetchTodos: () => dispatch(fetchTodos())
});

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);
