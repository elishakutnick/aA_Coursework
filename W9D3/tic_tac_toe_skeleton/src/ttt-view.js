class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    this.bindEvents();

  }

  bindEvents() {
    this.$el.on("click", "li", event => { 
      const $square = $(event.currentTarget);
      this.makeMove($square);
    })
  }

  makeMove($square) {
    const pos = $square.data("pos");
    this.game.playMove(pos);
    $square.html(this.game.currentPlayer);
    $square.addClass(this.game.currentPlayer)
    try { 
      this.game.playMove(pos);
    }
    catch(err) {
      alert("Not an empty position!");
      return;
  }

    if (this.game.isOver()) { 
      if (this.game.winner()) {
        alert(`${this.game.currentPlayer} is the winner!`);
      } else { 
        alert("It's a tie!"); 
      }
    }
  }

  setupBoard() {
    let $ul = $("<ul>");
    for(let i=0; i<3; i++) {
      for(let j=0; j<3; j++) {
        let $li = $("<li>");
        $li.addClass('box');
        $li.data("pos",[i,j]);
        $ul.append($li)
      }
    }
    this.$el.append($ul);
  }




}


 

  



module.exports = View;
