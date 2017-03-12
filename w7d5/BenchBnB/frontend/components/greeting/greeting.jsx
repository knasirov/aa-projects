import React from 'react';
import { Link } from 'react-router';

class Greeting extends React.Component {
  constructor(props) {
    super(props);
    this.logout = this.logout.bind(this);
  };

  logout(e) {
    e.preventDefault();
    this.props.logout();
  };

  render() {
    const { currentUser } = this.props;

    if (currentUser) {
      return (
        <div>
          <span>Welcome, {currentUser.username}!</span>
          <button onClick={this.logout}>Log out!</button>
        </div>
      )
    } else {
      return (
        <div>
          <Link to='/login'>Log In</Link>
          <br />
          <Link to='/signup'>Sign Up</Link>
        </div>
      )
    };
  };
};

export default Greeting;
