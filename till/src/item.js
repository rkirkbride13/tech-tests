const inventory = require("./inventory.js");

class Item {
  setName(name) {
    if (!(name in inventory.prices[0])) {
      throw "This item does not exist on the menu";
    }
    this.name = name;
  }

  getName() {
    return this.name;
  }

  getPrice() {
    return inventory.prices[0][this.name];
  }
}

module.exports = Item;
