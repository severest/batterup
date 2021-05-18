import React from 'react'
import PropTypes from 'prop-types'
import styles from './scoreboard_bases.module.scss'

const ScoreboardBases = ({
  onFirst,
  onSecond,
  onThird,
}) => {
  return (
    <div className={styles.bases}>
      <div className={`${styles.first} ${onFirst ? styles.firstActive : ''}`}></div>
      <div className={`${styles.second} ${onSecond ? styles.secondActive : ''}`}></div>
      <div className={`${styles.third} ${onThird ? styles.thirdActive : ''}`}></div>
    </div>
  )
}

ScoreboardBases.propTypes = {
  onFirst: PropTypes.bool,
  onSecond: PropTypes.bool,
  onThird: PropTypes.bool,
}

ScoreboardBases.defaultProps = {
  onFirst: false,
  onSecond: false,
  onThird: false,
}

export default ScoreboardBases
