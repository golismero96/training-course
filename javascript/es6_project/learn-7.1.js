class User {
  constructor(username, email) {
    this.username = username;
    this.email = email;
  }

  changeEmail(newEmail) {
    this.email = newEmail;
  }

  static register(...args) {
    // static register(username, email)
    return User(...args);
  }
}

let user = User.register("Mostafa", "golismero96@gmail.com");

user.changeEmail("golismero@gmail.com");

console.log(user.username + ": " + user.email);
