import React, { Component } from 'react';
import axios from 'axios';

export default class Messages extends Component {

  constructor(){
    super()
    window.messages = this;
    this.state = {
      messages: [], message: ''
    }
  }

  fetchMessages = () => {
    const { user } = this.props;
    axios.get(`/users/${user.id}/messages.json`)
      .then((response) => {
        this.setState({ messages: response.data, message: '' })
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
                <div className='collection' key={message.id}>
                  <div className='chat-individual-message-box collection-item' key={message.id}>
                    <img src="/images/avatar-placeholder.png" alt="Profile avatar picture" className="chat-avatar-image" />
                    <span className="chat-message-timestamp">
                      {Date(message.created_at)}
                    </span>
                    <div className='chat-message'>
                      {message.sender.first_name}: {message.content}
                    </div>
                </div>
              </div>
              )
            })
          }
        </div>
        <form className='container footer-input' onSubmit={this.handleSubmit}>
          <div className="row text-input-box">
            <div className='input-field col s12'>
              <input
                type="text"
                className="form-control chat-input-box"
                value={this.state.message}
                onChange={this.handleMessageChange}
                placeholder="Type your message"
                />
            </div>
          </div>
        </form>
      </div>
    )
  }

  componentDidMount(){
    this.fetchMessages();
  }
}
