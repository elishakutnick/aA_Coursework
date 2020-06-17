import React from 'react';
import PokemonIndexItem from './pokemon_index_item';

export default class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render () {
    const pokedex = this.props.pokemon.map( pokemon => (
      <PokemonIndexItem key={pokemon.id} pokemon={pokemon} />
    ));
    return (
      <section className="pokedex">
        <ul>{pokedex}</ul>
      </section>
    )
  }
}