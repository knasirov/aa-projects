import React from 'react';
import BenchMap from '../bench_map/bench_map';
import BenchIndex from '../bench_index';

const Search = (props) => {
  const { benches, fetchBenches } = props;

  return (
    <div>
      <BenchMap />
      <BenchIndex benches={benches} fetchBenches={fetchBenches} />
    </div>
  )
};

export default Search;
