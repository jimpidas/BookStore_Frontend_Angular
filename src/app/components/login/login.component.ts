import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';
import { UserService } from 'src/app/services/user.service';
import {Router,ActivatedRoute,ParamMap} from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
  hide:boolean = true;
  submitted:boolean = false;
  loginForm: FormGroup;
  
  constructor(private formBuilder: FormBuilder,
    private service:UserService,
    private snackBar:MatSnackBar,
    private router:Router,
    private acRoute:ActivatedRoute) { }

  ngOnInit(): void {
    this.loginForm = this.formBuilder.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]],
  });
  }
  get f() { return this.loginForm.controls; }
  showLogin(){
    this.router.navigate(['login'],{relativeTo:this.acRoute});
  }
  showSignup(){
    this.router.navigate(['signup'],{relativeTo:this.acRoute});
  }
  submit() {
    this.submitted = true;
    
    if (this.loginForm.invalid) {
        return;
    }
    let data = {
      "email":this.f.email.value,
      "password":this.f.password.value
    }
    this.service.login(data).subscribe((dataReturned:any) =>{ 
      console.log(dataReturned);
     localStorage.setItem("email",dataReturned['email']);
     localStorage.setItem("token",dataReturned['token']);
      this.snackBar.open("Login Successful","Okay")
      this.router.navigate(['dashboard/books']);

    })
}
}
