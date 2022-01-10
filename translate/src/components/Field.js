import React, {useContext} from 'react';
import LanguageContext from '../contexts/LanguageContext';


const Field = () => {
    // provider
    // const lang = useContext(LanguageContext)
    // {value === 'english' ? 'Name' : 'نام'}
    
    // Consumer
    const renderLabel = (value) => {
        return value === 'english' ? 'Name' : 'نام'
    }
    return (
        <div className='ui field'>
            <label htmlFor="name">    
                <LanguageContext.Consumer>
                    {(value) => renderLabel(value)}
                </LanguageContext.Consumer>
            </label>
            <input id="name" className="input ui info" />
        </div>
    );
};


export default Field;