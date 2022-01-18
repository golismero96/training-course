// Object Shorthand

function getPerson() {
  let name = "Mostafa";
  let age = 25;

  return {
    name,
    age,
    greet() {
      return `Salam ${this.name}`;
    },
  };
}

console.log(getPerson().greet());
