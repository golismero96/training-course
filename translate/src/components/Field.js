import React, { useContext, useMemo } from "react";
import LanguageContext from "../contexts/LanguageContext";

const Field = () => {
  // provider
  const [state, dispatch] = useContext(LanguageContext);
  // Consumer
  const renderLabel = (value) => {
    return value === "english" ? "Name" : "نام";
  };
  const handleChange = (event) => {
    dispatch({
      type: "setRamlang",
      ram_language: event.target.value.toLowerCase(),
    });
  };
  return useMemo(() => {
    // console.log("field");
    return (
      <div className="ui field">
        <label htmlFor="name">{renderLabel(state.language)}</label>
        <select
          name="lan_name"
          id="language"
          className="form-control form-control-lg form-control-solid mb-3 mb-lg-0"
          placeholder="Language name"
          value={state.ram_language}
          onChange={(e) => handleChange(e)}
        >
          <option value="persian">Persian</option>
          <option value="english">English</option>
        </select>
      </div>
    );
  }, [state.language, state.ram_language]);
};

export default Field;
