import React, { useState } from 'react';
import UserCreate from './UserCreate';

function App() {
  const [language, setLanguage] = useState('english')
  const onChangeLanguage = (lan) => {
    setLanguage(lan)
  }
  return (
      <div>
          Select a language: 
          <i className="flag us" onClick={() => onChangeLanguage('english')} />
          <i className="flag ir" onClick={() => onChangeLanguage('persian')} />
      <UserCreate />
      </div>
  );
}

export default App;
