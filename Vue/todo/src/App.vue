<template>
  <div id="todo">
    <div class="container mt-5">
      <div class="row justify-content-md-center">
        <div class="col-md-8 bg-white p-3">
          <div class="d-flex justify-content-between">

          <div class="lead">{{name}}'s' To-do List</div>
          <div>
            <input type="checkbox" id="hide" v-model="hide" class="from-check-input me-2">
            <label class="form-check-label" for="hide">Hide Completed</label>
          </div>
          </div>

          <div class="row py-2">
            <div class="col-12 col-md-2">
              <button class="btn btn-primary" v-on:click="addNewTodo">Add New</button>
            </div>
            <div class="col">
              <input v-model="newItemText" class="form-control">
            </div>
          </div>
          <hr />

          
          <div class="d-flex justify-content-between px-3 py-2" v-for="l in hiddenList" v-bind="l.list">
            <div>{{l.task}}</div>
            <div>
              <input type="checkbox" v-model="l.comp" class="form-check-input" />
              {{l.comp}}
            </div>
          </div>
          
          <button class="btn btn-primary" v-on:click="deleteItem">Delete</button>

        </div>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  name: 'App',
  data() {
    return {
      name: "Mostafa",
      list: [
        {task: "Go Shopping", comp: false},
        {task: "Pick up kids", comp: false},
        {task: "Make dinner", comp: true},
        {task: "Have a drink", comp: false}
      ],
      hide: true,
      newItemText: ""
    }
  },
    computed: {
      hiddenList() {
        return this.hide ?
        this.list.filter(l => !l.comp) : this.list
      }
    },
    methods: {
      addNewTodo() {
        this.list.push({
          task: this.newItemText,
          comp: false
        });
        localStorage.setItem('listItems', JSON.stringify(this.list));
        this.newItemText = "";
      },
      deleteItem() {
        this.list = this.list.filter(l => !l.comp)
        localStorage.setItem('listItems', JSON.stringify(this.list))
      }
    },
    created() {
      let data = localStorage.getItem("listItems");
      if (data != null) {
        this.list = JSON.parse(data);
      }
    }
}
</script>

<style>
body {
  background-color: #F8F8F8F8 !important;
}
</style>
