import { connect } from 'react-redux';
import PaymentList from '../../components/payments-list/PaymentList';
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

const PaymentListCont = connect(
  mapStateToProps,
  mapDispatchToProps
)(PaymentList);

export default PaymentListCont;
