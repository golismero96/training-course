import React, {useContext} from 'react';
import LanguageContext from '../contexts/LanguageContext';


const Field = () => {
    const lang = useContext(LanguageContext)
    return (
        <div className='ui field'>
            <label htmlFor="name">    
                {lang === 'english' ? 'Name' : 'نام'}
            </label>
            <input id="name" className="input ui info" />
        </div>
    );
};


export default Field;