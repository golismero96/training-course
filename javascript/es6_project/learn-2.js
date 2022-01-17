class TaskCollection {
  constructor(tasks = []) {
    this.tasks = tasks;
  }
  logs() {
    // this.tasks.forEach(function (task) {
    // this.tasks.forEach((task) => {
    //   // fat arrow function
    //   console.log(task);
    // });

    // so:
    this.tasks.forEach((task) => console.log(task));
  }
}

class Task {}

new TaskCollection([new Task(), new Task(), new Task()]).logs();

new TaskCollection(["mostafa", "ahmad", "sasan"]).logs();
