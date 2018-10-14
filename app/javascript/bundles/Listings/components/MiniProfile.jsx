import React from 'react';

const MiniProfile = props => {
  return (
    <div>
      <h1>{ `${props.user.first_name}'s Profile` }</h1>
      <img src={props.avatar} className='card-img-top'/>
      <div className='card border-primary mb-3 card-shadow' >
      <div className='card-header'>{props.user.email}</div>
      <a href={`/users/${props.user.id}`} className='card-header'>View Full Profile</a>

        {  /*/{ <%= image_tag @user.avatar, class: "card-img-top" if @user.avatar.attached? %> */}
      </div>
    </div>
  )
}

export default MiniProfile;
