import { connect } from 'react-redux';
import PokemonDetail from './pokemon_detail';
import { requestSinglePokemon } from '../../actions/pokemon_actions';
import { getItems } from '../../reducers/selectors';

const mapStateToProps = (state, ownProps) => { 
  return {
    id: this.ownProps.match.params.id,
    getItems: getItems
  }
}

const mapDispatchToProps = dispatch => ({
  requestSinglePokemon: id => dispatch(requestSinglePokemon(id))
})




export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);