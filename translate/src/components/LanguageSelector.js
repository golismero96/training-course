import React from 'react';
import PropTypes from 'prop-types';

// LanguageSelector.propTypes = {
//     onChangeLanguage
// };

function LanguageSelector(props) {
    return (
        <div>
          <h3>Select a language: </h3>
          <i className="flag us" onClick={() => props.onChangeLanguage('english')} />
          <i className="flag ir" onClick={() => props.onChangeLanguage('persian')} />
          <br />
          <br />
        </div>
    );
}

export default LanguageSelector;