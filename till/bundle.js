(() => {
  var __getOwnPropNames = Object.getOwnPropertyNames;
  var __commonJS = (cb, mod) => function __require() {
    return mod || (0, cb[__getOwnPropNames(cb)[0]])((mod = { exports: {} }).exports, mod), mod.exports;
  };

  // src/order.js
  var require_order = __commonJS({
    "src/order.js"(exports, module) {
      var Order2 = class {
        constructor() {
          this.order = [];
          this.date = /* @__PURE__ */ new Date();
          this.name = "-";
        }
        setName(name) {
          this.name = name;
        }
        getName() {
          return `Name: ${this.name}`;
        }
        getDate() {
          return this.date.toLocaleString();
        }
        addItem(newItem) {
          let itemOrdered = false;
          this.order.forEach((item) => {
            if (item.includes(newItem.getName())) {
              item[1]++;
              itemOrdered = true;
            }
          });
          if (!itemOrdered) {
            this.order.push([newItem.getName(), 1, newItem.getPrice()]);
          }
        }
        listItems() {
          return this.order;
        }
        clearOrder() {
          return this.order = [];
        }
        itemTotal() {
          let itemTotal = 0;
          this.order.forEach((item) => {
            itemTotal += item[1] * item[2];
          });
          return Math.round((itemTotal + Number.EPSILON) * 100) / 100;
        }
        taxTotal() {
          let tax = 0.0864;
          let taxTotal = this.itemTotal() * tax;
          return Math.round((taxTotal + Number.EPSILON) * 100) / 100;
        }
      };
      module.exports = Order2;
    }
  });

  // src/receipt.js
  var require_receipt = __commonJS({
    "src/receipt.js"(exports, module) {
      var Receipt2 = class {
        constructor() {
          this.order = [];
          this.receipt = [];
        }
        addOrder(order2) {
          this.order = order2;
          this.items = order2.listItems();
        }
        getReceipt() {
          return this.receipt;
        }
        clearReceipt() {
          return this.receipt = [];
        }
        formatItems() {
          this.items.forEach((item) => {
            let spaces = 24 - item[0].length;
            let price = item[2].toFixed(2);
            this.receipt.push(
              `${item[0]}${" ".repeat(spaces)}${item[1]} x ${price}
`
            );
          });
        }
        formatTax() {
          this.receipt.push(`Tax${" ".repeat(21)}$${this.order.taxTotal()}
`);
        }
        formatTotal() {
          let total = this.order.taxTotal() + this.order.itemTotal();
          total = total.toFixed(2);
          this.receipt.push(`Total${" ".repeat(19)}$${total}`);
        }
        compileReceipt() {
          this.formatItems();
          this.formatTax();
          this.formatTotal();
          this.receipt.unshift(`${this.order.getName()}
`);
          this.receipt.unshift(`${this.order.getDate()}
`);
        }
        printReceipt() {
          this.compileReceipt();
          return this.receipt.join("");
        }
      };
      module.exports = Receipt2;
    }
  });

  // src/inventory.js
  var require_inventory = __commonJS({
    "src/inventory.js"(exports, module) {
      var inventory2 = {
        "shopName": "The Coffee Connection",
        "address": "123 Lakeside Way",
        "phone": "16503600708",
        "prices": [
          {
            "Cafe Latte": 4.75,
            "Flat White": 4.75,
            "Cappucino": 3.85,
            "Single Espresso": 2.05,
            "Double Espresso": 3.75,
            "Americano": 3.75,
            "Cortado": 4.55,
            "Tea": 3.65,
            "Choc Mudcake": 6.4,
            "Choc Mousse": 8.2,
            "Affogato": 14.8,
            "Tiramisu": 11.4,
            "Blueberry Muffin": 4.05,
            "Chocolate Chip Muffin": 4.05,
            "Muffin Of The Day": 4.55
          }
        ]
      };
      module.exports = inventory2;
    }
  });

  // src/item.js
  var require_item = __commonJS({
    "src/item.js"(exports, module) {
      var inventory2 = require_inventory();
      var Item = class {
        setName(name) {
          if (!(name in inventory2.prices[0])) {
            throw "This item does not exist on the menu";
          }
          this.name = name;
        }
        getName() {
          return this.name;
        }
        getPrice() {
          return inventory2.prices[0][this.name];
        }
      };
      module.exports = Item;
    }
  });

  // src/interface.js
  var require_interface = __commonJS({
    "src/interface.js"(exports, module) {
      var Item = require_item();
      var Interface2 = class {
        constructor(order2, receipt2, inventory2) {
          this.order = order2;
          this.receipt = receipt2;
          this.menu = inventory2.prices[0];
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
          totalEl.innerHTML = `<div class="total">Total $${this.order.itemTotal() + this.order.taxTotal()}`;
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
          this.orderContainer.querySelectorAll("div").forEach((item) => item.remove());
        }
      };
      module.exports = Interface2;
    }
  });

  // index.js
  var Order = require_order();
  var Receipt = require_receipt();
  var Interface = require_interface();
  var inventory = require_inventory();
  console.log("The till is running");
  var order = new Order();
  var receipt = new Receipt();
  var interface2 = new Interface(order, receipt, inventory);
})();
