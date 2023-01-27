const Order = require('./order.js')

describe('Order', () => {

  it('takes a name and an item on initialize', () => {
    const mockItem = {
      getName: () => {return 'Tea'},
      getPrice: () => {return 3.65}
    }
    const order = new Order('Robbie', mockItem)
    
    expect(order.listItems()).toEqual([['Tea', 1, 3.65]])
  });

  it('overwrites the quantity if same item is added twice', () => {
    const mockItem1 = {
      getName: () => {return 'Tea'},
      getPrice: () => {return 3.65}
    }
    const order = new Order('Robbie', mockItem1)
    const mockItem2 = {
      getName: () => {return 'Tea'},
      getPrice: () => {return 3.65}
    }
    order.addItem(mockItem2)

    expect(order.listItems()).toEqual([['Tea', 2, 3.65]])
  });

  it('can list the price of the items in the order, single item', () => {
    const mockItem = {
      getName: () => {return 'Tea'},
      getPrice: () => {return 3.65}
    }
    const order = new Order('Robbie', mockItem)
    
    expect(order.itemTotal()).toBe(3.65)
  })

  it('can list the price of the items in the order, multiple items', () => {
    const mockItem1 = {
      getName: () => {return 'Tea'},
      getPrice: () => {return 3.65}
    }
    const order = new Order('Robbie', mockItem1)
    const mockItem2 = {
      getName: () => {return 'Cortado'},
      getPrice: () => {return 4.55}
    }
    order.addItem(mockItem2)

    expect(order.itemTotal()).toBe(8.2)
  })

  it('can calculate the tax on the order, with tax at 8.64%', () => {
    const mockItem1 = {
      getName: () => {return 'Tea'},
      getPrice: () => {return 3.65}
    }
    const order = new Order('Robbie', mockItem1)
    const mockItem2 = {
      getName: () => {return 'Cortado'},
      getPrice: () => {return 4.55}
    }
    order.addItem(mockItem2)

    expect(order.taxTotal()).toBe(0.71)
  })

  it('can calculate the item total and tax on the order, with tax at 8.64%', () => {
    const mockItem1 = {
      getName: () => {return 'Cafe Latte'},
      getPrice: () => {return 4.75}
    }
    const order = new Order('Robbie', mockItem1)
    const mockItem2 = {
      getName: () => {return 'Blueberry Muffin'},
      getPrice: () => {return 4.05}
    }
    const mockItem3 = {
      getName: () => {return 'Choc Mudcake'},
      getPrice: () => {return 6.40}
    }
    order.addItem(mockItem1)
    order.addItem(mockItem2)
    order.addItem(mockItem3)

    expect(order.itemTotal()).toBe(19.95)
    expect(order.taxTotal()).toBe(1.72)
  })

  it('has the date the order was created included in the class', () => {
    // Date.now = jest.fn(() => new Date(Date.UTC(2023, 1, 27, 10, 36, 0)).valueOf())
    jest.useFakeTimers('modern')
    jest.setSystemTime(new Date(Date.UTC(2023, 0, 27, 10, 36, 0)))
    const mockItem1 = {
      getName: () => {return 'Cafe Latte'},
      getPrice: () => {return 4.75}
    }
    const order = new Order('Robbie', mockItem1)
    expect(order.getDate()).toBe('27/01/2023, 10:36:00')
  })

});