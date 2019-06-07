const { ensure, Exists } = require('../ensure');

const error = 'Identifier must have a <name> prop.';

module.exports = function Identifier(props, j) {
  const matcher = function(node) {
    const { name } = props;
    return name ? node.name === name : true;
  };
  matcher.type = 'Identifier';
  matcher.toAST = function() {
    const { name } = props;
    ensure(Exists(name), error);
    return j.identifier(props.name);
  };

  return matcher;
}
