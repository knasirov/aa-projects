import merge from 'lodash/merge';

import { RECEIVE_CURRENT_USER, RECEIVE_LOGOUT_SUCCESS,
        RECEIVE_ERRORS} from '../actions/session_actions'

const _nullUser = {
  currentUser: null,
  errors: []
}

const SessionReducer = (state = _nullUser, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      return {
        currentUser: action.currentUser,
        errors: []
      };
    case RECEIVE_LOGOUT_SUCCESS:
      return merge({}, _nullUser);
    case RECEIVE_ERRORS:
      return merge({}, state, {errors: action.errors});
    default:
      return state;
  }
};
