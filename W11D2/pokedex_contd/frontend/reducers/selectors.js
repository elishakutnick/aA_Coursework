export const selectAllPokemon = state => Object.values(state.entities.pokemon);  


export const getItems = pokemon => Object.values(pokemon.items);