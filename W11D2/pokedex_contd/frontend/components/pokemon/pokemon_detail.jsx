import React from 'react';

// items Component
// PokemonDetailItem

// pokemon detail Component
// PokemonDetailInfo

class PokemonDetail extends React.Component { 
  // access to match.params.id
  constructor(props) {
    super(props)
    this.state = { pokemon: {} }
  }

  componentDidMount() {
    this.props.requestSinglePokemon(this.props.id)
      .then( pokemon => this.setState({ pokemon }) )
  }

  render() {
    const items = this.props.getItems(this.state.pokemon);
    const pokemon = this.state.pokemon.pokemon;

    let itemsContainers = items.map(item => <PokemonDetailItem item={item}/>)
    return (
      <>
        <ul>
          <PokemonDetailInfo pokemon={pokemon}/>
        </ul>

        <ul>
          {itemsContainers}
        </ul>
      </>
    )
  }
}


export default PokemonDetail; 