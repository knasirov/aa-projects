class Router {
  constructor (node, routes) {
    this.node = node;
    this.routes = routes;
  }

  start() {
    const that = this;
    window.addEventListener("hashchange", () => {
      that.render();
    });
    that.render();
  }

  activeRoute() {
    let myHash = window.location.hash.slice(1);
    return this.routes[myHash];
  }

  render() {
    // this.node.innerHTML = "";
    let component = this.activeRoute();
    if (component === undefined) {
      this.node.innerHTML = "";
    } else {
      this.node.innerHTML = "";
      let renderNode = component.render();
      this.node.appendChild(renderNode);
    }
  }
}

module.exports = Router;
