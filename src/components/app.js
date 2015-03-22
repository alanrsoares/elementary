import React from 'react';
import Hello from './hello';

export default class App extends React.Component {
  render(){
    return (
      <div className="app-container">
        <Hello name="Jucanildo" />
      </div>
    )
  }
}
