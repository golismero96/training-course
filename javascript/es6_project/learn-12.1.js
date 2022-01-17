function* numbers() {
  console.log("BEGIN");

  yield 1;
  yield 2;
  yield 3;
}
let iterator = numbers();

console.log(iterator.next().value);
console.log(iterator.next().value);
console.log(iterator.next().value);
