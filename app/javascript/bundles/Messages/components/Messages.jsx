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
                <ul className='collection' key={message.id}>
                  <li className='chat-individual-message-box collection-item avatar' key={message.id}>
                    <img src="//robohash.org/107378?set=set2&bgset=bg2&size=70x70" alt="107378" className="circle" />
                    <span className='chat-user-name'>
                      {message.sender.email}
                    </span>
                    <p>
                      <i className="prefix mdi-action-alarm" />
                      <span className="message-date">{message.sender.created_at}{"\n"}</span>
                      <div className='chat-message'>
                      {message.content}
                    </div>
                    </p>
                  </li>
                </ul>
              )
            })
          }
        </div>
        <form className='container footer-input' onSubmit={this.handleSubmit}>
          <div className="row">
            <div className='input-field col s10'>
              <i className="prefix mdi-communication-chat" />
              <input
                type="text"
                className="form-control chat-input-box"
                value={this.state.message}
                onChange={this.handleMessageChange}
                placeholder="Type your message"
                />
            </div>
            <div className="input-field col s2">
              <button type="submit" className="waves-effect waves-light btn-floating btn-large">
                <i className="mdi-content-send" />
              </button>
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
