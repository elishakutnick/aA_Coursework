import React from 'react';
import TodoListItem from '../todo_list/todo_list_item';
import TodoForm from '../todo_list/todo_form';

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
                <TodoForm receiveTodo={this.props.receiveTodo} />
            </>
        )
    }
} 