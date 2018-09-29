import {combineReducers} from 'redux';
import payment from './payment.reducer';

const rootReducer = combineReducers({
  payment
})

export default rootReducer;