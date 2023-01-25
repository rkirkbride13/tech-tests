const inventory = require('./inventory.js')

class Order {

  constructor(name) {
    this.name = name
    this.order = []
    this.items = inventory.prices[0]
  }

  name() {
    return this.name
  }

  addItem(item) {
    this.order.push(item)
  }

  listItems() {
    return this.order
  }

  total() {
    let total = 0
    this.order.forEach(item => {
      total += this.items[item]
    })
    return total
  }

}

module.exports = Order