import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/services/user.service';
import { ActivatedRoute } from '@angular/router';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-book-details',
  templateUrl: './book-details.component.html',
  styleUrls: ['./book-details.component.scss']
})
export class BookDetailsComponent implements OnInit {
  rating:number = 0;
  starCount:number = 5;
  Book:object;
  bookIdentifier:string;
  cartIdentifier:string;
  Review:string = "";
  ratingsArray:any; 
  constructor(private activatedRoute:ActivatedRoute,
    private service:UserService,
    private snackbar:MatSnackBar) { }

    getBook(bookId:number){
      this.service.getBook(bookId).subscribe((dataReturned:any)=>{
        console.log(dataReturned);
        this.Book = dataReturned.data;
        console.log("working",this.Book)
      })
    }
    getReviews(){
      this.service.getFeedback().subscribe((dataReturned:any)=>{
        console.log(dataReturned);
        this.ratingsArray = dataReturned.data;
      })
    }
   
  ngOnInit(): void {
    this.getBook(parseInt(this.activatedRoute.snapshot.paramMap.get("bookId")));
    this.getReviews();
  }
  onRatingChanged(rating){
    console.log(rating);
    this.rating = rating;
  }

  AddToBag(){
    this.cartIdentifier = this.activatedRoute.snapshot.paramMap.get("bookId");
    this.service.addToCart(parseInt(this.cartIdentifier)).subscribe((dataReturned:any)=>{
      this.snackbar.open("Book Added To Cart","Okay");
      console.log(dataReturned);
    })
  }
  AddToWishlist(){
    this.bookIdentifier = this.activatedRoute.snapshot.paramMap.get("bookId");
    this.service.addToWishList(parseInt(this.bookIdentifier)).subscribe((dataReturned:any)=>{
      this.snackbar.open("Book Added To Wishlist","Okay");
      console.log(dataReturned);
    })
  }
  onFeedbackClicked(){

    let data = {
      "bookId": parseInt(this.activatedRoute.snapshot.paramMap.get("bookId")),
      "review": this.rating,
      "feedback": this.Review
    }
    this.service.addFeedback(data).subscribe((dataReturned:any)=>{
      console.log(dataReturned);
      console.log(dataReturned.message);
      this.snackbar.open(dataReturned.message,"okay")
      this.Review="";
      this.rating=0;
    },(err)=>
    { 
      this.snackbar.open(err?.error.message,"okay")
    });
  }
  
}
