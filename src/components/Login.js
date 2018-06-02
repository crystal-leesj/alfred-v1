import React, { Component } from "react";
import "../css/Login.css";

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
      this.props.history.push({
        pathname: "/patients",
        state: {
          username: this.state.username
        }
      });
    }
  }
  render() {
    return <div>
      <div class="jumbotron">
        <h1>Alfred</h1>
        <p>all in one web and cloud based Electronic Medical Record (EMR) application</p>
      </div>
      <form onSubmit={this.handleSubmit}>
        <div class="form-group">
          <label for="username" className="text">User name:</label>
          <input type="text" class="form-control" onChange={e => this.setState(
                { username: e.target.value }
              )} value={this.state.username} />
        </div>
        <div class="form-group">
          <label for="password" className="text">Password:</label>
          <input type="password" class="form-control" onChange={e => this.setState(
                { password: e.target.value }
              )} value={this.state.password} />
        </div>
        <button type="submit" class="btn btn-default btn-block">
          Login
        </button>
      </form>
    </div>;
  }
}

export default Login;