import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock';

const items = [
  {title:'One', content:'This is number one'},
  {title:'Two', content:'This is number two'},
  {title:'Three', content:'This is number three'}


]



function Root() { 
  return(
    <div>
      <Clock/>
        
    </div>
  )
}


document.addEventListener('DOMContentLoaded', () => { 
  ReactDOM.render(<Root/>, document.getElementById('root'))
})