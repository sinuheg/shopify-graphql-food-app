module Mutations
  class FoodDelete < BaseMutation
    argument :id, ID, required: true

    type Types::FoodType

    def resolve(**args)
      food = Food.find(args[:id])
      food.destroy!
      return food
    end
  end
end
