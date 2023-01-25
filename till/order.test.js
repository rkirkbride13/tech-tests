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

  it('can list the price of the items in the order, single item', () => {
    const order = new Order('Robbie')
    order.addItem('Tea')
    expect(order.itemTotal()).toBe(3.65)
  })

  it('can list the price of the items in the order, multiple items', () => {
    const order = new Order('Robbie')
    order.addItem('Tea')
    order.addItem('Cappucino')
    order.addItem('Tea')
    expect(order.itemTotal()).toBe(11.15)
  })

  it('can calculate the tax on the order, with tax at 8.64%', () => {
    const order = new Order('Robbie')
    order.addItem('Tea')
    order.addItem('Cappucino')
    order.addItem('Tea')
    expect(order.taxTotal()).toBe(0.96)
  })

});