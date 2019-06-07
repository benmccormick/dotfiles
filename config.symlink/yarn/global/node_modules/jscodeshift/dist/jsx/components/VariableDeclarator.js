const { ensure, Exists, Length } = require('../ensure');

const existsError = 'VariableDeclarator must have children';
const lengthError = 'VariableDeclarator must have two children';

module.exports = function VariableDeclarator(props, j) {

  const matcher = function(node) {
    const { children } = props;
    const filters = [];
    if (children.length !== 0) {
      ensure(Length(children), 2, lengthError);
      filters.push(ast => (
        ast.id.type === children[0].TYPE &&
        ast.init.type === children[1].TYPE &&
        children[0].matches(ast.id) &&
        children[1].matches(ast.init)
      ));
    }
    return filters.every(filter => filter(node));
  };
  matcher.type = 'VariableDeclarator';
  matcher.toAST = function() {
    const { children } = props;
    ensure(Exists(children), existsError);
    ensure(Length(children), 2, lengthError);
    return j.variableDeclarator(
      children[0].toAST(),
      children[1].toAST()
    );
  };
  return matcher;
}
