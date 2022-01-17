const sum = (...numbers) => {
  return numbers.reduce((prev, current) => prev + current);
};
console.log(sum(1, 2, 3, 4, 5, 6, 7, 8, 9, 4, 2, 65, 78, 8, 32, 23, 65));
