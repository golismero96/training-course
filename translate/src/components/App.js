import React, { useState } from 'react';
import LanguageContext from '../contexts/LanguageContext';
import UserCreate from './UserCreate';
import '../App.css'

function App() {
  const [language, setLanguage] = useState('english')
  const onChangeLanguage = (lan) => {
    setLanguage(lan)
  }
  return (
      <div>
          <h3>Select a language: </h3>
          <i className="flag us" onClick={() => onChangeLanguage('english')} />
          <i className="flag ir" onClick={() => onChangeLanguage('persian')} />
          <br />
          <br />
        <LanguageContext.Provider value={language}>
          <UserCreate />
        </LanguageContext.Provider>
      </div>
  );
}

export default App;
