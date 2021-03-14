@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <form class="form-info form-inline1 form-search" action="javascript:;">
                <div class="ibox-body">
                    <div class="row">
                        <div class="col-sm-3 form-group mb-4">
                            <label>Search</label>
                            <input class="form-control text-search" id="text-search" type="text" placeholder="">
                        </div>
                        <div class="col-sm-3 form-group">
                        <label>Search</label>

                        <div class="row last-row">
                            <div class="col-sm-6 form-group element-1" >
                                <select class="form-control status-search" id="status-search" name="status" >
                                    <option value="">All time</option>
                                    <option value="7">7 days</option>
                                    <option value="1">Today</option>
                                </select>
                            </div>

                            <div class="col-sm-6 form-group element-2" >
                                <button class="btn btn-info button-search" id="btnFiterSubmitSearch" type="button">Search</button>
                            </div>
                        </div>

                        </div>
                    </div>
                </div>
            </form>
        </div>
      <div class="col-md-12">
        <div class="card mt-5">
          <div class="card-header">
             <div class="col-md-12">
                 <h4 class="card-title"> Manage Orders
                   <a class="btn btn-success ml-5" href="javascript:void(0)" id="createNewOrder"> Create New Order</a>
                 </h4>
             </div>
          </div>
          <div class="card-body">
            <table class="table table-bordered data-table" >
                 <thead>
                     <tr>
                         <th width="5%">No</th>
                         <th>Username</th>
                         <th>Product Name</th>
                         <th>Quantity</th>
                         <th>Total Price</th>
                         <th>Created At</th>
                         <th width="15%">Action</th>
                     </tr>
                 </thead>
                 <tbody>
                 </tbody>
             </table>
         </div>
         <div class="modal fade" id="ajaxModel" aria-hidden="true">
             <div class="modal-dialog">
                 <div class="modal-content">
                     <div class="modal-header">
                         <h4 class="modal-title" id="modelHeading"></h4>
                     </div>
                     <div class="modal-body">
                         <form id="OrderForm" name="OrderForm" class="form-horizontal">
                            <input type="hidden" name="Item_id" id="Item_id">
                             <div class="form-group">
                                 <label for="name" class="col-sm-2 control-label">User</label>
                                 <div class="col-sm-12">
                                     <select class="form-control" id="user" name="user_id">
                                        @foreach ($users as $user)
                                            <option value="{{ $user->id }}">{{ $user->name }}</option>
                                        @endforeach
                                    </select>
                                 </div>
                             </div>
                             <div class="form-group">
                                 <label class="col-sm-3 control-label">Product</label>
                                 <div class="col-sm-12">
                                    <select class="form-control" id="product" name="product_id">
                                        @foreach ($products as $product)
                                            <option value="{{ $product->id }}">{{ $product->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                             </div>
                             <div class="form-group">
                                <label class="col-sm-3 control-label">Quantity</label>
                                <div class="col-sm-12">
                                    <input type="text" id="quantity" name="quantity" required="" placeholder="Enter Quantity" class="form-control">
                                </div>
                            </div>
                             <div class="col-sm-offset-2 col-sm-10">
                              <button type="submit" class="btn btn-primary" id="saveBtn" value="create">Save changes
                              </button>
                             </div>
                         </form>
                     </div>
                 </div>
             </div>
          </div>
        </div>
      </div>
    </div>
  </div>


  <script type="text/javascript">


    $(function () {

      $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
      });

      var table = $('.data-table').DataTable({
          processing: true,
          serverSide: true,
          searching: false,
          ajax: {
            url: "{{ route('orderAjax') }}",
            type: 'GET',
            data: function (d) {
            d.text_search = $('#text-search').val();
            d.time_search = $('#status-search').val();
            }
        },
          columns: [
              {data: 'DT_RowIndex', name: 'DT_RowIndex'},
              {data: 'user_name', name: 'user_name'},
              {data: 'product_name', name: 'product_name'},
              {data: 'quantity', name: 'quantity'},
              {data: 'total_price', name: 'total_price'},
              {data: 'created_at', name: 'created_at'},
              {data: 'action', name: 'action', orderable: false, searchable: false},
          ]
      });

      $('#createNewOrder').click(function () {
          $('#saveBtn').val("create-Item");
          $('#Item_id').val('');
          $('#OrderForm').trigger("reset");
          $('#modelHeading').html("Create New Order");
          $('#ajaxModel').modal('show');
      });

      $('body').on('click', '.editItem', function () {
        var id = $(this).data('id');
        $.get("{{ route('orderAjaxEdit', '') }}"+"/"+id, function (data) {
            $('#modelHeading').html("Edit Order");
            $('#saveBtn').val("edit-user");
            $('#ajaxModel').modal('show');
            $('#Item_id').val(data.id);
            $('#user').val(data.user_id);
            $('#product').val(data.product_id);
            $('#quantity').val(data.quantity);
        })
     });

      $('#saveBtn').click(function (e) {
          e.preventDefault();
          $(this).html('Sending..');

          $.ajax({
            data: $('#OrderForm').serialize(),
            url: "{{ route('orderAjaxCreate') }}",
            type: "POST",
            dataType: 'json',
            success: function (data) {

                $('#OrderForm').trigger("reset");
                $('#ajaxModel').modal('hide');
                table.draw();

                flashMessage(data);

            },
            error: function (data) {
                console.log('Error:', data);
                $('#saveBtn').html('Save Changes');
            }
        });
      });

      $('body').on('click', '.deleteItem', function () {

          var Item_id = $(this).data("id");
          confirm("Are You sure want to delete !");

          $.ajax({
              type: "DELETE",
              url: "{{ route('orderAjaxDelete', '') }}"+'/'+Item_id,
              success: function (data) {
                  table.draw();
              },
              error: function (data) {
                  console.log('Error:', data);
              }
          });
      });

    });


    $('#btnFiterSubmitSearch').click(function(){
        $('.data-table').DataTable().draw(true);
    });
  </script>

@endsection
