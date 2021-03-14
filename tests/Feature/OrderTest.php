<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use App\Http\Middleware\Authenticate;
use Tests\TestCase;
use Illuminate\Support\Facades\Auth;
use App\Order;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseTransactions;



class OrderTest extends TestCase
{
    use WithoutMiddleware;

    /**
     * A basic feature test example.
     *
     * @return void
     */

    public function test_order_index()
    {
        $response = $this->get('/orderAjax');

        $response->assertStatus(200); // if run pass it means order controller index action works.
    }

    public function testAddOrder(){

        $response = $this->json('POST', '/orderAjaxCreate', ['user_id' => 1 , 'product_id' => 2, 'quantity' => 21 ]);

        $response
            ->assertStatus(200)
            ->assertExactJson([
                Config('constants.api.success_status') => Config('constants.api.success_message'),
            ]);
    }

    public function testEditOrder(){

        $response = $this->json('GET', '/orderAjaxEdit'.'/1');

        $response
            ->assertStatus(200)
            ->assertJsonPath('id' , 1);
    }

    public function testOrderAjaxDelete(){

        $response = $this->json('DELETE', '/orderAjaxDelete'.'/63');

        $response
            ->assertStatus(200)
            ->assertExactJson([
                Config('constants.api.success_status') => Config('constants.api.success_message'),
            ]);
    }




}
