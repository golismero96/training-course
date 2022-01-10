import React, {useContext} from 'react';
import LanguageContext from '../contexts/LanguageContext';
import Field from './Field';
import Button from './Button';
import {RtlDiv} from '../styled/userCreate.styled'


const UserCreate = () => {
    const lang = useContext(LanguageContext)
    return (
        <>
            {lang !== 'english' ? (
                <RtlDiv className="ui form">
                    <Field />
                    <Button />
                </RtlDiv>
            ) : (
                <div className='ui form'>
                    <Field />
                    <Button />
                </div>
            )}
        </>
    );
};

export default UserCreate;