const name = ["mostafa", "hamed"];

name.push("shayan"); // ['mostafa', 'hamed', 'shayan']

const name = Object.freeze(["mostafa", "hamed"]);

name.push("shayan"); // error and result: ['mostafa', 'hamed']
