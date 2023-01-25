const inventory = require('./inventory.js')

class Order {
  constructor(name) {
    this.name = name
    this.order = []
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

  itemTotal() {
    let itemTotal = 0
    this.order.forEach(item => {
      itemTotal += inventory.prices[0][item]
    })
    return itemTotal
  }

  taxTotal() {
    let tax = 0.0864
    let taxTotal = this.itemTotal() * tax
    return Math.round((taxTotal + Number.EPSILON) * 100)/100
  }
}

module.exports = Order