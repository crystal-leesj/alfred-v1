import React, { Component } from "react";

class Login extends Component {
  constructor(){
    super();
  }
  render() {
    return <div>
      <h2>Alfred</h2>
      <h2>Login page</h2>
      <form>
        <div class="form-group">
          <label for="username">User name:</label>
          <input type="text" class="form-control" id="username" />
        </div>
        <div class="form-group">
          <label for="password">Password:</label>
          <input type="password" class="form-control" id="password" />
        </div>
        <button type="submit" class="btn btn-default">
          Login
        </button>
      </form>
    </div>;
  }
}

export default Login;