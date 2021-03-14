<?php

use App\Http\Controllers\OrderController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('auth.login');
});

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::get('/orderAjax', [OrderController::class, 'index'])->name('orderAjax');

Route::get('/orderAjaxEdit/{id}', [OrderController::class, 'edit'])->name('orderAjaxEdit');

Route::post('/orderAjaxCreate', [OrderController::class, 'store'])->name('orderAjaxCreate');

Route::delete('/orderAjaxDelete/{id}', [OrderController::class, 'destroy'])->name('orderAjaxDelete');

Auth::routes();

