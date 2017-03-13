import { connect } from 'react-redux';

import BenchIndex from './bench_index.jsx';
import { fetchBenches } from '../actions/bench_actions';

const mapStateToProps = state => ({
  benches: state.benches
});

const mapDispatchToProps = dispatch => ({
  fetchBenches: () => dispatch(fetchBenches())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(BenchIndex);
