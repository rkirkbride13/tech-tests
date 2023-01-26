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

  format(){
    let spaces = 24 - this.name.length
    return (`${this.name}${" ".repeat(spaces)}1 x ${this.getPrice()}`)
  }
}

module.exports = Item