import { connect } from 'react-redux';
import PaymentTable from '../../components/payments-table/PaymentsTable';
import { fetchPayments } from '../../actions/payments.actions';

const mapStateToProps = state => {
  return {
    payments : state.payment.items
  }
}

const mapDispatchToProps = dispatch => {
  return {
    componentDidMount : () => {
      dispatch(fetchPayments());
      setInterval(() => dispatch(fetchPayments()), 10 * 1000);
    }
  };
}

const PaymentList = connect(
  mapStateToProps,
  mapDispatchToProps
)(PaymentTable);

export default PaymentList;
