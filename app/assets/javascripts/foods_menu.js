function getFoodById (id) {
    return _.find(window.foods, function (food) {
        return food.id === id;
    });
}

function addActiveClassListItem () {
    var pathParams = location.pathname.split('/');
    $(".nav.nav-pills li").removeClass('active');

    if (pathParams.length == 3 || pathParams[3] == 'Breakfast') { // home
        $('.nav.nav-pills li.Breakfast').addClass('active');
    } else if (pathParams[3] == 'Launch') {
        $('.nav.nav-pills li.Launch').addClass('active');
    } else if (pathParams[3] == 'Dinner') {
        $('.nav.nav-pills li.Dinner').addClass('active');
    } else {
        $('.nav.nav-pills li.Drinks').addClass('active');
    }
}

$(document).ready(function () {
    var container = $(".food-details-container");
    $(".welcome.menu .food-list").click(function (e) {
        e.preventDefault();

        var id = $(e.target).data("id");
        var food = getFoodById(id);
        container.empty();

        FoodDetail.getInstance().show(container, food);

        $.ajax({
            type: "POST",
            url: 'http://localhost:3000/stats/foodViewed',
            contentType: "application/json",
            data: JSON.stringify({"id": food.id}),
            success: function () {
                console.log('Increasing count success for food id: ' + food.id);

                food.num_of_viewed += 1;

                $('.food-list a[data-id*="{0}"] .badge.viewed-count'.format(food.id)).html(food.num_of_viewed);
            }
        });
    });

    // highlight the menu
    addActiveClassListItem();
});

function FoodDetail () {
}

FoodDetail.instance = undefined;
FoodDetail.getInstance = function () {
    if (!FoodDetail.instance) {
        FoodDetail.instance = new FoodDetail();
    }

    return FoodDetail.instance;
};

FoodDetail.HTML = 
    '<div class="card food-details">' +
        '<img class="card-img-top" src="{0}" alt="{1}">' +
        '<div class="card-block">' +
            '<h2 class="card-title">{2}</h2>' +
            '<h4 class="card-text price">{3}</h4>' +
            '<p class="card-text description">{4}</p>' +
            '<a href="/order/new/{5}" class="btn btn-primary">Order</a>' +
        '</div>' +
    '</div>';

FoodDetail.prototype.show = function(container, food) {
    if (!food) {
        return;
    }

    var view = $(FoodDetail.HTML.format(
        food.imageUrl,
        food.name,
        food.name,
        parseInt(food.price).formatMoney(1, '.', ',') + ' VND',
        food.description,
        food.id
    ));

    container.append(view);
};