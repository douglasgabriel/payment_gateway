import { connect } from 'react-redux';
import PaymentForm from '../../components/payment-form/PaymentForm';
import { createPayment } from '../../actions/payments.actions';

const mapStateToProps = state => {
  return {
  }
}

const mapDispatchToProps = dispatch => {
  return {
    onSubmit: (txhash) => {
      dispatch(createPayment(txhash));
    }
  };
}

const PaymentFormCont = connect(
  mapStateToProps,
  mapDispatchToProps
)(PaymentForm);

export default PaymentFormCont;
