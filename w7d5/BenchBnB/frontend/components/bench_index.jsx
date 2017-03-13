import React from 'react';

class BenchIndex extends React.Component {

  componentDidMount() {
    this.props.fetchBenches();
  }

  render() {
    let benches;
    if (this.props.benches instanceof Array) {
      benches = this.props.benches.map((bench, idx) => (
        <li key={idx}>{bench.description}</li>
      ))
    };

    return (
      <ul>
        {benches}
      </ul>
    );
  }
}

export default BenchIndex;
