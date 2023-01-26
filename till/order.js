class Order {
  constructor(name, item) {
    this.name = name
    this.order = [[item.getName(), 1, item.getPrice()]]
  }

  name() {
    return this.name
  }

  addItem(new_item) {
    this.order.forEach(item => {
      if (!item.includes(new_item.getName())) {
        this.order.push([new_item.getName(), 1, new_item.getPrice()])
      } else {
        item[1] ++
      }
    })
  }

  listItems() {
    return this.order
  }

  itemTotal() {
    let itemTotal = 0
    this.order.forEach(item => {
      itemTotal += item[2]
    })
    return itemTotal
  }

  taxTotal() {
    let tax = 0.0864
    let taxTotal = this.itemTotal() * tax
    return Math.round((taxTotal + Number.EPSILON) * 100)/100
  }

  #itemArray() {

  }
}

module.exports = Order