import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';

class TodoList extends React.Component {
  constructor(props)  {
    super(props)
  }

  render() {
    const { receiveTodo, todos, removeTodo, updateTodo } = this.props;
    const todoItems = todos.map( todo =>
      <TodoListItem key={todo.id} todo={todo}
        removeTodo={removeTodo}
        updateTodo={updateTodo}/>);
    return (
      <div>
        <ul>
          {todoItems}
        </ul>
        <TodoForm receiveTodo={receiveTodo} />
      </div>
    )
  };
}

export default TodoList;
