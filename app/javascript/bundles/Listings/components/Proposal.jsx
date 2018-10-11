import React from 'react';
import ListingsModal from './ListingsModal'
import axios from 'axios';

class Proposal extends React.Component{
  state = {
    approved: this.props.proposal.approved,
    modal: false,
  }

  approveProposal = (listing, proposal) => {
    axios.put(`/listings/${listing}/proposals/${proposal.id}.html`, {approved: !proposal.approved})
     this.toggle()
     this.setState({ approved: !this.state.approved})
  }

  toggle = () => {
    this.setState({
      modal: !this.state.modal
    });
  }

  render(){
    const { approved, modal } = this.state;
    if (!approved){
      return (
        <div>
          {`${this.props.user.first_name} wants to help you move!`}
          <ListingsModal
            user     = {this.props.user}
            listing  = {this.props.listing.id}
            proposal = {this.props.proposal}
            approveProposal = {this.approveProposal}
            modal = {modal}
            toggle = {this.toggle}
            />
        </div>
      )
    }
    else {
      return (
        <div>
          <h1 className="green">APPROVED</h1>
            <button onClick={ () => this.approveProposal(this.props.listing.id, this.props.proposal)}>Shitty Button</button>
        </div>
      )
    }
  }
}



export default Proposal;
