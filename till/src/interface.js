// const Order = require("./order");

// class Interface {

//   constructor() {
//     this.nameEl = document.querySelector('#name-input');
//     this.mainContainer = document.querySelector('#maincontainer');
//     document.querySelector('#name-button').addEventListener("click", () => {
//       let item = this.selectItem()
//       console.log(this.nameEl.value)
//       let order = new Order(this.nameEl.value, item)
//     });
//   }

//   selectItem() {

//     document.querySelector('#Cafe-Latte').addEventListener("click", () => {
//       let item = new Item('Cafe Latte')
//       return item;
//     });

//     document.querySelector('#Flat-White').addEventListener("click", () => {
//       let item = new Item('Flat White')
//       return item;
//     });

//   }

// }

// module.exports = Interface


$(document).ready(function(){

  var order = new Order()

  $('#name-button').click(function() {
    let name = document.querySelector('#name-input').value;
    console.log(name)
    order.getName(name)
  })

  $('#Cafe-Latte').click(function() {
    var item = new Item ('Cafe Latte')
    order.addItem(item);
    update();
  })

  $('#Muffin-Of-The-Day').click(function() {
    let item = new Item ('Muffin Of The Day')
    updateOrder(item);
  })

  function updateOrder(item) {

    $('#item1').text(order.getName())
  };
  
});

// $('#Flat-White').click(function() {
//   let item = new Item ('Flat White')
//   order.addItem(item);
//   update();
// })

// $('#Cappucino').click(function() {
//   let item = new Item ('Cappucino')
//   order.addItem(item);
//   update();
// })

// $('#Single-Espresso').click(function() {
//   let item = new Item ('Single Espresso')
//   order.addItem(item);
//   update();
// })

// $('#Double-Espresso').click(function() {
//   let item = new Item ('Double Espresso')
//   order.addItem(item);
//   update();
// })

// $('#Americano').click(function() {
//   let item = new Item ('Americano')
//   order.addItem(item);
//   update();
// })

// $('#Cortado').click(function() {
//   let item = new Item ('Cortado')
//   order.addItem(item);
//   update();
// })

// $('#Tea').click(function() {
//   let item = new Item ('Tea')
//   order.addItem(item);
//   update();
// })

// $('#Choc-Mudcake').click(function() {
//   let item = new Item ('Choc Mudcake')
//   order.addItem(item);
//   update();
// })

// $('#Choc-Mousse').click(function() {
//   let item = new Item ('Choc Mousse')
//   order.addItem(item);
//   update();
// })

// $('#Affogato').click(function() {
//   let item = new Item ('Affogato')
//   order.addItem(item);
//   update();
// })

// $('#Tiramisu').click(function() {
//   let item = new Item ('Tiramisu')
//   order.addItem(item);
//   update();
// })

// $('#Blueberry-Muffin').click(function() {
//   let item = new Item ('Blueberry Muffin')
//   order.addItem(item);
//   update();
// })

// $('#Chocolate-Chip-Muffin').click(function() {
//   let item = new Item ('Chocolate Chip Muffin')
//   update();
// })