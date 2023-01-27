const Item = require('../src/item.js')

describe('Item', () => {

  it('has a name and price when initialized', () => {
    const item = new Item()
    item.setName('Tea')
    expect(item.getName()).toBe('Tea')
    expect(item.getPrice()).toBe(3.65)
  });

  it("fails if the item given in constructor is not on the menu", () => {
    const item = new Item()
    
    expect(() => {item.setName('Pizza')}).toThrow("This item does not exist on the menu");
    })

});