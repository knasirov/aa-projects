export const allTodos = (state) => {
  let todoIds = Object.keys(state.todos);
  let todos = todoIds.map(id => state.todos[id]);
  return todos;
};
