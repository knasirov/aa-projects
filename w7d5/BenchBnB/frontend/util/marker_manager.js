export default class MarkerManager {
  constructor(map) {
    this.map = map;
    this.markers = [];
  }

  updateMarkers(benches) {
    if (benches instanceof Array) {
      this._benchesToAdd(benches).forEach(
        bench => this._createMarkerFromBench(bench)
      );
    }
  }

  _benchesToAdd(benches) {
    return benches.filter( bench =>
      !(this.markers.map( marker => marker.benchId).includes(bench.id))
    );
  }

  _createMarkerFromBench(bench) {
    const latLng = {lat: bench.lat, lng: bench.lng};
    const marker = new google.maps.Marker({
      position: latLng,
      map: this.map,
      benchId: bench.id
    });
    this.markers.push(marker);
  }
}
