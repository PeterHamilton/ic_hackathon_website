validateForm = ->
  valid = true
  valid &= $("#inputName").val() != ""
  valid &= $("#inputEmail").val() != ""
  valid &= $("#inputYear").val() > 0
  valid &= $("#inputTeam").val() != ""
  valid &= $("#inputDepartment").val() != ""
  if valid
    $('#signup-button').removeClass('disabled');
    $('#signup-button').tooltip('disable')
  else
    $('#signup-button').addClass('disabled');
    $('#signup-button').tooltip('enable')

# If the team the user entered already exists, fetch the team members
populate_team_members = (team) ->
  $.getJSON "/members_for_team.json", {team: team}, (participants) ->
    if participants.length > 0
      items = []
      $.each participants, (k, v) ->
        participant = v.participant
        items.push '<li>' + participant.name + ' - ' + participant.department + ' (' + participant.year + ' year)'
      $('#user-list').html(items.join(''))
      $('#user-list-container').slideDown()
      $('#inputTeamContainer').slideUp()

# Initialize the hompage JS
initialize_index = ->
  $("#inputName, #inputEmail, #inputYear, #inputDepartment, #inputTeam").bind "change", validateForm
  $("#inputName, #inputEmail, #inputYear, #inputDepartment, #inputTeam").bind "keyup", validateForm

  # Initialize the team auto-completion
  $.getJSON "/potential_departments.json", (data) ->
    $("#inputDepartment")
      .bind "change", ->
        console.log "DEPT Change"
      .typeahead
        source: data


  # Initialize the team auto-completion
  $.getJSON "/potential_teams.json", (data) ->
    $("#inputTeam")
      .bind "change", ->
        populate_team_members($(this).val())
      .typeahead
        source: data

  # If someone selects the wrong team, they can click this
  $("#wrong-team-button").bind "click", ->
    $('#inputTeamContainer').slideDown()
    $('#user-list-container').slideUp()

  # Ready to Type!
  $('#inputName').focus()

$(document).ready ->
  hostname = window.location.hostname
  $("a[href^=http]").not("a[href*='" + hostname + "']").addClass("link external").attr "target", "_blank"
  $("[rel='tooltip']").tooltip();
  $(".btn.disabled").live "click", (e) ->
    e.preventDefault()
  initialize_index()  if $("#page-index").length
