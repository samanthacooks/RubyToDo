
class Task
  attr_reader :item_description

  def initialize(args)
    @item_description = args.fetch(:item_description)
  end

end
