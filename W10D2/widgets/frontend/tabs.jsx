import React from 'react'


export default class Tabs extends React.Component {

    constructor(props) {
    super(props);
    this.state = {
        selectedItems: 0
    }

    render() {
      <div>
          <h1>Tabs</h1>
          <header>
          <ul>
                  <li title = {this.props.title}>Title</li>
          </ul>
          </header>

      </div>
      
    
    }


}