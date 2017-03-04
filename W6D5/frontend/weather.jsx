import React from 'react';
// import Root from 'root';

class Weather extends React.Component {
  constructor(location) {
    super(location);
    this.state = {currentLocation: ""};
    // console.log(location);
  }

  fetchWeather(location) {

  }

  // let location;
  // let getPos = navigator.geolocation.getCurrentPosition((pos) => {
  //   console.log(pos);
  //   location = pos;
  //   return pos;
  // });

  componentDidMount(){
    navigator.geolocation.getCurrentPosition(this.printLocation);
  }

  printLocation(pos){
    console.log(pos);
  }

  render() {
    // console.log(this.state.index);
    // let tabsTitles = this.tabs.map((tab, index) => (
    //   <h1 className="tabHeader" key={`${tab.title}`} onClick={this.setIndex.bind(this, index)}>{tab.title}</h1>
    // ));



    return (
      <div className="">
        "weather"
      </div>
    );
  }
}

export default Weather;
