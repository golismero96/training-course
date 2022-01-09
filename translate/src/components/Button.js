import React, {useContext} from 'react';
import LanguageContext from '../contexts/LanguageContext';


const Button = () => {
    const things = useContext(LanguageContext)
    console.log(things)
    return (
        <button className="button ui primary">
            Submit
        </button>
    );
};

// Button.contextType = LanguageContext

export default Button;