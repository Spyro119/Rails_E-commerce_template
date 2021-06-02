/** ********************************************** **
	@Shop Demo [usage example]
	@Last Update	10:19 AM Wednesday, May 13, 2015
*************************************************** **/
(function() {
	jQuery(document).ready(function() {
	  return $('a[data-target]').click(function(e) {
		e.preventDefault();
		$this = $(this);
		if ($this.data('target') === 'Add to') {
		  url = $this.data('addurl');
		  new_target = "Remove from";
		} else {
		  url = $this.data('removeurl');
		  new_target = "Add to";
		}
		$.ajax({
		  url: url,
		  beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
		  type: 'put',
		  success: function(data) {
			  console.log(data);
			$('.cart-count').html(data);
			$this.find('span').html(new_target);
			return $this.data('target', new_target);
		  },
		  error: function(error, errorthrown, status) {
			  console.log(error, errorthrown, status)
		  }
		});
		return $('#mycart .remove').click(function(e) {
		  e.preventDefault();
		  $this = $(this).closest('a');
		  url = $this.data('targeturl');
		  return $.ajax({
			url: url,
			type: 'put',
			success: function(data) {
			  $('.cart-count').html(data);
			  return $this.closest('.cart-item').slideUp();
			}
		  });
		});
	  });
	});
  
  }).call(this);


jQuery(document).ready(function() {

	_shop();

});



