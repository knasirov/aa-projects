import React from 'react';
import { uniqueId } from '../../util/utils';
import merge from 'lodash/merge';

const defaultState = {title: "", body: "", done: false};

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = defaultState;
    this.createTodo = this.createTodo.bind(this);
  };

  update(property) {
    return e => this.setState({[property]: e.target.value})
  }

  createTodo(e) {
    e.preventDefault();
    const todo = merge({}, this.state, {id: uniqueId()})
    this.props.receiveTodo(todo);
    this.state = defaultState;
  }


  render () {
    let { title, body } = this.state;
    return (
      <form onSubmit={this.createTodo}>
        <input
          type="text"
          placeholder="Title"
          value={title}
          onChange={this.update('title')}>
        </input>
        <br />
        <textarea
          placeholder="Body"
          value={body}
          onChange={this.update('body')}>
        </textarea>
        <br />
        <input type="submit" value="Create Todo"></input>
      </form>
    )
  }
}

export default TodoForm;
