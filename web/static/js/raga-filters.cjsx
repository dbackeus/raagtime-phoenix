class FilterableTable
  constructor: (@$table, @$summary) ->
    @activateFilterLinks()
    @activateFilterRemover()

  activateFilterLinks: ->
    @$table.find("[data-filter]").each (i, element) =>
      $(element).click @handleFilterClick.bind(@)

  activateFilterRemover: ->
    @$summary.find(".filter-remover").click (e) =>
      e.preventDefault()

      @removeFilter()

  handleFilterClick: (e) ->
    e.preventDefault()

    $link = $(e.target)
    filter = $link.data("filter")
    value = $link.closest("tr").data(filter)
    prettyValue = $link.html()

    @applyFilter(filter, value, prettyValue)

  applyFilter: (filter, value, prettyValue) ->
    @$table.find("tbody tr").hide()
    @$table.find("[data-#{filter}=#{value}]").show()
    @zebra()

    @$summary.find(".filter-name").html("#{filter} #{prettyValue}")
    @$summary.show()

  removeFilter: ->
    @$summary.hide()
    @$table.find("tbody tr").show()
    @zebra()

  zebra: ->
    @$table.find("tbody tr").removeClass("even")
    @$table.find("tbody tr:visible:even").addClass("even")

$ ->
  $("[data-filterable-table]").each (i, element) ->
    $table = $(element)
    summarySelector = $table.data("filterable-summary-selector")
    $summary = $(summarySelector)
    new FilterableTable $table, $summary

