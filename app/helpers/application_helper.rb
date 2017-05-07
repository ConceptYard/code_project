module ApplicationHelper

  def login_form_props
    {id: 'modal-login-form', title: 'Sign in', form: 'devise/sessions/form'}
  end

  def add_post_form_props
    {id: 'modal-add-post-form', title: 'Add post', form: 'posts/form'}
  end

  def login_modal_form form_data
    render 'shared/form_modal', props: login_form_props.reverse_merge(form_data: form_data) unless user_signed_in?
  end

  def add_post_modal_form form_data
    render 'shared/form_modal', props: add_post_form_props.reverse_merge(form_data: form_data) if user_signed_in?
  end
end
