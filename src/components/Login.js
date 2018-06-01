import React, { Component } from "react";

// this is a sample username and password to test the login
const username = "JohnB"
const password = "password"

class Login extends Component {
  state = {
    username: '',
    password: ''
  }
  handleSubmit = (e) => {
    e.preventDefault()
    console.log('state: ', this.state)
    if (this.state.username === username && this.state.password === password) {
      this.props.history.push("/patients");
    }
  }
  render() {
    return <div>
      <h2>Alfred</h2>
      <h2>Login page</h2>
      <form onSubmit={this.handleSubmit}>
        <div class="form-group">
          <label for="username">User name:</label>
          <input 
            type="text" 
            class="form-control" 
            onChange={(e) => this.setState({ username: e.target.value })}
            value={this.state.username}
          />
        </div>
        <div class="form-group">
          <label for="password">Password:</label>
          <input 
            type="password" 
            class="form-control" 
            onChange={(e) => this.setState({ password: e.target.value })}
            value={this.state.password}
          />
        </div>
        <button type="submit" class="btn btn-default">
          Login
        </button>
      </form>
    </div>;
  }
}

export default Login;