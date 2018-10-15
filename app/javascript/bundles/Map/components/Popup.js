import React, { Component } from 'react';


export default class Popup extends Component {
  render() {
    return (
      <div className="map-popup">
        <p><strong>{this.props.listing.description}</strong></p>
      </div>
    )
  }
}
