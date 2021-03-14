<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;


class DiscountSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('discounts')->insert([
            ['title' => '20% discount on 3 Pepsi purchase',
            'product_id' => 1,
            'quantity' => 3,
            'discount_percent' => 20,
            'status' => 1,
            'created_at' => now(),
            'updated_at' => now()
            ]
        ]);
    }
}
