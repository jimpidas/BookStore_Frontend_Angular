import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators,FormControl } from '@angular/forms';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';

import { UserService } from 'src/app/services/user.service';



@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {

  hide:boolean = true;
  submitted:boolean = false;
  registerForm: FormGroup;
  

  constructor( private formBuilder: FormBuilder,
    private service:UserService,
    private snackBar :MatSnackBar) {

      this.registerForm = this.formBuilder.group(
        {
          FullName: new FormControl('', [Validators.required]), 
          Email: new FormControl('', [Validators.required, Validators.email]),
          Password: new FormControl('', [Validators.required, Validators.minLength(6)]),
          MobileNo:  new FormControl('', [Validators.required,Validators.minLength(10)])
        });   

     }

  ngOnInit(): void {
   
  }
  get f() { return this.registerForm.controls; }
  
  submit() {
    this.submitted = true;
    
    if (this.registerForm.invalid) {
        return;
    }
    let data = {
      "FullName":this.f.FullName.value,
      "Email":this.f.Email.value,
      "Password":this.f.Password.value,
      "MobileNo":this.f.MobileNo.value
    }
    this.service.register(data).subscribe((dataReturned:any) =>{ 
      console.log(dataReturned);
     
      this.snackBar.open("Register Successful","Okay")
    })
}

}


