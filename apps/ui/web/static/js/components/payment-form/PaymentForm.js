import React from 'react';
import PropTypes from 'prop-types';
import './paymentForm.scss';

const PaymentForm = ({onSubmit}) => {
  let txhash;

  return (
    <form
      id="payment-form"
      onSubmit={ event => {
        event.preventDefault();
        onSubmit(txhash.value)
        txhash.value = '';
      }}>

      <input
        className="z-depth-5"
        placeholder="Insert payment TSHash"
        ref={ node => txhash = node } />

      <button type="submit" className="z-depth-5 clickable success-gradient">
        Confirm Payment
      </button>
    </form>
  )
}

PaymentForm.propTypes = {
  onSubmit : PropTypes.func.isRequired
}

export default PaymentForm;
