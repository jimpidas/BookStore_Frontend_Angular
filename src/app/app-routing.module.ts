import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { SignupComponent } from './pages/signup/signup.component';
import { RegisterComponent } from './components/register/register.component';
import { LoginComponent } from './components/login/login.component';
import { DashboardComponent } from './components/dashboard/dashboard.component';
import { ForgotpasswordComponent } from './components/forgotpassword/forgotpassword.component';
import { BookDisplayComponent } from './components/book-display/book-display.component';
import { BookDetailsComponent } from './components/book-details/book-details.component';
import { WishlistComponent } from './components/wishlist/wishlist.component';
import { CartComponent } from './components/cart/cart.component';

const routes: Routes = [{
  path: '',component: SignupComponent,
  children: [
    { path: 'register', component: RegisterComponent },
    { path: 'login', component: LoginComponent }
  ],},
   {path: 'dashboard', component:DashboardComponent,
   children: [
    { path: 'books',component:BookDisplayComponent},
    { path: 'details/:bookId',component:BookDetailsComponent},
    { path: 'wishlist',component:WishlistComponent},
    { path: 'cart',component:CartComponent},
   ]
  },
   {path: 'forgotpassword', component: ForgotpasswordComponent}
  ];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
