<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        DB::table('products')->insert([
            ['name' => 'Pepsi',
            'description' => 'Pepsi beverage.',
            'price' => 3.84,
            'status' => 1,
            'created_at' => now(),
            'updated_at' => now()
            ],['name' => 'Coca Cola',
            'description' => 'Coca Cola beverage.',
            'price' => 3.84,
            'status' => 1,
            'created_at' => now(),
            'updated_at' => now()
            ],
        ]);

    }
}
