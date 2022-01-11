import React, { useContext, Suspense } from "react";
import LanguageContext from "../contexts/LanguageContext";
import { RtlDiv } from "../styled/userCreate.styled";
const FieldLazy = React.lazy(() => import("./Field"));
const ButtonLazy = React.lazy(() => import("./Button"));
const UserCreate = () => {
  const [state, _] = useContext(LanguageContext);

  return (
    <>
      <Suspense fallback={<div>Loading...</div>}>
        <RtlDiv className="ui form">
          <FieldLazy />
          {state.language == "persian" && <ButtonLazy />}
        </RtlDiv>
      </Suspense>
    </>
  );
};

export default UserCreate;
