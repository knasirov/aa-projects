import { signup, login, logout } from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const RECEIVE_LOGOUT_SUCCESS = "RECEIVE_LOGOUT_SUCCESS";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";

export const receiveCurrentUser = (currentUser) => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
});

export const receiveLogoutSuccess = () => ({
  type: RECEIVE_LOGOUT_SUCCESS
});

export const receiveErrors = (errors) => ({
  type: RECEIVE_ERRORS,
  errors
});

export const requestSignup = (user) => dispatch => {
  return signup(user).then(res => dispatch(receiveCurrentUser(res)))
  .fail(res => dispatch(receiveErrors(res.responseJSON)));
};

export const requestLogin = (user) => dispatch => {
  return login(user).then(res => dispatch(receiveCurrentUser(res)))
                    .fail(res => dispatch(receiveErrors(res.responseJSON)));
};

export const requestLogout = () => dispatch => {
  return logout().then( (res) => dispatch(console.log(res)))
                .then( () => dispatch(receiveLogoutSuccess()))
                .fail(res => dispatch(receiveErrors(res.responseJSON)));
};
