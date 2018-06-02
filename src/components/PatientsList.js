import React, { Component } from "react";
import moment from "moment";

class PatientsList extends Component {

    render() {
        return <div>
            <nav class="navbar navbar-inverse">
              <div class="container-fluid">
                <div class="navbar-header">
                  <p class="navbar-brand">Alfred</p>
                </div>
                <ul class="nav navbar-nav">
                  <li>
                    <a href="#">
                      {moment().format("YYYY-MM-DD h:mm a")}
                    </a>
                  </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                  <li>
                    <form class="navbar-form navbar-left" action="/action_page.php">
                      <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search" name="search" />
                        <div class="input-group-btn">
                          <button class="btn btn-default" type="submit">
                            <i class="glyphicon glyphicon-search" />
                          </button>
                        </div>
                      </div>
                    </form>
                  </li>
                  <li class="active">
                    <a href="#">{this.props.location.state.username}</a>
                  </li>
                  <li>
                    <a href="#">
                      <span class="glyphicon glyphicon-log-in" /> Logout
                    </a>
                  </li>
                </ul>
              </div>
            </nav>
            <div />
            <h2 className="text">List of Patients</h2>
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Patient ID</th>
                  <th>Firstname</th>
                  <th>Lastname</th>
                  <th>sex</th>
                  <th>DOD</th>
                  <th>ssn</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                    <td>13WX78KS011</td>
                    <td>Amanda</td>
                    <td>Taylor</td>
                    <td>Female</td>
                    <td>02/11/1972</td>
                    <td>123-45-6789</td>
                </tr>
                <tr>
                    <td>13WX78KS011</td>
                    <td>Mike</td>
                    <td>Simon</td>
                    <td>Male</td>
                    <td>10/03/1988</td>
                    <td>123-45-6789</td>
                </tr>
                <tr>
                    <td>13WX78KS011</td>
                    <td>Joe</td>
                    <td>Lee</td>
                    <td>Male</td>
                    <td>05/09/1992</td>
                    <td>123-45-6789</td>
                </tr>
              </tbody>
            </table>
          </div>;
    }
}

export default PatientsList;