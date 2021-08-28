import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { UserService } from 'src/app/services/user.service';
@Component({
  selector: 'app-wishlist',
  templateUrl: './wishlist.component.html',
  styleUrls: ['./wishlist.component.scss']
})
export class WishlistComponent implements OnInit {
  wishlistArray:any;
  constructor(private service:UserService,
    private router:Router,
    private acRoute:ActivatedRoute) { }
  getWishlist(){
    this.service.getWishList().subscribe((dataReturned:any)=>{
      console.log(dataReturned);
      this.wishlistArray = dataReturned.data;
    })
  }
  ngOnInit(): void {
    this.getWishlist();
  }

}
