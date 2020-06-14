
export const allTodos = (state) => {
    const todos = Object.keys(state.todos).map(key => state.todos[key]);
    return todos;
}
