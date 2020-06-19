import { connect } from 'react-redux';
import { logout } from '../actions/session_actions';
import Greeting from './greeting';
import React from 'react';
// const state = {
//   session: {
//     id: '1'
//   },
//   entities: {
//     users: {
//       '1': {
//         id: 1,
//         username: 'Elisha'
//       },
//       '2': {
//         id: 2,
//         username: 'Tim'
//       }
//     }
//   }
// }
// const mapStateToProps = ({ session, entities: { users } }) => { 
//   const sesionId = session.id // 1
//   currentUserInfo = users[sessionId]; // {id: 1, username: 'Elisha';}
//   return {
//     currentUser: currentUserInfo
//   }
// }

const mapStateToProps = ({ session, entities: { users } }) => {
  return {
    currentUser: users[session.id]
  };
};

const mapDispatchToProps = dispatch => ({
  logout: () => dispatch(logout())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Greeting);
