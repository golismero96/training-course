import React, { useContext, useReducer } from "react";

// export default React.createContext('english')
const initialState = {
  language: "english",
  ram_language: "english",
  test: true,
};
const reducer = (state, action) => {
  switch (action.type) {
    case "setlang": {
      if (action.language === "english" || action.language === "persian") {
        return { ...state, language: action.language };
      } else {
        alert("just languages: Persian and English");
        return { ...state, language: state.language };
      }
    }
    case "setRamlang":
      return { ...state, ram_language: action.ram_language };
    case "setTest":
      return { ...state, test: action.test };
    default:
      throw new Error("unexpected action type");
  }
};
const Context = React.createContext("english");
export function useLangContext() {
  return useContext(Context);
}

export const LanguageStore = (props) => {
  const value = useReducer(reducer, initialState);
  return (
    <div>
      <Context.Provider value={value}>{props.children}</Context.Provider>
    </div>
  );
};

export default Context;
