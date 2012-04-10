class TestimonialsController < InheritedResources::Base
  actions :index

  def index
    @selected_menu = 'home'
    @testimonials = Testimonial.randomize.all
  end
end