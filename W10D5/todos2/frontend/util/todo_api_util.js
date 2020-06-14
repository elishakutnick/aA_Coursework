export const fetchToDos = () => {
    return $.ajax({
        method: 'get',
        url: 'api/todos'
    })
}