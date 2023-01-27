const Receipt = require('../src/receipt.js')

describe('Receipt', () => {

  it('lists a single item on the receipt if only one item ordered', () => {
    const mockOrder = {
      getName: () => {return 'Robbie'},
      getDate: () => {return '27/01/2023, 10:36:00'},
      listItems: () => {return [['Tea', 1, 3.65]]},
      taxTotal: () => {return 0.32},
      itemTotal: () => {return 3.65}
    }
    const receipt = new Receipt(mockOrder)
    
    expect(receipt.printReceipt()).toContain("Tea                     1 x 3.65\n")
  });

  it('list multiple items on the receipt if mulitple items ordered', () => {
    const mockOrder = {
      getName: () => {return 'Robbie'},
      getDate: () => {return '27/01/2023, 10:36:00'},
      listItems: () => {return [['Tea', 1, 3.65], ['Cortado', 1, 4.55]]},
      taxTotal: () => {return 0.71},
      itemTotal: () => {return 8.20}
    }
    const receipt = new Receipt(mockOrder)
    
    expect(receipt.printReceipt()).toContain("Tea                     1 x 3.65\nCortado                 1 x 4.55\n")
  });

  it('lists item with quantity 2 if same item ordered twice', () => {
    const mockOrder = {
      getName: () => {return 'Robbie'},
      getDate: () => {return '27/01/2023, 10:36:00'},
      listItems: () => {return [['Tea', 2, 3.65]]},
      taxTotal: () => {return 0.64},
      itemTotal: () => {return 7.30}
    }
    const receipt = new Receipt(mockOrder)
    
    expect(receipt.printReceipt()).toContain("Tea                     2 x 3.65\n")
  });

  it('states tax for items on the receipt', () => {
    const mockOrder = {
      getName: () => {return 'Robbie'},
      getDate: () => {return '27/01/2023, 10:36:00'},
      listItems: () => {return [['Tea', 1, 3.65], ['Cortado', 1, 4.55]]},
      taxTotal: () => {return 0.71},
      itemTotal: () => {return 8.20}
    }
    const receipt = new Receipt(mockOrder)
    
    expect(receipt.printReceipt()).toContain("Tax                     $0.71\n")
  });

  it('states the total price on the receipt', () => {
    const mockOrder = {
      getName: () => {return 'Robbie'},
      getDate: () => {return '27/01/2023, 10:36:00'},
      listItems: () => {return [['Tea', 1, 3.65], ['Cortado', 1, 4.55]]},
      taxTotal: () => {return 0.71},
      itemTotal: () => {return 8.20}
    }
    const receipt = new Receipt(mockOrder)
    
    expect(receipt.printReceipt()).toContain("Total                   $8.91")
  });

  it('states the total price on the receipt for example order', () => {
    const mockOrder = {
      getName: () => {return 'Jane'},
      getDate: () => {return '27/01/2023, 10:36:00'},
      listItems: () => {return [['Cafe Latte', 2, 4.75], ['Blueberry Muffin', 1, 4.05], ['Choc Mudcake', 1, 6.40]]},
      taxTotal: () => {return 1.72},
      itemTotal: () => {return 19.95}
    }
    const receipt = new Receipt(mockOrder)
    
    expect(receipt.printReceipt()).toContain("27/01/2023, 10:36:00\n")
    expect(receipt.printReceipt()).toContain("Jane\n")
    expect(receipt.printReceipt()).toContain("Cafe Latte              2 x 4.75\nBlueberry Muffin        1 x 4.05\nChoc Mudcake            1 x 6.40\n")
    expect(receipt.printReceipt()).toContain("Tax                     $1.72")
    expect(receipt.printReceipt()).toContain("Total                   $21.67")
  });

});