class StatsController < ApplicationController
    before_filter :parse_request
    def foodViewed
        food = Food.where(id: @json['id']).first

        if food
            count = food.num_of_viewed
            if !count
                count = 1
            end

            food.update_attribute(:num_of_viewed, count + 1)
        end

        render :text =>  @json['id']
    end

    private
        def parse_request
            @json = JSON.parse(request.body.read)
        end
end
