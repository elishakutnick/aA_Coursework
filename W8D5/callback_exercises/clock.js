class Clock {
    constructor() {
        const currentTime = new Date();
        this.seconds = currentTime.getSeconds();
        this.minutes = currentTime.getMinutes();
        this.hours = currentTime.getHours();
        this.printTime();
        // 4. Schedule the tick at 1 second intervals.
        setInterval(this._tick.bind(this), 1000);
    }

    printTime() {
        let timeInString = `${this.hours}:${this.minutes}:${this.seconds}`
        console.log(timeInString);
    }

    _tick() {
      
      this.seconds += 1; 

      if (this.seconds === 60) {
        this.seconds = 0;
        this.minutes += 1;
      } 

      if (this.minutes === 60) {
        this.minutes = 0;
        this.hours = (this.hours + 1) % 24;
        }

        this.printTime();
    }
}
const clock = new Clock();