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
  Review:string = "";
  ratingsArray:any; 
  constructor(private activatedRoute:ActivatedRoute,
    private service:UserService,
    private snackbar:MatSnackBar) { }
    getBook(id:number){
      this.service.getBook(id).subscribe((dataReturned:any)=>{
        console.log(dataReturned);
        this.Book = dataReturned.data;
      })
    }
   
  ngOnInit(): void {
    this.getBook(parseInt(this.activatedRoute.snapshot.paramMap.get("bookId")));
  }
  AddToBag(){
  }
  AddToWishlist(){
    this.bookIdentifier = this.activatedRoute.snapshot.paramMap.get("bookId");
    this.service.addToWishList(parseInt(this.bookIdentifier)).subscribe((dataReturned:any)=>{
      this.snackbar.open("Book Added To Wishlist","Okay");
      console.log(dataReturned);
    })
  }
  onFeedbackClicked(){}
  
}
