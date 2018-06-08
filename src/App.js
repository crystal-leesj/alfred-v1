import React, { Component } from 'react';
import { BrowserRouter, Route, Switch } from "react-router-dom";

import Login from "./components/Login";
import PatientsList from "./components/PatientsList";
import PersonalInfo from "./components/PersonalInfo";

class App extends Component {
  render() {
    return <BrowserRouter>
        <div className="App">
          <Switch>
            <Route exact path="/" component={Login} />
            <Route exact path="/patients" component={PatientsList} />
            <Route exact path="/myinfo" component={PersonalInfo} />
          </Switch>
        </div>
      </BrowserRouter>;
  }
}

export default App;