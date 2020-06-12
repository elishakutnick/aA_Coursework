import React from 'react';
import TodoListItem from '../todo_list/todo_list_item';
export default class TodoList extends React.Component {
    constructor(props){
        super(props);
    }
  render() {
    const todos = this.props.todos.map(todo => { 
      return <TodoListItem key={todo.id} todo={todo} />
    });
        return (
            <>
                <h3>Todo List goes here!</h3>
                <ul>
                    {todos}
                </ul>
            </>
        )
    }
} 