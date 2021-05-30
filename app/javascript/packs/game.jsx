import React from 'react'
import ReactDOM from 'react-dom'
import ScoreboardBases from './components/scoreboard/scoreboard_bases'
import TeamSelector from './components/team_selector/team_selector'

const Game = props => (
  <div>
    <ScoreboardBases onSecond />
    <TeamSelector />
  </div>
)

Game.defaultProps = {
}

Game.propTypes = {
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Game />,
    document.body.appendChild(document.createElement('div')),
  )
})
