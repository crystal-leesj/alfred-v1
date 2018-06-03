import React, { Component } from "react";
import axios from "axios";
import "../css/Login.css";

// this is a sample username and password to test the login
// const username = "JohnB"
// const password = "password"
const url = 'http://35.197.17.218'

class Login extends Component {
  state = {
    username: '',
    password: '',
    errorMessage: ''
  }

  async componentWillMount(){
    const token = await localStorage.getItem("token");
    const username = await localStorage.getItem("username");
    if (token) {
      this.props.history.push({
        pathname: "/patients",
        state: {
          username: username,
          token
        }
      });
    }
  }

  handleSubmit = (e) => {
    e.preventDefault()
    console.log('state: ', this.state)
    axios.post(`${url}/auth/login`, {
      user_id: this.state.username,
      password: this.state.password
    })
      .then((res) => {
        console.log('res: ', res)
        const token = res.data.result.auth_token;
        localStorage.setItem("token", token);
        localStorage.setItem("username", this.state.username);
        this.props.history.push({
          pathname: "/patients",
          state: {
            username: this.state.username,
            token
          }
        });
      })
      .catch(error => {
        if (error.response.status === 401){
          this.setState({ errorMessage: 'Username and password is not matched' })
        }
        if (error.response.status === 500) {
          this.setState({ errorMessage: 'Something wrong with api server' })
        }
      })
  }
  render() {
    return <div>
      <div className="jumbotron">
        <h1>Alfred</h1>
        <p>
          all in one web and cloud based Electronic Medical Record (EMR)
          application
        </p>
      </div>
      <form onSubmit={this.handleSubmit}>
        <div className="form-group">
          <label className="text">
            Username:
          </label>
          <input type="text" className="form-control" onChange={e => this.setState(
                { username: e.target.value }
              )} value={this.state.username} />
        </div>
        <div className="form-group">
          <label className="text">
            Password:
          </label>
          <input type="password" className="form-control" onChange={e => this.setState(
                { password: e.target.value }
              )} value={this.state.password} />
        </div>
        <button type="submit" className="btn btn-default btn-block">
          Login
        </button>
        {this.state.errorMessage && <div className="text" style={{ color: '#990033', textAlign: "center" }}>{ this.state.errorMessage }</div>}
      </form>
    </div>;
  }
}

export default Login;