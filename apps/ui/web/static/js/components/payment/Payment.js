import React from 'react';
import PropTypes from 'prop-types';
import './payment.scss';

const Payment = ({ payment }) => {
  return (
    <li className="payment z-depth-5">
      <span>{ payment.status }</span>
      <span>{ payment.txhash }</span>
    </li>
  )
}

Payment.propTypes = {
  payment : PropTypes.object.isRequired
}

export default Payment;
