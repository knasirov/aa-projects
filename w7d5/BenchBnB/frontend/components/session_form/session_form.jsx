import React from 'react';
import merge from 'lodash/merge';
import { uniqueId } from '../../util/utils';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {username: "", password: ""};
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(property) {
    return e => this.setState({[property]: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.processForm(merge({}, this.state));
    this.state = {username: "", password: ""};
  }

  formType() {
    return this.props.formType.slice(1) === 'signup' ? "Sign up" : "Log in";
  }

  errors() {
    const { errors } = this.props;
    if (errors.length > 0) {
      return errors.map( (error, idx) => <li key={uniqueId() + idx}>{error}</li>);
    }
  }

  componentDidUpdate() {
    const { loggedIn, router } = this.props;
    if (loggedIn) {
      router.push("/");
    }
  }

  render () {
    const { username, password } = this.state;

    return (
      <div>
        <h1>{this.formType()}</h1>

        <ul>{this.errors()}</ul>

        <form onSubmit={this.handleSubmit}>
          <input
            placeholder="Username"
            value={username}
            onChange={this.update('username')}>
          </input>

          <input
            type="password"
            placeholder="Password"
            value={password}
            onChange={this.update('password')}>
          </input>

          <input type="submit" value={this.formType()}></input>
        </form>
      </div>
    )
  }
}

export default SessionForm;
