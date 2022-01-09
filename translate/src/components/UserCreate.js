import React, {useContext} from 'react';
import LanguageContext from '../contexts/LanguageContext';
import Field from './Field';
import Button from './Button';


const UserCreate = () => {
    const lang = useContext(LanguageContext)
    return (
        <div className={`ui form ${ lang !== 'english' && 'rtl' }`}>
            <Field />
            <Button />
        </div>
    );
};

export default UserCreate;