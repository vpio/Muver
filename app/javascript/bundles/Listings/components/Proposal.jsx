import React from 'react';
import ListingsModal from './ListingsModal'
import axios from 'axios';

class Proposal extends React.Component{

  constructor(props) {
    super(props)
    this.state = {
      approved: this.props.proposal.approved,
      modal: false,
      proposals: this.props.proposals
    }
  }

  async componentDidMount(listing) {
    // let data;
    // data = await axios.get(`/listings/1/proposals`)
    console.log(`data coming`)
    console.log(this.state.proposals)
  }

  approveProposal = (listing, proposal) => {
    axios.put(`/listings/${listing}/proposals/${proposal.id}.html`, {approved: !proposal.approved})
     this.toggle()
     this.setState({ approved: !this.state.approved})
  }

  deleteProposal(listing, proposal) {
    axios.delete(`/listings/${listing}/proposals/${proposal.id}`)
    location.reload()
    this.setState({ approved: this.state.approved })
  }

  toggle = () => {
    this.setState({
      modal: !this.state.modal
    });
  }

  // {`${this.props.user.first_name} wants to help you move!`}

  render(){
    const { approved, modal, proposals } = this.state;
    if (!approved){
      return (
        <div>
          {
            proposals.map(name => {
              return (
                <div key={name.id}>{`${name.first_name} wants to help you mnove`}</div>
              )
            })
          }
          <ListingsModal
            user     = {this.props.user}
            listing  = {this.props.listing.id}
            proposal = {this.props.proposal}
            approveProposal = {this.approveProposal}
            modal = {modal}
            toggle = {this.toggle}
            deleteProposal = {this.deleteProposal}
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
