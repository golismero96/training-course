import React,{useContext,useMemo} from 'react';
import {useLangContext} from '../contexts/LanguageContext';


const Button = () => {
    // provider
    const [state,dispatch] = useLangContext()
    const memo = useMemo(()=>{
        return{
            language:state.language
        }
    },[state.language])
    // Consumer
    console.log('button',memo)
    const renderSubmit = () => {
        return memo.language === 'english' ? 'Submit'+state.test : 'بفرست'+state.test
    }
    return (
        <button className="button ui primary">
            {renderSubmit()}
        </button>
    );
};

// Button.contextType = LanguageContext

export default Button;