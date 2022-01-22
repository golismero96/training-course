let items = new Set(["one", "two", "two", "three"]); // size: 3

items.add("four");

items.delete("two");

console.log(items);

let langs = new Set(["python", "js", "php", "dart"]);

console.log([...langs].filter((lang) => lang.length === 4));
