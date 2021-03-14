<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use App\Http\Middleware\Authenticate;
use Tests\TestCase;
use Illuminate\Support\Facades\Auth;
use App\User;
use Illuminate\Database\Eloquent\Factories\Factory;



class OrderTest extends TestCase
{
    /**
     * A basic feature test example.
     *
     * @return void
     */
    public function test_example()
    {
        $response = $this->get('/');

        $response->assertStatus(200);
    }

    public function test_order_index()
    {
        $response = $this->get('/orderAjax');

        $response->assertStatus(302); // if run pass it means authorization redirection works.
    }

    public function testLogin(){

        $user = factory(User::class)->create([
            'name' => 'Test',
            'email' => 'test@hotmail.com',
            // note you need to use the bcrypt function here to hash your password
            'password' => bcrypt('123456')
        ]);

        $response = $this->post('login', [
            'name' => 'Test',
            'email' => 'test@hotmail.com',
            'password' => '123456'
        ]);

        //this works
        $response->assertRedirect('/');

        //this fails
        $this->assertTrue(Auth::check());
    }
}
