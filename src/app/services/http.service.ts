import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { HttpClient } from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class HttpService {

  CleanUrl:any;
  BaseUrl= environment.BaseUrl;
   remove_non_ascii(str:any) {
  
    if ((str===null) || (str===''))
         return false;
   else
     str = str.toString();
    
    return str.replace(/[^\x20-\x7E]/g, '');
  }
  
  


  constructor(private http:HttpClient) { }


  post(url: any, data : any, headers:any)
  {
    this.CleanUrl= this.remove_non_ascii(this.BaseUrl + url);
    if(headers != null)
    {
    return this.http.post(this.CleanUrl, data,headers);
    }
    return this.http.post(this.CleanUrl, data);
  }

  get(url:any,headers:any)
  {
    this.CleanUrl= this.remove_non_ascii(this.BaseUrl + url);
    return this.http.get(this.CleanUrl,headers);
  }

  
}
