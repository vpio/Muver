import React from 'react';
import { css } from 'react-emotion';
// First way to import
import { RingLoader } from 'react-spinners';
// Another way to import

const override = css`
    display: block;
    margin: 0 auto;
    border-color: red;
`;

export default class AwesomeComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      loading: true
    }
  }
  render() {
    return (
      <div className='thank-you-animation'>
        <RingLoader
          className={override}
          sizeUnit={"px"}
          size={150}
          color={'#123abc'}
          loading={this.state.loading}
        />
      </div>
    )
  }
}
