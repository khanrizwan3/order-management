<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Product;

class Discount extends Model
{
    use HasFactory;

    static function getApplyDiscountOnPrice($product_id, $quantity){
        $product = Product::find($product_id);
        $totalPrice = $product->price * $quantity;
        $discountedPrice = 0;
        $discount = self::where('product_id', '=', $product_id)->where('quantity','<=',$quantity)->first();
        if(isset($discount->discount_percent)){
            $discountedPrice = ($discount->discount_percent) * ($totalPrice / Config('constants.numbers.number_hundred'));
            $totalPrice = $totalPrice - $discountedPrice;
        }

        return $totalPrice;
    }
}
