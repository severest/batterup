import React from 'react'
import ReactDOM from 'react-dom'
import ScoreboardBases from './components/scoreboard/scoreboard_bases'
import StadiumSelector from './components/stadium_selector/stadium_selector'
import TeamSelector from './components/team_selector/team_selector'

const Game = props => (
  <div>
    <ScoreboardBases onSecond />
    <TeamSelector />
    <StadiumSelector />
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
