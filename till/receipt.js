class Receipt {

  constructor(order) {
    this.order = order
    this.items = order.listItems()
    this.receipt = []
  }

  formatItems() {
    this.items.forEach(item => {
      let spaces = 24 - item[0].length
      this.receipt.push(`${item[0]}${" ".repeat(spaces)}${item[1]} x ${item[2]}\n`)
    })
  }

  formatTax() {
    this.receipt.push(`Tax${" ".repeat(21)}$${this.order.taxTotal()}\n`)
  }

  formatTotal() {
    let total = this.order.taxTotal() + this.order.itemTotal()
    this.receipt.push(`Total${" ".repeat(19)}$${total}\n`)
  }

  formatReceipt() {
    this.formatItems()
    this.formatTax()
    this.formatTotal()
  }

  printReceipt() {
    this.formatReceipt()
    const item_string = this.receipt.join('')
    return item_string
    // return item_string.substring(0, item_string.length - 1)
  }
}

module.exports = Receipt