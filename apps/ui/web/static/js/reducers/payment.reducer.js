import {
  PAYMENT_BEING_CREATED,
  PAYMENT_CREATED,
  FETCH_PAYMENTS_REQUEST,
  FETCH_PAYMENTS_SUCCESS
} from '../actions/payments.actions';
import initialState from '../initialState';

export default function paymentsReducer(state = initialState.payment, action) {
  switch(action.type) {
    case PAYMENT_BEING_CREATED :
      return { ...state, isBeingCreated : true }
    case PAYMENT_CREATED :
      return {
        ...state,
        isBeingCreated : false,
        items : [ ...state.items, action.payload.payment ]
      }
    case FETCH_PAYMENTS_REQUEST :
      return { ...state, isFetching : true }
    case FETCH_PAYMENTS_SUCCESS :
      return {
        ...state,
        isFetching : false,
        items : action.payload.payments
      }
    default:
      return state;
  }
}
