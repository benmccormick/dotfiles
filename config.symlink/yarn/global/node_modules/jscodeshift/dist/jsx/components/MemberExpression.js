const { ensure, Exists, Length } = require('../ensure');
const { arrayEquals } = require('../util');

const existsError = 'MemberExpression must have children';
const lengthError = 'MemberExpression must have two children';

module.exports = function MemberExpression(props, j) {
  const matcher = function(node) {
    const { args, children } = props;
    const filters = [];
    if (args) {
      filters.push(ast => arrayEquals(args, ast.arguments));
    }
    if (children.length !== 0) {
      ensure(Length(children), 2, lengthError);
      filters.push(ast => (
        ast.object.type === children[0].type &&
        ast.property.type === children[1].type &&
        children[0](ast.object) &&
        children[1](ast.property)
      ));
    }
    return filters.every(filter => filter(node));
  };
  matcher.type = 'MemberExpression';
  matcher.toAST = function() {
    const { children } = props;
    ensure(Exists(children), existsError);
    ensure(Length(children), 2, lengthError);
    return j.memberExpression(
      children[0].toAST(),
      children[1].toAST()
    );
  }

  return matcher;
}
