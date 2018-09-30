import React from 'react';
import PropTypes from 'prop-types';
import './payment.scss';

const statusClass = {
  'ERROR' : 'error-gradient',
  'OK'    : 'success-gradient'
}

const Payment = ({ payment }) => {
  return (
    <li className={"payment z-depth-5 " + statusClass[payment.status]}>
      <span className="status">{ payment.status == null ? 'PENDING' : payment.status }</span>
      <a
        target="blank"
        href={'https://etherscan.io/tx/' + payment.txhash }>
        <span>{ payment.txhash }</span>
      </a>
    </li>
  )
}

Payment.propTypes = {
  payment : PropTypes.object.isRequired
}

export default Payment;
