const Order = require('./order.js')

describe('Order', () => {

  it('takes a the name of the person when initialized', () => {
    const order = new Order('Robbie')
    expect(order.name).toBe("Robbie");
  });

  it('can have an item added to the order', () => {
    const order = new Order('Robbie')
    order.addItem('Tea')
    expect(order.listItems()).toEqual(['Tea'])
  });

  it('can have multiple items added to the order', () => {
    const order = new Order('Robbie')
    order.addItem('Tea')
    order.addItem('Cappucino')
    order.addItem('Tea')
    expect(order.listItems()).toEqual(['Tea', 'Cappucino', 'Tea'])
  });

});