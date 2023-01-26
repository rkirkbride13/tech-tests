class Receipt {

  constructor(order) {
    this.order = order
    this.receipt = []
  }

  formatItems() {
    this.order.listItems().forEach(item => {
      this.receipt.push(item)
    })
  }

  printReceipt() {
    this.formatItems()
    return this.receipt.join()
  }

}

module.exports = Receipt