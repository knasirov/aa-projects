import React from 'react';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
      done: false
    }

    this.addTodo = this.addTodo.bind(this);
  }

  update(property) {
    return e => this.setState({ [property]: e.target.value });
  }

  addTodo(e) {
    e.preventDefault();
    const todo = Object.assign({}, this.state);
    this.props.receiveTodo(todo);
    this.state = {
      title: "",
      body: ""
    }
  }

  render() {
    return (
      <form onSubmit={ this.addTodo }>
        <label>Title:
          <input
            type="text"
            value={this.state.title}
            onChange={this.update('title')}></input>
        </label>
        <br />
        <br />
        <label>Body:
          <textarea onChange={this.update('body')}></textarea>
        </label>
        <br />
        <button>Add Todo</button>
      </form>
    )
  }
}

export default TodoForm;
