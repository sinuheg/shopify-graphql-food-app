module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :all_food, [Types::FoodType], null: false, description: 'Get all the food items.'
    field :all_nutrition, [Types::NutritionType], null: false, description: 'Get all the nutrition facts'
    field :food, Types::FoodType, null: false do
      description 'Get a food item based on id.'
      argument :id, ID, required: true
    end
    field :food_by_origin, Types::FoodType, null: true do
      description 'Get a food itme based on place of origin'
      argument :place_of_origin, String, required: true
    end

    def all_food
      Food.all
    end

    def all_nutrition
      Nutrition.all
    end

    def food(id:)
      Food.find(id)
    end

    def food_by_origin(place_of_origin:)
      Food.find_by place_of_origin: place_of_origin
    end
  end
end
