import React, { Component } from "react";
import moment from "moment";
import axios from "axios";

const url = "http://35.197.17.218";

class PersonalInfo extends Component {
    state = {
        patients: null,
    }
    componentDidMount() {
        // error handling. if someone trys to go /paitents then it will send back to login page
        if (!this.props.location.state) return this.props.history.push("/");

        const { token } = this.props.location.state;
        const config = { headers: { Authorization: `Bearer ${token}` } }
        axios.post(`${url}/api/records`, null, config)
            .then((res) => {
                console.log("results: ", res.data.result.records);
                this.setState({
                  patients: res.data.result.records
                });
            })
            .catch(error => {
                // if the token expires, it will send back to login page
                if (error.response.status === 401) {
                    this.props.history.push("/");
                }
            })
    }
    loggingOut = async () => {
        await localStorage.removeItem("token")
        this.props.history.push("/")
    }
    render() {
        if (!this.state.patients) return <div>Loading...</div>
        return <div>
            <nav className="navbar navbar-inverse">
              <div className="container-fluid">
                <div className="navbar-header">
                  <p className="navbar-brand">Alfred</p>
                </div>
                <ul className="nav navbar-nav">
                  <li>
                    <a href="null">
                      {moment().format("YYYY-MM-DD h:mm a")}
                    </a>
                  </li>
                </ul>
                <ul className="nav navbar-nav navbar-right">
                  <li>
                    <form className="navbar-form navbar-left" action="/action_page.php">
                      <div className="input-group">
                        <input type="text" className="form-control" placeholder="Search" name="search" />
                        <div className="input-group-btn">
                          <button className="btn btn-default" type="submit">
                            <i className="glyphicon glyphicon-search" />
                          </button>
                        </div>
                      </div>
                    </form>
                  </li>
                  <li className="active">
                    <a href="null">
                      {this.props.location.state.username}
                    </a>
                  </li>
                  <li>
                    <a onClick={this.loggingOut}>
                      <span className="glyphicon glyphicon-log-in" /> Logout
                    </a>
                  </li>
                </ul>
              </div>
            </nav>
            <div />
            <h2 className="text">My Info</h2>
            <div className="background-container">
              <table className="table table-striped">
                <thead>
                  <tr>
                    <th>Firstname</th>
                    <th>M.l.</th>
                    <th>Lastname</th>
                    <th>sex</th>
                    <th>DOD</th>
                    <th>ssn</th>
                  </tr>
                </thead>
                <tbody>
                  {this.state.patients.map(patient => <tr>
                        <td>{patient.first_name}</td>
                        <td>{patient.middle_initial}</td>
                        <td>{patient.last_name}</td>
                        <td>{patient.sex}</td>
                        <td>{patient.dob}</td>
                        <td>{patient.ssn}</td>
                    </tr>)}
                </tbody>
              </table>
            </div>
          </div>;
    }
}

export default PersonalInfo;