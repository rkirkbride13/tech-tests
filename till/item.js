const inventory = require('./inventory.js')

class Item {

  constructor(name){
    this.name = name
  }

  getName(){
    return this.name
  }

  getPrice(){
    return inventory.prices[0][this.name]
  }
}

module.exports = Item