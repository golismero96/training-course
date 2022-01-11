import React, { useContext } from 'react';
import LanguageContext from '../contexts/LanguageContext'

function LanguageSelector() {
    // const contextType = LanguageContext
    const [state, dispatch] = useContext(LanguageContext)
    
    return (
        <div>
          <h3>Select a language: </h3>
          <i className="flag us" onClick={() => dispatch({type:'setlang',language:'english'})} />
          <i className="flag ir" onClick={() => dispatch({type:'setlang',language:'persian'})} />
          <i className="flag ir" onClick={() => dispatch({type:'setTest',test:!state.test})} />
          <br />
          <br />
        </div>
    );
}

export default LanguageSelector;