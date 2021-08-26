import { Component, OnInit } from '@angular/core';
import { Route } from '@angular/compiler/src/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent implements OnInit {
  profileDialogShown:boolean = false;
  userSignedOff:boolean = true;
  email= ""
  constructor(private route:Router) { }
  color:string = "white";
  SignOut(){
    localStorage.clear();
    this.route.navigate(['login']);
  }
  Login(){
    this.route.navigate(['login']);
  }

  ngOnInit(): void { 

    if(localStorage.getItem("token"))
    {
      this.email = localStorage.getItem("email");
      this.userSignedOff = false;
    }
  }
  profileDialogShownToggle(){
    this.profileDialogShown = ! this.profileDialogShown;
  }

}
