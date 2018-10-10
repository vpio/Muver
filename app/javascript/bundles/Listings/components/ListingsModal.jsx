import React from 'react';
import { Button, Modal, ModalHeader, ModalBody, ModalFooter } from 'reactstrap';
import MiniProfile from './MiniProfile'

class ListingsModal extends React.Component {
  constructor(props) {
     super(props);
     this.state = {
       modal: false,
       user: this.props.user
     };

     this.toggle = this.toggle.bind(this);
   }

   toggle() {
     this.setState({
       modal: !this.state.modal
     });
   }

   render() {
     const { user } = this.state;
     return (
       <div>
         {console.log("hello", user)}
         <Button color="primary" onClick={this.toggle}>View Profile</Button>
         <Modal isOpen={this.state.modal} toggle={this.toggle} className={this.props.className}>
           <ModalHeader toggle={this.toggle}>Modal title</ModalHeader>
           <ModalBody>
             <MiniProfile
               user={user}
               />
           </ModalBody>
           <ModalFooter>
             <Button color="primary" onClick={this.toggle}>Do Something</Button>{' '}
             <Button color="secondary" onClick={this.toggle}>Cancel</Button>
           </ModalFooter>
         </Modal>
       </div>
     );
   }
}

export default ListingsModal;
