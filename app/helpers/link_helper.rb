module LinkHelper
  def link_to_new(path = nil, text: t(:new))
    link_to(
      icon('plus', text),
      path,
      class: 'btn btn-outline-primary btn-sm'
    )
  end

  def link_to_show(path = nil, text: t(:show))
    link_to(
      icon('eye', text),
      path,
      class: 'btn btn-outline-info btn-sm'
    )
  end

  def link_to_edit(path = nil, text: t(:edit))
    link_to(
      icon('pencil', text),
      path,
      class: 'btn btn-outline-success btn-sm'
    )
  end

  def link_to_update(path = nil, text: t(:update))
    link_to(
      icon('pencil-square-o', text),
      path,
      class: 'btn btn-outline-info btn-sm'
    )
  end

  def link_to_destroy(path = nil, text: t(:destroy))
    link_to(
      icon('trash', text),
      path,
      method: :delete,
      data: { confirm: t(:are_you_sure) },
      class: 'btn btn-outline-danger btn-sm'
    )
  end

  # def link_to_confirm(path = nil, text: t(:confirm))
  #   link_to(
  #     icon('check-circle', text),
  #     path,
  #     data: { confirm: t(:are_you_sure) },
  #     class: 'btn btn-outline-success btn-sm'
  #   )
  # end

  def icon(icon, text)
    sanitize("<i class='fa fa-#{icon}'></i> " + text)
  end
end
