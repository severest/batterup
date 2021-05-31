import React from 'react'
import PropTypes from 'prop-types'
import AsyncSelect from 'react-select/async'

import { query } from '../../../graphql'
import searchStadiumQuery from './search_stadium_query'

const searchStadium = () =>
  query(searchStadiumQuery)
    .then(data => data.data.stadiums.map(t => ({ ...t, value: t.id, label: t.name })))
    .catch(e => console.log(e, 'oops'))

const StadiumSelector = ({
  onChange,
}) => {
  return (
    <AsyncSelect
      defaultOptions
      isSearchable={false}
      loadOptions={searchStadium}
      placeholder="Select a stadium..."
      onChange={onChange}
    />
  )
}

StadiumSelector.propTypes = {
  onChange: PropTypes.func,
}

StadiumSelector.defaultProps = {
  onChange: () => {},
}

export default StadiumSelector
