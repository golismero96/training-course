class User {
  constructor(name, isAdmin) {
    this.name = name;
    this.isAdmin = isAdmin;
  }
}

let users = [
  new User("Amin", false),
  new User("Amir", false),
  new User("Mostafa", true),
];

console.log(users.find((user) => user.isAdmin).name);
