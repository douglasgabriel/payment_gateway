import React from 'react';
import PropTypes from 'prop-types';
import PaymentRow from '../payment-row/PaymentRow';
import './paymentsTable.scss';

class PaymentsTable extends React.Component {

  componentDidMount() {
    this.props.componentDidMount();
  }

  render() {
    const paymentComponents = this.props.payments.map((payment) => (
      <PaymentRow key={payment.id} payment={payment} />
    ))

    return (
      <table id="payments-table">
        <thead>
          <tr>
            <th>TXHash</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          { paymentComponents }
        </tbody>
      </table>
    )
  }
}

PaymentsTable.propTypes = {
  payments          : PropTypes.array.isRequired,
  componentDidMount : PropTypes.func.isRequired
}

export default PaymentsTable;