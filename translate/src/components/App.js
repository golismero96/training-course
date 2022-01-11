import React from "react";
import { LanguageStore } from "../contexts/LanguageContext";
import UserCreate from "./UserCreate";
import LanguageSelector from "./LanguageSelector";
import ErrorBoundary from "./ErrorBoundary";
import "../App.css";

function App() {
  return (
    <div>
      <ErrorBoundary>
        <LanguageStore>
          <LanguageSelector />
          <UserCreate />
        </LanguageStore>
      </ErrorBoundary>
    </div>
  );
}

export default App;
