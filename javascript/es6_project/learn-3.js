function applyDiscount(cost, discount = 0.1) {
  return cost - cost * discount;
}

console.log(applyDiscount(100, 0.4));
