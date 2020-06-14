import React from 'react';
import { uniqueId } from '../../util/util.js'

class TodoForm extends React.Component { 
  constructor(props) { 
    super(props);
    this.state = {
      title: '',
      body: '',
      done: false,
      id: uniqueId()
    }
    
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
    this.updateDone = this.updateDone.bind(this);
  }

  updateTitle() { 
    this.setState({title: event.target.value});
  }

  updateBody() {
    this.setState({ body: event.target.value });
  }
  updateDone() {
    this.setState({ done: !(this.state.done)});
  }

  handleSubmit() { 
    event.preventDefault();
    this.props.receiveTodo(this.state);
    this.setState({
        title: '',
        body: '',
        done: false,
        id: uniqueId()
    });
  }

  render() { 
    return (
    //   <h1> Hello </h1>
      <form onSubmit={this.handleSubmit}>
        <h3>Add a ToDo</h3>
        <label>Title:
         <input
            type="text"
            value={this.state.title}
            onChange={this.updateTitle}/>
        </label>

        <label>Body:
         <input
            type="text"
            value={this.state.body}
            onChange={this.updateBody} />
        </label>

        <label>Done:
         <input
            type="checkbox"
            value={this.state.done}
            onClick={this.updateDone} />
        </label>

        <input type="submit" value='Add ToDo' />

      </form>
    )
  }

} 

export default TodoForm;