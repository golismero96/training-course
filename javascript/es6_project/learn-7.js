class User {
  constructor(username, email) {
    this.username = username;
    this.email = email;
  }

  changeEmail(newEmail) {
    this.email = newEmail;
  }
}

let user = new User("Mostafa", "golismero96@gmail.com");

user.changeEmail("golismero@gmail.com");

console.log(user.name + ": " + user.email);
