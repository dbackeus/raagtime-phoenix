window.RagaSuggester = React.createClass
  getInitialState: ->
    time: new Date()

  render: ->
    raga = $("[data-time=#{@currentPrahar()}] .title a").random()

    <div className="raga-suggester">
      <p className="raga-suggestion">
        It's {@timeAsString()} o clock. Why not try raga <a href={raga.attr("href")}>{raga.html()}</a>.
        Or <a href="#" onClick={@handleFilter}>filter all ragas</a> suitable for this time.
      </p>
    </div>

  handleFilter: (e) ->
    e.preventDefault()

    $("[data-time=#{@currentPrahar()}] [data-filter=time]").click()
    $("html, body").animate { scrollTop: $("h2").offset().top - 20 }, 500

  timeAsString: ->
    hours = @zeroed @state.time.getHours()
    minutes = @zeroed @state.time.getMinutes()

    "#{hours}:#{minutes}"

  currentPrahar: ->
    switch @state.time.getHours()
      when 6,7,8 then 1
      when 9,10,11 then 2
      when 12,13,14 then 3
      when 15,16,17 then 4
      when 18,19,20 then 5
      when 21,22,23 then 6
      when 0,1,2 then 7
      when 3,4,5 then 8

  zeroed: (int) ->
    padding_length = 2
    pad_char = "0"
    pad = new Array(1+padding_length).join(pad_char)
    (pad + int).slice(-pad.length)
