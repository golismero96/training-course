<template>
  <div id="todo">
    <div class="container mt-5">
      <div class="row justify-content-md-center">
        <div class="col-md-8 bg-white p-3">
          {{name}}'s' To-do List

          <hr />

          <div class="">
            <input type="checkbox" id="hide" v-model="hide" class="from-check-input">
            <label for="hide"> Hide/Show</label>
          </div>
          
          <div class="d-flex justify-content-between px-3 py-2" v-for="l in hiddenList" v-bind="l.list">
            <div>{{l.task}}</div>
            <div>
              <input type="checkbox" v-model="l.comp" class="form-check-input" />
              {{l.comp}}
            </div>
          </div>

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
      hide: true
    }
  },
    computed: {
      hiddenList() {
        return this.hide ?
        this.list.filter(l => !l.comp) : this.list
      }
    }
}
</script>

<style>
body {
  background-color: #F8F8F8F8 !important;
}
</style>
