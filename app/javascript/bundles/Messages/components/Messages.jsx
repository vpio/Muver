import React, { Component } from 'react';
import axios from 'axios';

export default class Messages extends Component {

  constructor(){
    super()
    window.messages = this;
    this.state = { messages: [], message: '' }
  }

  fetchMessages = () => {
    const { user } = this.props;
    axios.get(`/users/${user.id}/messages.json`)
      .then((response) => {
        this.setState({ messages: response.data, message: '' })
      })
  }

  handleSubmit = (e) => {
    e.preventDefault();
    const { user } = this.props;
    const { message } = this.state;
    axios.post(`/users/${user.id}/messages.json`, {
      message: {content: message}
    }, {
      headers: { 'Content-Type': 'application/json' }
    }).then((response) => {
      console.log(response.data)
      this.fetchMessages();
    })
  }

  handleMessageChange = (e) => {
    const message = e.target.value;
    this.setState({ message });
  }

  render(){
    const { messages } = this.state;
    return(
      <div className='chat'>
        <div className='chat-message-box'>
          {
            messages.map((message) => {
              return(
                <div className='chat-individual-message-box' key={message.id}>
                  <div className='chat-user-name'>
                    {message.sender.email}:
                  </div>
                  <div className='chat-message'>
                    {message.content}
                  </div>
                </div>
              )
            })
          }
        </div>
        <div className='chat-input-box'>
          <form onSubmit={this.handleSubmit}>
            <input
              type="text"
              className="form-control"
              value={this.state.message}
              onChange={this.handleMessageChange}
            />
          </form>
        </div>
      </div>
    )
  }

  componentDidMount(){
    this.fetchMessages();
  }

}
