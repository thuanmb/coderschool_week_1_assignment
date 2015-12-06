class WelcomeController < ApplicationController

    def activeClass(section)
        className = params[:section] == section ? 'active' : ''
        sprintf '<li role="presentation" class="%s %s">', section, className
    end
    helper_method :activeClass

    def setUrlParam(name, value)
        url = request.original_url
        uri = URI.parse(url)

        if uri.query != nil
            queryParams = CGI.parse(uri.query)

            if value != nil
                queryParams[name] = [value]
            else
                queryParams.except!(name)
            end

            result = sprintf('%s?', request.path)

            queryParams.each do |param|
                if result[-1, 1] != '?'
                    result += '&'
                end

                result += sprintf('%s=%s', param[0], param[1][0])
            end
        elsif 
            if value != nil
                result = sprintf('%s?%s=%s', request.path, name, value)
            else
                result = request.path
            end
        end
            
        result
    end
    helper_method :setUrlParam

    def index
    end

    def contact_us
    end

    def menu
        section = SECTIONS[0]
        if params[:section].present?
            section = params[:section]   
        end

        @foods = Food.where({section: section})

        if params[:filterBy] != nil
            filterBy = params[:filterBy].to_i
            @foods = @foods.where(type_of_cuisine: filterBy)
        end

        if params[:orderBy] != nil
            case params[:orderBy].to_i
                when SORT_OPTION_ID[:NAME_ASC]
                    @foods = @foods.order(:name)

                when SORT_OPTION_ID[:NAME_DESC]
                    @foods = @foods.order(name: :desc)
                    
                when SORT_OPTION_ID[:PRICE_ASC]
                    @foods = @foods.order(:price)
                    
                when SORT_OPTION_ID[:PRICE_DESC]
                    @foods = @foods.order(price: :desc)

                when SORT_OPTION_ID[:VIEWED_ASC]
                    @foods = @foods.order(:num_of_viewed)

                when SORT_OPTION_ID[:VIEWED_DESC]
                    @foods = @foods.order(num_of_viewed: :desc)
                    
            end    
        end
        
    end
end
