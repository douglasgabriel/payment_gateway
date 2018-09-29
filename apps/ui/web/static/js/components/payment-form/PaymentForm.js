import React from 'react';
import PropTypes from 'prop-types';

const PaymentForm = ({onSubmit}) => {
  let txhash;

  return (
    <form
      id="payment-form"
      onSubmit={ event => {
        event.preventDefault();
        onSubmit(txhash.value)
      }}>

      <input
        ref={ node => txhash = node } />

      <button type="submit">
        Pay
      </button>
    </form>
  )
}

PaymentForm.propTypes = {
  onSubmit : PropTypes.func.isRequired
}

export default PaymentForm;
