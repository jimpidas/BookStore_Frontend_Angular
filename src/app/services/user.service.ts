import { Injectable } from '@angular/core';
import { HttpHeaders } from '@angular/common/http';
import { HttpService } from './http.service';


@Injectable({
  providedIn: 'root'
})
export class UserService {

  
  constructor(private httpService : HttpService) { }
  getHeaders = () => {
    return {
      headers: new HttpHeaders({
        'Content-type': 'application/json',
        Authorization: `Bearer ${localStorage.getItem('token')}`,
      }),
    };
  }

  register(data: any){
    
    return this.httpService.post('Customer​/Register', data,null);
  }

  login(data: any){

    return this.httpService.post('Customer/Login', data,null);
  }
  ForgetPassword(data: any){
    return this.httpService.post('Customer/Forgot Password', data,null);
  }

  getBooks () {
    return this.httpService.get('Book',false);
  }
  getBook = (id:number) =>{
    return this.httpService.get(`Book/${id}`,false);
  }
  addToWishList = (id:number)=>{
    return this.httpService.post(`WishList/${id}`,id,this.getHeaders());
  }
}
