import React, { useState } from 'react'

// export default React.createContext('english')

const Context = React.createContext('english')



export const LanguageStore = (props)  => {
    const [language, setLanguage] = useState('english')
    const onChangeLanguage = (language) => {
      setLanguage(language)
    }
    return (
        <div>
            <Context.Provider value={{...language, onChangeLanguage:onChangeLanguage}}>
                {props.children}
            </Context.Provider>
        </div>
    );
}

export default Context