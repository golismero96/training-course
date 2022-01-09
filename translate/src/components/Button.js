import React, {useContext} from 'react';
import LanguageContext from '../contexts/LanguageContext';


const Button = () => {
    const lang = useContext(LanguageContext)
    return (
        <button className="button ui primary">
            {lang === 'english' ? 'Submit' : 'بفرست'}
        </button>
    );
};

// Button.contextType = LanguageContext

export default Button;