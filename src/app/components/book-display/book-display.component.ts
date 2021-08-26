import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-book-display',
  templateUrl: './book-display.component.html',
  styleUrls: ['./book-display.component.scss']
})
export class BookDisplayComponent implements OnInit {
  BookQuanity:number = 0;
  booksArray:any;
  constructor(private service:UserService,
    private router:Router,
    private acRoute:ActivatedRoute) { }

    getBooks(){
      this.service.getBooks().subscribe((dataReturned:any)=>{
        console.log(dataReturned);
        this.booksArray = dataReturned.data;
        console.log("returning data",this.booksArray);
      })
    }

  ngOnInit(): void {
    this.getBooks();
  }
  showDescription(bookId:number){
    this.router.navigate([`dashboard/details/${bookId}`]);
  }
}
