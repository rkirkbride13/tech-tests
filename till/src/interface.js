const Item = require("./item");

class Interface {
  constructor(order, receipt, inventory) {
    this.order = order;
    this.receipt = receipt;
    this.menu = inventory.prices[0];
    this.orderContainer = document.querySelector("#order");
    this.menuTable = document.querySelector("#menu");
    this.execute();
  }

  execute() {
    this.#displayMenu();
    this.enterName();
    this.createMenu();
    this.resetOrder();
  }

  enterName() {
    document.querySelector("#name-button").addEventListener("click", () => {
      if (document.querySelector("#name-input").value) {
        this.order.setName(document.querySelector("#name-input").value);
      }
    });
  }

  createMenu() {
    const wrapper = document.getElementById("wrapper");
    wrapper.addEventListener("click", (event) => {
      const isButton = event.target.nodeName === "BUTTON";
      if (!isButton) {
        return;
      }
      let item = new Item();
      item.setName(`${event.target.id}`);
      this.order.addItem(item);
      this.displayOrder();
    });
  }

  displayReceipt() {
    this.receipt.addOrder(this.order);
    this.receipt.compileReceipt();
    this.#createReceiptHTML();
    this.#insertReceiptLogo();
    this.#insertReceiptItems();
    this.#insertReceiptFooter();
  }

  displayOrder() {
    this.#clearOrder();
    this.#displayItems();
    this.#displayTax();
    this.#displayTotal();
    this.#displaySubmitOrder();
  }

  resetOrder() {
    document.querySelector("#reset-button").addEventListener("click", () => {
      this.order.clearOrder();
      this.#clearOrder();
      document.querySelector("#submitOrder").remove();
      if (document.querySelector("#receipt_box")) {
        document.querySelector("#receipt_box").remove();
      }
      this.submitOrder = false;
    });
  }

  #displayMenu() {
    let rowNum = 1;
    Object.keys(this.menu).forEach((key) => {
      let row = this.menuTable.insertRow(rowNum);
      let cell1 = row.insertCell(0);
      let cell2 = row.insertCell(1);
      cell1.innerHTML = `<button id="${key}">${key}</button>`;
      cell2.innerHTML = `${this.menu[key]}`;
      rowNum++;
    });
  }

  #displayItems() {
    this.receipt.clearReceipt();
    this.receipt.addOrder(this.order);
    this.receipt.formatItems();
    this.receipt.getReceipt().forEach((item) => {
      const orderEl = document.createElement("div");
      orderEl.innerHTML = `<div class="item">${item}</div>`;
      this.orderContainer.append(orderEl);
    });
  }

  #displayTax() {
    const taxEl = document.createElement("div");
    taxEl.innerHTML = `
    <div class="tax">
    Tax $${this.order.taxTotal()}
    `;
    this.orderContainer.append(taxEl);
  }

  #displayTotal() {
    const totalEl = document.createElement("div");
    totalEl.innerHTML = `<div class="total">Total $${
      this.order.itemTotal() + this.order.taxTotal()
    }`;
    this.orderContainer.append(totalEl);
  }

  #displaySubmitOrder() {
    if (!this.submitOrder) {
      this.submitOrder = document.createElement("div");
      this.submitOrder.innerHTML = `<button class="submitOrder" id="submitOrder">Submit Order</button>`;
      const orderBox = document.querySelector("#order_box");
      orderBox.append(this.submitOrder);
      document.getElementById("submitOrder").addEventListener("click", () => {
        this.receipt.clearReceipt();
        this.displayReceipt();
      });
    }
  }

  #createReceiptHTML() {
    this.receiptBox = document.createElement("div");
    this.receiptBox.id = "receipt_box";
    this.receiptBox.classList.add("receipt_box");
    const mainContainer = document.querySelector(".maincontainer");
    mainContainer.append(this.receiptBox);
  }

  #insertReceiptItems() {
    this.receipt.getReceipt().forEach((line) => {
      const receiptEl = document.createElement("div");
      receiptEl.innerHTML = `<div class="line">${line}</div>`;
      this.receiptBox.append(receiptEl);
    });
  }

  #insertReceiptLogo() {
    const logo = document.createElement("img");
    logo.src = "./public/logo.png";
    logo.id = "logo";
    document.getElementById("receipt_box").appendChild(logo);
  }

  #insertReceiptFooter() {
    const footer = document.createElement("img");
    footer.src = "./public/footer.png";
    footer.id = "footer";
    document.getElementById("receipt_box").appendChild(footer);
  }

  #clearOrder() {
    this.orderContainer
      .querySelectorAll("div")
      .forEach((item) => item.remove());
  }
}

module.exports = Interface;
