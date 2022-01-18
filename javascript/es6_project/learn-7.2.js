function log(strategy) {
  strategy.handle();
}

log(
  new (class {
    handle() {
      console.log("Handler My log");
    }
  })()
);
