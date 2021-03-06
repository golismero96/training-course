import React, { useMemo } from "react";
import { useLangContext } from "../contexts/LanguageContext";
const Button = () => {
  const [state, dispatch] = useLangContext();
  // const clickConsole = () => {
  //   console.log("test");
  // };
  // useEffect(() => {
  //   window.addEventListener("click", clickConsole, true);
  //   console.log("monted");
  //   return () => {
  //     //    *******************create error in page for ErrorBoundary*******************
  //     // dispatch("ts");
  //     //    *******************create error in page for ErrorBoundary*******************
  //     window.removeEventListener("click", clickConsole, true);
  //     console.log("unmonted");
  //   };
  // }, [state.test]);
  const renderSubmit = () => {
    return state.language === "english" ? "Submit" : "بفرست";
  };
  const handleClick = () => {
    dispatch({ type: "setlang", language: state.ram_language });
  };
  return useMemo(() => {
    // console.log("button");
    return (
      <>
        <button className="button ui primary" onClick={handleClick}>
          {renderSubmit()}
        </button>
      </>
    );
  }, [state.language, state.ram_language]);
};

export default Button;
