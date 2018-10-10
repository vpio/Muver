import React, { Component } from 'react';
import mapboxgl from 'mapbox-gl';

export default class Map extends Component {

  render(){
    const style = {
      width:            '100%',
      height:           '500px',
      backgroundColor:  'azure'
    }
    return(
      <div
        style={style}
        ref={ el => this.mapContainer = el}
      />
    );
  }

  componentDidMount(){
    mapboxgl.accessToken = 'pk.eyJ1IjoiZGFuaWVsc2lsdmVyIiwiYSI6ImNqbjJvaXZ6aTR4b3kzeHFjZ3k2Y2gyY2MifQ.TEKJXzLLLfOj4wJsyHJO1A';
    this.map = new mapboxgl.Map({
      container: this.mapContainer,
      style: `mapbox://styles/mapbox/streets-v9`
    });
  }

  componentWillUnmount() {
    this.map.remove();
  }

}
