class Receipt {

  constructor(order) {
    this.order = order
    this.items = order.listItems()
    this.receipt = []
  }

  formatItems() {
    this.items.forEach(item => {
      let spaces = 24 - item[0].length
      let price = item[2].toFixed(2)
      this.receipt.push(`${item[0]}${" ".repeat(spaces)}${item[1]} x ${price}\n`)
    })
  }

  formatTax() {
    this.receipt.push(`Tax${" ".repeat(21)}$${this.order.taxTotal()}\n`)
  }

  formatTotal() {
    let total = this.order.taxTotal() + this.order.itemTotal()
    total = total.toFixed(2)
    this.receipt.push(`Total${" ".repeat(19)}$${total}`)
  }

  formatReceipt() {
    this.formatItems()
    this.formatTax()
    this.formatTotal()
  }

  printReceipt() {
    this.formatReceipt()
    this.receipt.push(`${this.order.getName()}\n`)
    const receipt = this.receipt.join('')
    return receipt
  }
}

module.exports = Receipt