module Mutations
  class NutritionDelete < BaseMutation
    argument :id, ID, required: true

    type Types::NutritionType

    def resolve(**args)
      nutrition = Nutrition.find(args[:id])
      nutrition.destroy!
      return nutrition
    end
  end
end
