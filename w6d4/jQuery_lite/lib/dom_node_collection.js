class DOMNodeCollection {
  constructor (array) {
    this.array = array;
  }

  html (string) {
    if (string === undefined) {
      return this.array[0].innerHTML;
    } else if (typeof string === 'string' ) {
      this.array.forEach( el => el.innerHTML = string );
    }
  }

  empty () { this.html(""); }

  append(arg) {
    let that = this;
    switch (true) {
      case arg instanceof HTMLElement:
        this.html(this.html() + arg.outerHTML);
        break;
      case typeof arg === 'string':
        this.html(this.html() + arg);
        break;
      case arg instanceof DOMNodeCollection:
        arg.array.forEach ( el => {
          that.html(that.html() + el.outerHTML);
        });
        break;
    }
  }


}

module.exports = DOMNodeCollection;
