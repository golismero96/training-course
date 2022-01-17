import React, { useContext } from "react";
import LanguageContext from "../contexts/LanguageContext";

function LanguageSelector() {
  // const contextType = LanguageContext
  const [state, dispatch] = useContext(LanguageContext);

  const renderSubmit = () => {
    return state.language === "english"
      ? state.test
        ? "Hidden Submit"
        : "Show Submit"
      : state.test
      ? "مخفی کردن دکمه بفرست"
      : "نمایش دکمه بفرست";
  };

  const renderSubmit2 = () => {
    return state.language === "english" ? "Create Error" : "ایجاد ارور";
  };
  return (
    <div>
      <h3>
        {state.language === "english"
          ? "Select a language:"
          : "انتخاب یک زبان:"}
      </h3>
      <i
        className="flag us"
        onClick={() => dispatch({ type: "setlang", language: "english" })}
      />
      <i
        className="flag ir"
        onClick={() => dispatch({ type: "setlang", language: "persian" })}
      />
      |<hr />
      <button
        className="btn btn-outline-warning fs-6 fw-bold d-inline"
        onClick={() => dispatch({ type: "setTest", test: !state.test })}
      >
        {renderSubmit()}
      </button>
      <button
        className="btn btn-outline-danger d-inline fs-6 fw-bold m-3"
        style={{ marginTop: "7px" }}
        onClick={() => dispatch({ type: "setThrow", test: state.test })}
      >
        {renderSubmit2()}
      </button>
      <br />
      <br />
    </div>
  );
}

export default LanguageSelector;
