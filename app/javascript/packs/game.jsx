import React from 'react'
import ReactDOM from 'react-dom'
import ScoreboardBases from './components/scoreboard/scoreboard_bases'

const Game = props => (
  <div>
    <ScoreboardBases onSecond />
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
