import React from 'react'
import PropTypes from 'prop-types'
import AsyncSelect from 'react-select/async'

import { query } from '../../../graphql'
import searchTeamQuery from './search_team_query'

const searchTeam = () =>
  query(searchTeamQuery)
    .then(data => data.data.teams.map(t => ({ ...t, value: t.id, label: t.name })))
    .catch(e => console.log(e, 'oops'))

const TeamSelector = ({
  filteredTeamIds,
  onChange,
}) => {
  return (
    <AsyncSelect
      defaultOptions
      filterOption={({ value }) => !filteredTeamIds.includes(value)}
      isSearchable={false}
      loadOptions={searchTeam}
      placeholder="Select a team..."
      onChange={onChange}
    />
  )
}

TeamSelector.propTypes = {
  filteredTeamIds: PropTypes.arrayOf(PropTypes.number),
  onChange: PropTypes.func,
}

TeamSelector.defaultProps = {
  filteredTeamIds: [],
  onChange: () => {},
}

export default TeamSelector
