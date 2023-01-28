const Item = require("./item")

class Interface {

  constructor(order, receipt, inventory) {
    this.order = order
    this.receipt = receipt
    this.menu = inventory.prices[0]
    this.nameEl = document.querySelector('#name-input');
    this.mainContainer = document.querySelector('#maincontainer');
    this.orderContainer = document.querySelector('#order');
    this.menuTable = document.querySelector('#menu');
    this.#displayMenu()
    document.querySelector('#name-button').addEventListener("click", () => {
      order.setName(this.nameEl.value)
      console.log(this.nameEl.value)
      this.nameEl.value = ''
    });
    this.setButtons()
  }

  setButtons() {
    const wrapper = document.getElementById('wrapper');
    wrapper.addEventListener("click", (event) => {
      const isButton = event.target.nodeName === 'BUTTON';
      if (!isButton) {
        return;
      }
      let item = new Item()
      item.setName(`${event.target.id}`)
      this.order.addItem(item)
      console.dir(event.target.id);
      console.log(this.order.listItems())
      this.#clearOrder()
      this.displayOrder()
    })
  }

  displayOrder() {
    this.displayItems()
    this.displayTax()
    this.displayTotal()
  }

  displayItems(){
    this.receipt.clearReceipt()
    this.receipt.addOrder(this.order)
    this.receipt.formatItems()
    this.receipt.getReceipt().forEach(item => {
      const orderEl = document.createElement('div')
      orderEl.innerHTML = `
        <div class="item">
        ${item}
        </div>
      `
      this.orderContainer.append(orderEl)
    })
  }

  displayTax(){
    const taxEl = document.createElement('div')
    taxEl.innerHTML = `
    <div class="tax">
    Tax $${this.order.taxTotal()}
    `
    this.orderContainer.append(taxEl)
  }

  displayTotal(){
    const totalEl = document.createElement('div')
    totalEl.innerHTML = `
    <div class="total">
    Total $${this.order.itemTotal() + this.order.taxTotal()}
    `
    this.orderContainer.append(totalEl)
  }

  #displayMenu() {
    let rowNum = 1
    Object.keys(this.menu).forEach(key => {
      let row = this.menuTable.insertRow(rowNum)
      let cell1 = row.insertCell(0)
      let cell2 = row.insertCell(1)
      cell1.innerHTML = `<button id="${key}">${key}</button>`
      cell2.innerHTML = `£${this.menu[key]}`
      rowNum ++
    })
  }

  #clearOrder(){
    this.orderContainer.querySelectorAll('div').forEach(item => item.remove());
  }

}

module.exports = Interface