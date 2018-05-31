import React, { Component } from 'react';
import { BrowserRouter, Route, Switch } from "react-router-dom";

import Login from "./components/Login";

class App extends Component {
  render() {
    return (
      <BrowserRouter>
        <div className="App">
          <Switch>
            <Route path="/" component={Login} />
          </Switch>
        </div>
      </BrowserRouter>
    );
  }
}

export default App;