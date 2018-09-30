import React from 'react';
import PropTypes from 'prop-types';
import Payment from '../payment/Payment';
import './paymentList.scss';

class PaymentList extends React.Component {

  componentDidMount() {
    this.props.componentDidMount();
  }

  render() {
    const paymentComponents = this.props.payments.map((payment) => (
      <Payment key={payment.id} payment={payment} />
    ))

    return (
      <ul id="payment-list">
        { paymentComponents }
      </ul>
    )
  }
}

PaymentList.propTypes = {
  payments          : PropTypes.array.isRequired,
  componentDidMount : PropTypes.func.isRequired
}

export default PaymentList;
