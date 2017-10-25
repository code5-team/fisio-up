json.array! (@events) do |event|
date_format = '%Y-%m-%d %H:%M:%S'
  json.id event.id
  json.title event.title
  json.start event.start.strftime(date_format)
  json.end event.end.strftime(date_format)
  json.unidade_id event.unidade_id
  json.tipo_atendimento event.tipo_atendimento
  json.update_url event_path(event, method: :patch)
  json.edit_url edit_event_path(event)
  json.usuario_id = event.usuario_id
end
