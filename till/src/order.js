class Order {
  constructor(name, item) {
    // this.order = [new item()]
    this.name = name
    this.order = [[item.getName(), 1, item.getPrice()]]
    this.date = new Date()
  }

  getName() {
    return this.name
  }

  getDate() {
    return this.date.toLocaleString()
  }

  addItem(newItem) {
    let itemOrdered = false
    this.order.forEach(item => {
      if (item.includes(newItem.getName())) {
        item[1] ++
        itemOrdered = true
      }
    })
    if (!itemOrdered) {
      this.order.push([newItem.getName(), 1, newItem.getPrice()])
    }
  }

  listItems() {
    return this.order
  }

  itemTotal() {
    let itemTotal = 0
    this.order.forEach(item => {
      itemTotal += (item[1] * item[2])
    })
    return Math.round((itemTotal + Number.EPSILON) * 100)/100
  }

  taxTotal() {
    let tax = 0.0864
    let taxTotal = this.itemTotal() * tax
    return Math.round((taxTotal + Number.EPSILON) * 100)/100
  }
}

module.exports = Order