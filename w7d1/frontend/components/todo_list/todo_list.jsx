import React from 'react';
import TodoListItem from './todo_list_item'

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const todos = this.props.todos;
    const items = todos.map(todo => (
      <TodoListItem todo={todo}
        key={todo.id} />
      )
    )

    return (
      <ul>
        {items}
      </ul>
    );
  }
}

export default TodoList;
