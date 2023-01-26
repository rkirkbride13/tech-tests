const Item = require('./item.js')

describe('Item', () => {

  it('has a name and price when initialized', () => {
    const item = new Item("Tea")
    
    expect(item.getName()).toBe('Tea')
    expect(item.getPrice()).toBe(3.65)
  });

});