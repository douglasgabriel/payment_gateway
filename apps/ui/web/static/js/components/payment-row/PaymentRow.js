import React from 'react';
import PropTypes from 'prop-types';

const PaymentRow = ({ payment }) => {
  return (
    <tr>
      <td>{ payment.txhash }</td>
      <td>{ payment.status }</td>
    </tr>
  )
}

PaymentRow.propTypes = {
  payment : PropTypes.object.isRequired
}

export default PaymentRow;
