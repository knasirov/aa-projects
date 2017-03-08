import React from 'react';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);

    this.delete = this.delete.bind(this);
    this.status = this.status.bind(this);
    this.update = this.update.bind(this);
  }

  status() {
    return (this.props.todo.done) ? "Undo" : "Done";
  }

  update() {
    this.props.updateTodo(this.props.todo);
  }

  delete() {
    this.props.removeTodo(this.props.todo);
  }

  render() {
    // console.log(this.props);
    return (
      <li>{ this.props.todo.title }
        <button onClick={ this.update }>{ this.status() }</button>
        <br />
        <button onClick={ this.delete }>Delete</button>
        <br />
      </li>
    )
  }
}

export default TodoListItem;

//alternative
// const TodoListItem = props => (<li>{props.todo.title }</li>);
