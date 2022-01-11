import React, { useContext } from "react";
import LanguageContext from "../contexts/LanguageContext";

const Field = () => {
  // provider
  const [state, _] = useContext(LanguageContext);
  console.log("field");
  // Consumer
  const renderLabel = (value) => {
    return value === "english" ? "Name" : "نام";
  };
  return (
    <div className="ui field">
      <label htmlFor="name">{renderLabel(state.language)}</label>
      <input id="name" className="input ui info" />
    </div>
  );
};

export default Field;
