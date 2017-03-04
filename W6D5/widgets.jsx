import React from 'react';
import ReactDOM from 'react-dom';

import Tabs from './frontend/tabs.jsx';
import Weather from './frontend/weather.jsx';

let tabData = [{title: "one", content: "stuff"}, {title: "two", content: "stuffs"}, {title: "three", content: "stuffz"}];
let location = [1];
navigator.geolocation.getCurrentPosition((pos) => {
  // console.log(pos);
  location.push(pos);
  // console.log(location);
  return pos;
});

navigator.geolocation.getCurrentPosition( () => console.log(location));
// console.log(location);
// console.log(getPos());

// console.log(location);
document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById('root');
  const weather = document.getElementById('weather');
  ReactDOM.render(<Tabs tabs = {tabData} />, root);
  ReactDOM.render(<Weather location = {location}/>, weather);
});
