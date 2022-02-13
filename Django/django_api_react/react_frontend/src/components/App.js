import React, { Component } from "react";
import { render } from "react-dom";

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      data: [],
    };
  }

  componentDidMount() {
    fetch("events/api/")
      .then((response) => {
        if (response.status > 399) {
          return this.setState(() => {
            return { placeholder: "Something went wrong!" };
          });
        }
        return response.json();
      })
      .then((data) => {
        this.setState(() => {
          return {
            data,
            loaded: true,
          };
        });
      });
  }

  render() {
    return (
      <div>
        {this.state.data.map((events) => {
          return (
            <div>
              Event: {events.title}
              Details {events.details}
            </div>
          );
        })}
      </div>
    );
  }
}

export default App;
