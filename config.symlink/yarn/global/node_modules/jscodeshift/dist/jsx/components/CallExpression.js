const { arrayEquals } = require('../util');
const { ensure, Exists, Length } = require('../ensure');

const existsError = 'CallExpression must have a child.';
const lengthError = 'CallExpression must have only one child';

module.exports = function CallExpression(props, j) {
  const matcher = function(node) {
    const { args, children } = props;
    const filters = [];
    if (args) {
      filters.push(ast => arrayEquals(args, ast.arguments));
    }
    if (children.length !== 0) {
      ensure(Length(props.children), 1, lengthError);
      filters.push(ast => (
        ast.callee.type === children[0].type &&
        children[0](ast.callee)
      ));
    }
    return filters.every(filter => filter(node));
  };

  matcher.type = 'CallExpression';
  matcher.toAST = function() {
    const { children } = props;
    ensure(Exists(children), existsError);
    ensure(Length(children), 2, lengthError);
    return j.callExpression(children[0].toAst());
  }

  return matcher;
}
