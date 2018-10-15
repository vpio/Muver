import React, { Component } from 'react';
import mapboxgl from 'mapbox-gl';
import axios from 'axios';
import ReactDOMServer from 'react-dom/server'
import Popup from './Popup'

export default class Map extends Component {

  constructor() {
    super();
    this.state = {
      listings: []
    }
  }

  async componentDidMount(){
    // let {data} = await axios.get('/map.json')
    // console.log('hello world')
    // console.log(data.features)

    mapboxgl.accessToken = 'pk.eyJ1IjoiZGFuaWVsc2lsdmVyIiwiYSI6ImNqbjJvaXZ6aTR4b3kzeHFjZ3k2Y2gyY2MifQ.TEKJXzLLLfOj4wJsyHJO1A'
    let { coordinates, centerOnUser } = this.props;
    const mapOptions = {
      container: this.mapContainer,
      style: `mapbox://styles/mapbox/streets-v9`,
      zoom: 11.15,
      center: coordinates
    }
    const geolocationOptions = {
      enableHighAccuracy: true,
      maximumAge        : 30000,
      timeout           : 27000
    };
    if ("geolocation" in navigator && centerOnUser) {
      navigator.geolocation.getCurrentPosition(
        // success callback
        (position) => {
          coordinates = [
            position.coords.longitude,
            position.coords.latitude
          ];
          document.getElementById("long").innerHTML = coordinates[0];
          document.getElementById("lat").innerHTML = coordinates[1];
          mapOptions.center = coordinates;
          this.createMap(mapOptions, geolocationOptions);
        },
        // failure callback
        () => { this.createMap(mapOptions, geolocationOptions); },
        // options
        geolocationOptions
      );
    }else{
      this.createMap(mapOptions, geolocationOptions);
    }
  }
  // fetchTasks = () => {
  //   const map = this.map;
  //   const { lat, lng } = map.getCenter();
  //   axios.get(`/map.json?lat=${lat}&lng=${lng}`)
  //     .then((response) => { map.getSource('tasks').setData(response.data) })
  //     .catch((error) => { console.log(error) });
  // }


  createMap = (mapOptions, geolocationOptions) => {
    this.map = new mapboxgl.Map(mapOptions);
    const { map } = this;
    const { lat, lng } = map.getCenter();

    map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: geolocationOptions,
        trackUserLocation: true
      })
    );

    var nav = new mapboxgl.NavigationControl();
    map.addControl(nav, 'bottom-right');

    map.on('load', (event) => {
      this.fetchPlaces();
      map.on('moveend', (e) => {
        this.fetchPlaces();
      })
    })
  }

  async fetchPlaces() {
    const map = this.map;
    const self = this;
    const { lat, lng } = map.getCenter();
    let {data} = await axios.get(`/map.json`)
    data = data.features
    data.forEach((listing, i) => {
      let elm = document.createElement('div')
      elm.className = "mapbox-marker"
      let popup = new mapboxgl.Popup({ offset: 25 })
      .setHTML(
        `<a href="./listings/${listing.properties.id}">${listing.properties.description}</a>`
      )
      let marker = new mapboxgl.Marker(elm)
      .setLngLat(listing.geometry.coordinates)
      .setPopup(popup)
      marker.addTo(map)
    })
  }

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


  componentWillUnmount() {
    this.map.remove();
  }

}
