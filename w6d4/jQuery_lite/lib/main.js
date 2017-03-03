const DOMNodeCollection = require("./dom_node_collection.js")

window.$l = (arg) => {
  switch (true) {
    case arg instanceof HTMLElement:
      let element = [arg];
      return new DOMNodeCollection(element);
      
    case typeof arg === 'string':
      let elementList = Array.from(document.querySelectorAll(arg));
      return new DOMNodeCollection(elementList);


    default:

  }
};
