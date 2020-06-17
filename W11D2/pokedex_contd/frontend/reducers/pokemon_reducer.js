import { RECEIVE_ALL_POKEMON, RECEIVE_SINGLE_POKEMON } from "../actions/pokemon_actions";

const pokemonReducer = (state = {}, action) => { 
  Object.freeze(state);
  let newState = Object.assign({}, state);

  switch (action.type) { 
    case RECEIVE_ALL_POKEMON:
      // debugger;
      return action.pokemon;
    case RECEIVE_SINGLE_POKEMON:
      // no need to update
      return newState;
    default:
      return state;
  }
}

export default pokemonReducer;