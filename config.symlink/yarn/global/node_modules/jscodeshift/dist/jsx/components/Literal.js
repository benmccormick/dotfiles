module.exports = function Literal(props, j) {
  const matcher = function(node) {
    return node.value === props.value;
  };
  matcher.type = 'Literal';
  matcher.toAST = function() {
    return j.literal(props.value);
  };

  return matcher;
}
