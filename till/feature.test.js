const Order = require('./order');
const Receipt = require('./receipt');
const Item = require('./item');

describe("items can be added to an order", () => {

  it('takes a name and an item on initialize', () => {
    const item = new Item('Tea')
    const order = new Order('Robbie', item)
    
    expect(order.listItems()).toEqual([['Tea', 1, 3.65]])
  });

  it('overwrites the quantity if same item is added twice', () => {
    const item = new Item('Tea')
    const order = new Order('Robbie', item)
    const item2 = new Item('Tea')
    order.addItem(item2)
    
    expect(order.listItems()).toEqual([['Tea', 2, 3.65]])
  });

  it('can list the price of the items in the order, single item', () => {
    const item = new Item('Tea')
    const order = new Order('Robbie', item)
    
    expect(order.itemTotal()).toBe(3.65)
  })

  it('can list the price of the items in the order, multiple items', () => {
    const item = new Item('Tea')
    const order = new Order('Robbie', item)
    const item2 = new Item('Cortado')
    order.addItem(item2)

    expect(order.itemTotal()).toBe(8.2)
  })

  it('can calculate the tax on the order, with tax at 8.64%', () => {
    const item = new Item('Tea')
    const order = new Order('Robbie', item)
    const item2 = new Item('Cortado')
    order.addItem(item2)

    expect(order.taxTotal()).toBe(0.71)
  })
})

describe("order can be formatted into a receipt", () => {

  it('lists a single item on the receipt if only one item ordered', () => {
    const item = new Item('Tea')
    const order = new Order('Robbie', item)
    const receipt = new Receipt(order)

    expect(receipt.printReceipt()).toContain("Tea                     1 x 3.65\n")
  })

  it('list multiple items on the receipt if mulitple items ordered', () => {
    const item = new Item('Tea')
    const order = new Order('Robbie', item)
    const item2 = new Item('Cortado')
    order.addItem(item2)
    const receipt = new Receipt(order)

    expect(receipt.printReceipt()).toContain("Tea                     1 x 3.65\nCortado                 1 x 4.55\n")
  })

  it('lists item with quantity 2 if same item ordered twice', () => {
    const item = new Item('Tea')
    const order = new Order('Robbie', item)
    const item2 = new Item('Tea')
    order.addItem(item2)
    const receipt = new Receipt(order)

    expect(receipt.printReceipt()).toContain("Tea                     2 x 3.65\n")
  })

  it('states tax for items on the receipt', () => {
    const item = new Item('Tea')
    const order = new Order('Robbie', item)
    const item2 = new Item('Cortado')
    order.addItem(item2)
    const receipt = new Receipt(order)

    expect(receipt.printReceipt()).toContain("Tax                     $0.71\n")
  })

  it('states the total price on the receipt', () => {
    const item = new Item('Tea')
    const order = new Order('Robbie', item)
    const item2 = new Item('Cortado')
    order.addItem(item2)
    const receipt = new Receipt(order)

    expect(receipt.printReceipt()).toContain("Total                   $8.91")
  })

  it('states the total price on the receipt for example order', () => {
    jest.useFakeTimers('modern')
    jest.setSystemTime(new Date(Date.UTC(2023, 0, 27, 10, 36, 0)))
    
    const item = new Item('Cafe Latte')
    const order = new Order('Jane', item)
    const item2 = new Item('Blueberry Muffin')
    const item3 = new Item('Choc Mudcake')
    order.addItem(item)
    order.addItem(item2)
    order.addItem(item3)
    const receipt = new Receipt(order)

    expect(receipt.printReceipt()).toContain("27/01/2023, 10:36:00\n")
    expect(receipt.printReceipt()).toContain("Jane\n")
    expect(receipt.printReceipt()).toContain("Cafe Latte              2 x 4.75\nBlueberry Muffin        1 x 4.05\nChoc Mudcake            1 x 6.40\n")
    expect(receipt.printReceipt()).toContain("Tax                     $1.72")
    expect(receipt.printReceipt()).toContain("Total                   $21.67")
  })

})