/**	_shop() 
******************************* **/
function _shop() {



	/* ******************* PHP URL TO POST *************** */
	var URL_POST = 'php/view/demo.shop.php'; // CHANGE IT!
	/* *************************************************** */




	/** ADD TO WISHLIST 
	 ** *********************** **/
	jQuery("a.add-wishlist").bind("click", function(e) {
		e.preventDefault();

		var item_id = jQuery(this).attr('data-item-id');

		if(parseInt(item_id) < 1) {
			return false;
		}

		$.ajax({
			url: 	URL_POST,
			data: 	{ajax:"true", action:'add_to_wishlist', item_id:item_id},
			type: 	"POST",
			error: 	function(XMLHttpRequest, textStatus, errorThrown) {

				// usualy on headers 404 or Internal Server Error
				_toastr("ERROR 404 - Item Not Added to wishlist!","top-right","error",false);

			},

			success: function(data) {
				data = data.trim(); // remove output spaces


				// PHP RETURN: INVALID ITEM ID
				if(data == '_invalid_id_') {

					_toastr("INVALID ID - Item Not Added to wishlist!","top-right","error",false);

				} else
				

				
				// PHP RETURN: OK, ADDED TO WISHLIST
				if(data == '_ok_') {

					_toastr("Item Added to Your wishlist!","top-right","success",false);



				// PHP RETURN: SOMETHING ELSE THAN EXPECTED
				} else {
					// if the php output is not _invalid_id_ OR _ok_ - maybe you have a php errors/warnings
					_toastr("UNKNOWN ERROR - Item Not Added to wishlist!","top-right","error",false);
				}

			}
		});
		
	});






	/** ADD TO COMPARE
	 ** *********************** **/
	jQuery("a.add-compare").bind("click", function(e) {
		e.preventDefault();

		var item_id = jQuery(this).attr('data-item-id');

		if(parseInt(item_id) < 1) {
			return false;
		}

		$.ajax({
			url: 	URL_POST,
			data: 	{ajax:"true", action:'add_to_compare', item_id:item_id},
			type: 	"POST",
			error: 	function(XMLHttpRequest, textStatus, errorThrown) {

				// usualy on headers 404 or Internal Server Error
				_toastr("ERROR 404 - Item Not Added to Compare List!","top-right","error",false);

			},

			success: function(data) {
				data = data.trim(); // remove output spaces


				// PHP RETURN: INVALID ITEM ID
				if(data == '_invalid_id_') {

					_toastr("INVALID ID - Item Not Added to Compare List!","top-right","error",false);

				} else
				

				
				// PHP RETURN: OK, ADDED TO WISHLIST
				if(data == '_ok_') {

					_toastr("Item Added to Your Compare List!","top-right","success",false); // OPTIONAL: REPLACE false WITH YOUR COMPARE LINK



				// PHP RETURN: SOMETHING ELSE THAN EXPECTED
				} else {
					// if the php output is not _invalid_id_ OR _ok_ - maybe you have a php errors/warnings
					_toastr("UNKNOWN ERROR - Item Not Added to Compare List!","top-right","error",false);
				}

			}
		});
		
	});


	produit_id = jQuery("#produit_id").val()




	/** PRODUCT SINGLE
	 ** *********************** **/

	/**
		@COLOR SELECTOR 
	**/
	jQuery("#product-color-dd li a").bind("click", function(e) {
		e.preventDefault();

		var data_val 	= jQuery(this).attr('data-val').trim();
			_color 		= jQuery(this).attr('href').trim();

		/* change visual value and hidden input */
		jQuery("#product-selected-color").css({"background-color":_color});
		jQuery("#color").val(data_val); // UPDATE HIDDEN FIELD
	});


	/**
		@SIZE SELECTOR 
	**/
	jQuery("#product_size").bind("click", function(e) {
		e.preventDefault();
		var data_val = jQuery("#product_size").val()
		
		console.log(data_val);
		/* change visual value and hidden input */
		jQuery("#product-selected-size>span").empty().append(data_val);
		jQuery("#size").val(data_val); // UPDATE HIDDEN FIELD

		$.ajax({
			url: `${produit_id}/populate_color_list`,
			type: "GET",
			data: {size_name: $(this).val()},
			error: function(XMLHttpRequest, errorTextStatus, error) {
				alert("Failed to submit : " + errorTextStatus + " ;" + error);
			   },
			   success: function(data) {
				if (data.length > 0 )
					{
						jQuery(".text-danger").replaceWith(`<span class="float-right text-success"><i class="fa fa-check"></i> Disponible </span>`);
						jQuery("#product_colors").attr("disabled", false);
						jQuery("#product_colors").empty();
						jQuery("#color").val(data[0].name);
						data.forEach(color => {
						console.log(color)

						jQuery("#product_colors").append(`<option value="${color.name}"> ${color.name} </option>`);
							
					});
					if (data[0].quantity > 0) {
						jQuery(".text-danger").replaceWith(`<span class="float-right text-success"><i class="fa fa-check"></i> Disponible </span>`);
						console.log(data[0].quantity)
						jQuery("#product_quantity").attr("disabled", false);
						jQuery("#product_quantity").empty();
						jQuery("#product_quantity").val(data[0].quantity[0]);
						for(var i=0; i < data[0].quantity; i++) {
							jQuery("#product_quantity").append(`<option value="${i + 1}"> ${i + 1} </option>` )
						}
					}else {
						jQuery("#product_quantity").attr("disabled", true);
						jQuery("#quantity").val(0);

						jQuery(".text-success").replaceWith(`<span class="float-right text-danger"><i class="fa fa-remove"></i> Couleur Non disponible </span>`);
					} 
					
				} else {
					jQuery("#product_colors").attr("disabled", true);
					jQuery("#colors").val();

					jQuery("#product_quantity").attr("disabled", true);
					jQuery("#quantity").val(0);

					jQuery(".text-success").replaceWith(`<span class="float-right text-danger"><i class="fa fa-remove"></i> Grandeur Non disponible </span>`);
				}
			}
		})

		// jQuery("#product-size-dd li").removeClass('active');
	});

	


	/**
		@QTY SELECTOR 
	**/
	jQuery("#product-qty-dd li a").bind("click", function(e) {
		e.preventDefault();
		
		var data_val = jQuery(this).attr('data-val').trim();
		console.log(data_val)

		/* change visual value and hidden input */
		jQuery("#product-selected-qty>span").empty().append(data_val);
		jQuery("#qty").val(data_val); // UPDATE HIDDEN FIELD

		/* change visual selected */
		jQuery("#product-qty-dd li").removeClass('active');
		jQuery(this).parent().addClass('active');
	});




	/** CHECKOUT
	 ** *********************** **/
	// New Account show|hide
	jQuery("#accountswitch").bind("click", function() {
		jQuery('#newaccount').slideToggle(200);
	});

	// Shipping Address show|hide
	jQuery("#shipswitch").bind("click", function() {
		jQuery('#shipping').slideToggle(200, function() {

			// scroll down to shipping area.
			if(jQuery('#shipping').is(":visible")) {
				_scrollTo('#shipping', 150);
			}
		
		});
	});

	// Payment Check/Money Order
	jQuery("#payment_check").bind("click", function() {
		jQuery("#ccPayment").slideUp(200);
	});

	// Credit Card
	jQuery("#payment_card").bind("click", function() {
		jQuery("#ccPayment").slideDown(200);
	});
}