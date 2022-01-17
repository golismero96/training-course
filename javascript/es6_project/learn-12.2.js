function* range(start, end) {
  while (start <= end) {
    yield start;

    start++;
  }
}

console.log([...range(1, 5)]);
