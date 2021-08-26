import { Component, OnInit } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { UserService } from 'src/app/services/user.service';
import {FormBuilder, FormGroup, Validators, FormControl} from '@angular/forms';
import { Router } from '@angular/router';
import { MatSnackBarConfig,MatSnackBarHorizontalPosition,MatSnackBarVerticalPosition,} from '@angular/material/snack-bar';

@Component({
  selector: 'app-forgotpassword',
  templateUrl: './forgotpassword.component.html',
  styleUrls: ['./forgotpassword.component.scss']
})
export class ForgotpasswordComponent implements OnInit {
  
 
  ForgetForm:FormGroup
  action: boolean = false;
  setAutoHide: boolean = false;
  constructor(private formBuilder:FormBuilder,private userSevice: UserService,public snackBar: MatSnackBar,private router: Router) {

    this.ForgetForm = this.formBuilder.group(
      {
        email: new FormControl('', [Validators.required])
      }
    );   

   }

  ngOnInit(): void {
  }
  openSnackBar(message: string, duration: number) {
    let config = new MatSnackBarConfig();
    if (duration != 0)
    {
      config.duration = duration; 
    }
    this.snackBar.open(message, undefined, config);
  }
  
  forgot(){

    if(this.ForgetForm.valid){
     
      this.openSnackBar('processing', 0); 
      let reqData ={
        email: this.ForgetForm.get('email')?.value,
      }
      this.userSevice.ForgetPassword(reqData).subscribe(
        (response: any) => {
          console.log(response);
          this.openSnackBar('password reset link has been sent to your registered email', 2000);
          //this.router.navigateByUrl('/ResetPassword/:token');
        },
        error => {
            this.openSnackBar('Sending password reset link failed: '+error.error.message,2000);
        });
    } 
  }
}
