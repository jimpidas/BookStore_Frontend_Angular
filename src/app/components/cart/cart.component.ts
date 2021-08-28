import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/services/user.service';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.scss']
})
export class CartComponent implements OnInit {
  quantity:number=1;
  Book:any;
  constructor(private service:UserService,
    private router:Router,
    private acRoute:ActivatedRoute) { }

  getCarts(){
    this.service.getCarts().subscribe((dataReturned:any)=>{
      console.log(dataReturned);
      this.Book = dataReturned.data;
      console.log("returning data",this.Book);
    })
  }
  ngOnInit(): void {
    this.getCarts();
  }
 

}
