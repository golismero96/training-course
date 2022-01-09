import React, { useState } from 'react';
import './App.css';

function App() {
  const [language, setLanguage] = useState('english')
  const onChangeLanguage = (lan) => {
    setLanguage(lan)
  }
  return (
    <div className="App">
      <div>
          Select a language:
          <i className="flag us" onClick={() => onChangeLanguage('english')} />
          <i className="flag ir" onClick={() => onChangeLanguage('persian')} />
      </div>
      <p>{language}</p>
    </div>
  );
}

export default App;
