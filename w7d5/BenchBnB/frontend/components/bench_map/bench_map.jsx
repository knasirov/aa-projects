import React from 'react';

import MarkerManager from '../../util/marker_manager';

class BenchMap extends React.Component {
  constructor(props) {
    super(props)
  }

  componentDidMount() {
    const mapOptions = {
      center: { lat: 37.7758, lng: -122.435 }, // this is SF
      zoom: 13
    };
    this.map = new google.maps.Map(this.mapNode, mapOptions);
    this.MarkerManager = new MarkerManager(this.map);
    this.MarkerManager.updateMarkers(this.props.benches);
  }

  componentWillReceiveProps(newProps) {
    this.MarkerManager.updateMarkers(newProps.benches);
  }

  render() {
    return (
      <div id="map-container" ref={ map => this.mapNode = map }>

      </div>
    )
  }
};

export default BenchMap;
