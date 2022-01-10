import React from 'react';
import LanguageContext from '../contexts/LanguageContext'

function LanguageSelector() {
    const contextType = LanguageContext
    console.log(contextType)
    console.log("contextType")
    return (
        <div>
          <h3>Select a language: </h3>
          <i className="flag us" onClick={() => contextType.onChangeLanguage('english')} />
          <i className="flag ir" onClick={() => contextType.onChangeLanguage('persian')} />
          <br />
          <br />
        </div>
    );
}

export default LanguageSelector;