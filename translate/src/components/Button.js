import React from 'react';
import LanguageContext from '../contexts/LanguageContext';


const Button = () => {
    // provider
    // const lang = useContext(LanguageContext)

    // Consumer
    const renderSubmit = (value) => {
        return value === 'english' ? 'Submit' : 'بفرست'
    }
    return (
        <button className="button ui primary">
            <LanguageContext.Consumer>
                {(value) => renderSubmit(value)}
            </LanguageContext.Consumer>
        </button>
    );
};

// Button.contextType = LanguageContext

export default Button;