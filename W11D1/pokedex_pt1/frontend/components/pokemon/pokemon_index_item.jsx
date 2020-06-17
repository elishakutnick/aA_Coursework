import React from 'react';
import { Link } from "react-router-dom";

const PokemonIndexItem = ({ pokemon }) => (
  <li >
    <img src={pokemon.imageUrl} width={20} height={20} />
    <Link to={`pokemon/${pokemon.id}`}>{pokemon.name}</Link>
  </li>
);

export default PokemonIndexItem;