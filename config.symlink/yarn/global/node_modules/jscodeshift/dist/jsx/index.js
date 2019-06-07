const { createElement } = require('./util');
const components = require('./components');
const { ensure, Length } = require('./ensure');

const jsx = function(j) {
  jsx.createElement = createElement(j);
  j.registerMethods(
    {
      prop(key) {
        const nodes = this.nodes();
        ensure(Length(nodes), 1, `Function must be called on 1 node. Found: ${nodes.length}`);
        return nodes[0][key];
      },

      type() {
        return this.prop('type');
      },

      setProp(key, value) {
        this.nodes().forEach(node => {
          node[key] = value;
        });
        return this;
      }
    },
    j.Node
  );
};
Object.assign(jsx, components, {
  toAst(component) {
    return component.toAST();
  },
});

module.exports = jsx;
