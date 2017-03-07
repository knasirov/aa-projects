import React from 'react';
// import Root from 'root';

class Tabs extends React.Component {
  constructor(tabs) {
    super(tabs);
    this.tabs = tabs.tabs;
    this.state = {index: 0};
  }

  setIndex(idx){
    this.setState({index: idx});
  }

  render() {
    let tabsTitles = this.tabs.map((tab, index) => (
      <h1 className="tabHeader" key={`${tab.title}`} onClick={this.setIndex.bind(this, index)}>{tab.title}</h1>
    ));

    return (
      <div className="tabWidget">
        <ul className="titles">
          {tabsTitles}
        </ul>
        <article className="content">
          {this.tabs[this.state.index].content}

        </article>
      </div>
    );
  }
}

export default Tabs;
