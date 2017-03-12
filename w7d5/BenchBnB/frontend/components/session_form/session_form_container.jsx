import { connect } from 'react-redux';

import SessionForm from './session_form';
import { login, signup } from '../../actions/session_actions';

const mapStateToProps = ({ session }, { location }) => ({
  loggedIn: !!session.currentUser,
  errors: session.errors,
  formType: location.pathname
});

const mapDispatchToProps = (dispatch, { location }) => {
  const fn = (location.pathname.slice(1) === 'login') ? login : signup;
  return {
    processForm: user => dispatch(fn(user))
  }
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(SessionForm);
