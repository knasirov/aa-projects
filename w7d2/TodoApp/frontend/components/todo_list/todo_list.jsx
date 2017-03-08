import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';


class TodoList extends React.Component {
  constructor(props) {
    super(props)
  }

  componentDidMount() {
    this.props.fetchTodos();
  };

  render() {
    const { removeTodo, updateTodo, receiveTodo, todos } = this.props
    return (
      <div>
        <ul>
          { todos.map((todo, idx) => (
              // <li key={ idx }>{ todo.title }</li>
            <TodoListItem key={ idx } todo={ todo } removeTodo={ removeTodo }
                          updateTodo= {updateTodo}/>
          )) }
        </ul>
        <TodoForm receiveTodo={ receiveTodo } />
      </div>
    );
  }
};

export default TodoList;
