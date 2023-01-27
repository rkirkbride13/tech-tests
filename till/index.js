const Item = require('./src/item')
const Order = require('./src/order')
const Receipt = require('./src/receipt')
const Interface = require('./src/interface')

console.log("The till is running")

const order = new Order()
const receipt = new Receipt()
const interface = new Interface(order, receipt)