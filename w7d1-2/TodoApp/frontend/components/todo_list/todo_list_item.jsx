import React from 'react';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    console.log(this.props);
    this.delete = this.delete.bind(this);
    this.getStatus = this.getStatus.bind(this);
    this.update = this.update.bind(this);
  }

  getStatus() {
    return this.props.todo.done
  };

  update(e) {
    e.preventDefault();
    this.props.updateTodo(this.props.todo);
  };

  delete(e) {
    e.preventDefault();
    this.props.removeTodo(this.props.todo);
  };

  render () {
    const status = this.getStatus() ? "Undo" : "Mark Done";
    return (<li>
      {this.props.todo.title}
      <button onClick={this.update}>
        {status}
      </button>
      <button onClick={this.delete}>
        Delete
      </button>
    </li>)
  }
}

export default TodoListItem;
