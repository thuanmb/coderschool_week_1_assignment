SECTIONS = ["Breakfast", "Launch", "Dinner", "Drinks"]

SORT_OPTION_ID = {
    :NAME_ASC => 0,
    :NAME_DESC => 1,
    :PRICE_ASC => 2,
    :PRICE_DESC => 3,
    :VIEWED_ASC => 4,
    :VIEWED_DESC => 5,
}

SORT_OPTION = [
    {:id => SORT_OPTION_ID[:NAME_ASC], :html => 'Ascending food names <i class="fa fa-sort-alpha-asc"></i>'},
    {:id => SORT_OPTION_ID[:NAME_DESC], :html => 'Decreasing food names <i class="fa fa-sort-alpha-desc"></i>'},
    {:id => SORT_OPTION_ID[:PRICE_ASC], :html => 'Ascending food prices <i class="fa fa-sort-numeric-asc"></i>'},
    {:id => SORT_OPTION_ID[:PRICE_DESC], :html => 'Decreasing food prices <i class="fa fa-sort-numeric-desc"></i>'},
    {:id => SORT_OPTION_ID[:VIEWED_ASC], :html => 'Ascending most viewed <i class="fa fa-sort-numeric-asc"></i>'},
    {:id => SORT_OPTION_ID[:VIEWED_DESC], :html => 'Decreasing most viewed <i class="fa fa-sort-numeric-desc"></i>'}
]

FILTER_OPTION_ID = {
    :EASTERN => 0,
    :WESTERN => 1,
}

FILTER_OPTION = [
    {:id => FILTER_OPTION_ID[:EASTERN], :html => 'Eastern Menu'},
    {:id => FILTER_OPTION_ID[:WESTERN], :html => 'Western Menu'}
]