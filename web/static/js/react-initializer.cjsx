$ ->
  $("[data-react-class]").each ->
    component = window[@getAttribute("data-react-class")]

    React.render <component />, @
