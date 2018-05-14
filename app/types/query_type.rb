# Example from http://graphql-ruby.org/getting_started#build-a-schema
#
# QueryType = GraphQL::ObjectType.define do
#   name "Query"
#   description "The query root of this schema"
#
#   field :post do
#     type PostType
#     argument :id, !types.ID
#     description "Find a Post by ID"
#     resolve ->(obj, args, ctx) { Post.find(args["id"]) }
#   end
# end

QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root for this schema"

  field :movie do
    type MovieType
    # We specify the arguments the field can accept — only an id which has the
    # special type ID! (! indicating that this argument is required).
    argument :id, !types.ID
    description "Find a Movie by ID"
    resolve -> (obj, args, ctx) {
      Movie.find(args[:id])
    }
  end

  field :actor do
    type ActorType
    argument :id, !types.ID
    resolve -> (obj, args, ctx) {
      Actor.find(args[:id])
    }
  end
end
