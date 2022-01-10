import React from 'react';
import {LanguageStore} from '../contexts/LanguageContext';
import UserCreate from './UserCreate';
import LanguageSelector from './LanguageSelector';
import '../App.css'

function App() {
  return (
      <div>
        <LanguageStore>
          <LanguageSelector/>
          <UserCreate />
        </LanguageStore>
      </div>
  );
}

export default App;
