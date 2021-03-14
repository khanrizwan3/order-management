<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Yajra\Datatables\Datatables;
use App\Models\Order;
use App\Models\Product;
use App\Models\User;
use App\Models\Discount;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;


class OrderController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        if ($request->ajax()) {

            $data = $this->__search($request);

            return Datatables::of($data)
                    ->addIndexColumn()
                    ->addColumn('action', function($row){
                           $btn = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="'.$row->id.'" data-original-title="Edit" class="edit btn btn-primary btn-sm editItem">Edit</a>';

                           $btn = $btn.' <a href="javascript:void(0)" data-toggle="tooltip"  data-id="'.$row->id.'" data-original-title="Delete" class="btn btn-danger btn-sm deleteItem">Delete</a>';
                            return $btn;
                    })
                    ->rawColumns(['action'])
                    ->make(true);
        }

        $products = Product::all();
        $users = User::all();

        return view('order/orderAjax',compact('products','users'));
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        Order::updateOrCreate(['id' => $request->Item_id],
        ['user_id' => $request->user_id,
        'product_id' => $request->product_id,
        'quantity' => $request->quantity,
        'total_price' => Discount::getApplyDiscountOnPrice($request->product_id,$request->quantity),
        'status' => Config('constants.numbers.number_hundred'),
        ]);
        Session::flash('success', 'File has been uploaded successfully!');

        return response()->json([ Config('constants.api.success_status') => Config('constants.api.success_message') ]);
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $item = Order::find($id);
        return response()->json($item);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
       Order::find($id)->delete();

       return response()->json([ Config('constants.api.success_status') => Config('constants.api.success_message') ]);
    }

    public function __search($request){

        $datatable = DB::table('orders');

        if(isset($request->time_search)){ // if time search is set

            if(isset($request->time_search) && isset($request->text_search)){ // if time search and search query both are set

                $time_search_query = '';
                if($request->time_search == 7){ // text search from last 7 days
                    $time_search_query = 'Date(orders.created_at) >= (CURDATE() - INTERVAL '.$request->time_search.' DAY)';
                } else {
                    $time_search_query = 'Date(orders.created_at) = CURDATE()';
                }
                $datatable->whereRaw($time_search_query)
                        ->where('products.name', 'LIKE', '%'.$request->text_search.'%')
                        ->orWhere('users.name', 'LIKE', '%'.$request->text_search.'%');
            } else {
                if($request->time_search == 7){ // if time search from last days
                    $datatable->whereRaw('Date(orders.created_at) >= (CURDATE() - INTERVAL '.$request->time_search.' DAY)');
                } else { // if time search is current day
                    $datatable->whereRaw('Date(orders.created_at) = CURDATE()');
                }
            }

        } elseif(isset($request->text_search) && !isset($request->time_search)){ // if
            $datatable->where('products.name', 'LIKE', '%'.$request->text_search.'%')
                        ->orWhere('users.name', 'LIKE', '%'.$request->text_search.'%');

        } else {
            // else show all records already covered below.
        }

        $data = $datatable
        ->join('products', 'products.id', '=', 'orders.product_id')
        ->join('users', 'users.id', '=', 'orders.user_id') // you may add more joins based on your criteria for now i have join produc.ts and users tables
        ->select('orders.*','users.name AS user_name', 'products.name AS product_name')
        ->orderBy('orders.id', 'DESC')
        ->get();

        return $data;

    }
}
