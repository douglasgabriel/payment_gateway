import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import React from 'react';

import PaymentFormCont from '../../containers/payment-form/PaymentFormCont';
import PaymentList from '../../containers/payment-list/PaymentList';

class HomePage extends React.Component {
  render() {
    return (
      <div id="home-page">
        <PaymentFormCont />
        <PaymentList />
      </div>
    )
  }
}

HomePage.propTypes = {

}

const mapStateToProps = (state) => {
  return {
  }
}

const mapDispatchToProps = dispatch => {
  return {
  };
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(HomePage);
