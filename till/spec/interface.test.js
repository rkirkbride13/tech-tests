/**
 * @jest-environment jsdom
 */
const fs = require("fs");
const Order = require("../src/order");
const Receipt = require("../src/receipt");
const Item = require("../src/item");
const Interface = require("../src/interface");
const inventory = require("../src/inventory");

describe(Interface, () => {
  let order, receipt, item;
  beforeEach(() => {
    document.body.innerHTML = fs.readFileSync("./index.html");

    order = new Order();
    receipt = new Receipt();
    item = new Item();
    const tillInterface = new Interface(order, receipt, inventory);
  });

  it("has a menu is tabulated with items on startup", () => {
    const table = document.querySelector("#menu");
    const rows = table.getElementsByTagName("tr");
    const cols = table.getElementsByTagName("th");
    const item = document.querySelector(
      "#menu tr:nth-child(2) td:nth-child(1)"
    );
    const price = document.querySelector(
      "#menu tr:nth-child(2) td:nth-child(2)"
    );

    expect(rows.length).toBe(16);
    expect(cols.length).toBe(2);
    expect(item.textContent).toBe("Cafe Latte");
    expect(price.textContent).toBe("4.75");
  });

  it("can add a name to the order using the input", () => {
    const textInputEl = document.querySelector("#name-input");
    const buttonEl = document.querySelector("#name-button");
    textInputEl.value = "Robbie";
    buttonEl.click();

    expect(order.getName()).toBe("Robbie");
  });

  it("can add items to the order by clicking menu", () => {
    const buttonEl1 = document.querySelector("#Americano");
    buttonEl1.click();
    const buttonEl2 = document.querySelector("#Cappucino");
    buttonEl2.click();

    const items = document.querySelectorAll(".item");
    const total = document.querySelector(".total");

    expect(items.length).toBe(2);
    expect(items[1].textContent).toContain("Cappucino               1 x 3.85");
    expect(total.textContent).toContain("Total $8.26");
  });

  it("adds to the quantity of the item if same one clicked again", () => {
    const buttonEl1 = document.querySelector("#Americano");
    buttonEl1.click();
    const buttonEl2 = document.querySelector("#Cappucino");
    buttonEl2.click();
    buttonEl2.click();
    buttonEl2.click();

    const items = document.querySelectorAll(".item");
    const total = document.querySelector(".total");

    expect(items.length).toBe(2);
    expect(items[1].textContent).toContain("Cappucino               3 x 3.85");
    expect(total.textContent).toContain("Total $16.62");
  });

  it("can submit an order and print a receipt", () => {
    const textInputEl = document.querySelector("#name-input");
    const nameButton = document.querySelector("#name-button");
    textInputEl.value = "Robbie";
    nameButton.click();

    const buttonEl1 = document.querySelector("#Americano");
    buttonEl1.click();
    const buttonEl2 = document.querySelector("#Cappucino");
    buttonEl2.click();
    buttonEl2.click();

    const submitButton = document.querySelector("#submitOrder");
    submitButton.click();

    const receipt = document.querySelector("#receipt_box").textContent;

    expect(receipt).toContain("Robbie");
    expect(receipt).toContain("Cappucino               2 x 3.85");
    expect(receipt).toContain("Americano               1 x 3.75");
    expect(receipt).toContain("Total                   $12.44");
  });

  it("can reset an order by clicking the reset button", () => {
    const textInputEl = document.querySelector("#name-input");
    const nameButton = document.querySelector("#name-button");
    textInputEl.value = "Robbie";
    nameButton.click();

    const buttonEl1 = document.querySelector("#Americano");
    buttonEl1.click();
    const buttonEl2 = document.querySelector("#Cappucino");
    buttonEl2.click();

    const resetButton = document.querySelector("#reset-button");
    resetButton.click();

    expect(order.listItems()).toEqual([]);
  });
});
