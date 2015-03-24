import React from 'react';

export default class Hello extends React.Component {

  static get propTypes() {
    return {
      name: React.PropTypes.string
    }
  }

  render(){
    return <h1>Hello, {this.props.name}!</h1>
  }
}
