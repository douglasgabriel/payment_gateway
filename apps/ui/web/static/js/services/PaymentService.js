export default class PaymentService {

  static create(payment) {
    const request = new Request('/api/payments', {
      method : 'POST',
      headers : { 'Content-Type' : 'application/json' },
      body : JSON.stringify(payment)
    });

    return fetch(request).then(response => {
      return response.json();
    });
  }

  static fetchAll() {
    const request = new Request('/api/payments', {
      method : 'GET',
    });

    return fetch(request).then(response => {
      return response.json();
    });
  }
}