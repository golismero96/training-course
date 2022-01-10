import React, { useState } from 'react';
import LanguageContext from '../contexts/LanguageContext';
import UserCreate from './UserCreate';
import LanguageSelector from './LanguageSelector';
import '../App.css'

function App() {
  const [language, setLanguage] = useState('english')
  const onChangeLanguage = (lan) => {
    setLanguage(lan)
  }
  return (
      <div>
          <LanguageSelector onChangeLanguage={onChangeLanguage} />
        <LanguageContext.Provider value={language}>
          <UserCreate />
        </LanguageContext.Provider>
      </div>
  );
}

export default App;
