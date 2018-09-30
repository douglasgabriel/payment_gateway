import { connect } from 'react-redux';
import PropTypes from 'prop-types';
import React from 'react';

import PaymentFormCont from '../../containers/payment-form/PaymentFormCont';
import PaymentListCont from '../../containers/payment-list/PaymentListCont';
import './homePage.scss';

class HomePage extends React.Component {
  render() {
    return (
      <div id="home-page">
        <header>
          <PaymentFormCont />
        </header>
        <span className="overlap"></span>
        <section className="payment-list">
          <PaymentListCont />
        </section>
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
