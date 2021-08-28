import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';

@Component({
  selector: 'app-start-rating',
  templateUrl: './start-rating.component.html',
  styleUrls: ['./start-rating.component.scss']
})
export class StartRatingComponent implements OnInit {

  @Input('rating') private rating: number = 3;
  @Input('starCount') public starCount: number = 5;
  @Input('color') private color: string = 'accent';
  @Output() private ratingUpdated = new EventEmitter();

  public ratingArr = [];
  constructor() { }

  ngOnInit(): void {
    console.log("a "+this.starCount)
    for (let index = 0; index < this.starCount; index++) {
      this.ratingArr.push(index);
    }
  }
  onClick(rating:number) {
    this.ratingUpdated.emit(rating);
    return false;
  }
  showIcon(index:number) {
    if (this.rating >= index + 1) {
      return 'star';
    } else {
      return 'star_border';
    }
  }
}
