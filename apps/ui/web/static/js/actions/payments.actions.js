import PaymentService from '../services/PaymentService';

export const PAYMENT_BEING_CREATED = 'PAYMENT_BEING_CREATED';
export const paymentBeingCreated = () => {
  return {
    type : PAYMENT_BEING_CREATED
  }
}

export const PAYMENT_CREATED = 'PAYMENT_CREATED';
export const paymentCreated = (payment) => {
  return {
    type : PAYMENT_CREATED,
    payload : { payment }
  }
}

export const FETCH_PAYMENTS_REQUEST = 'FETCH_PAYMENTS_REQUEST';
export const fetchPaymentsRequest = () => {
  return {
    type : FETCH_PAYMENTS_REQUEST
  }
}

export const FETCH_PAYMENTS_SUCCESS = 'FETCH_PAYMENTS_SUCCESS';
export const fetchPaymentsSuccess = (payments) => {
  return {
    type : FETCH_PAYMENTS_SUCCESS,
    payload : { payments }
  }
}

export function fetchPayments() {
  return dispatch => {
    dispatch(fetchPaymentsRequest());

    return PaymentService.fetchAll().then(response => {
      dispatch(fetchPaymentsSuccess(response.data));
    });
  }
}

export function createPayment(txhash) {
  return dispatch => {
    dispatch(paymentBeingCreated());

    return PaymentService.create({ txhash : txhash }).then(response => {
      dispatch(paymentCreated(response.data));
    });
  }
}