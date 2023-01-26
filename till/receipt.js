class Receipt {

  constructor(order) {
    this.order = order.listItems()
    this.receipt = []
  }

  formatItems() {
    this.order.forEach(item => {
      let spaces = 24 - item[0].length
      this.receipt.push(`${item[0]}${" ".repeat(spaces)}${item[1]} x ${item[2]}`)
    })
  }

  printReceipt() {
    this.formatItems()
    return this.receipt.join()
  }

}

module.exports = Receipt