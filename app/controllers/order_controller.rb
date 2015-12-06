class OrderController < ApplicationController
    def new
        @order = Order.new
        @food_id = params['id']
    end

    def create
        @food_id = params[:food_id]
        @order = Order.new(order_param)
        food = Food.where({id: params[:food_id]})

        price = nil
        coupon = nil
        coupon_code = params[:order][:coupon_code]
        if coupon_code != ""
            coupon = Coupon.where({code: coupon_code}).first

            if coupon
                price = food.first.price * coupon.discount
            end
        end

        respond_to do |format|
            if (food.count == 0)
                format.html {redirect_to welcome_menu_path, alert: 'Fail to create your order due to food not found. Please choose another food!'}
            elsif coupon_code != "" && coupon == nil
                flash[:alert] = 'Coupon code does not exist.'
                format.html { render :action => :new, :food_id => @food_id }
            elsif @order.save
                @order.update_attribute(:food_id, @food_id)
                format.html {redirect_to order_thankyou_path(:order_id => @order.id, :food_id => @food_id, :update_price => price), notice: 'Order was successfully created.'}
            else
                format.html { render :action => :new, :food_id => @food_id }
                format.json { render json: @order.errors, status: :unprocessable_entity }
            end
        end
    end

    def thank_you
        @food = (Food.where :id => params[:food_id]).first
        @order = (Order.where :id => params[:order_id]).first
        @price = params[:update_price] ? params[:update_price] : @food.price
    end

    private
        def order_param
            params.require(:order).permit(:name, :phone_number, :address, :coupon_code).merge({food_id: params.require(:food_id)})
        end
end
