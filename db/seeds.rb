# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
players=Player.create([
                       
                    {name: "Mustafizur Rahman", team: Team.find_by(id: 5), score: "1w, 2s, 1w"},
                    {name: "Soumya Sarkar", team: Team.find_by(id: 5), score: "1w, 2s, 1w"},
                    {name: "Shakib Al Hasan", team: Team.find_by(id: 5), score: "1w, 2s, 1w"},
                    {name: "Litton Das", team: Team.find_by(id: 5), score: "1w, 2s, 1w"},
                    {name: "Mushfiqur Rahim", team: Team.find_by(id: 5), score: "1w, 2s, 1w"},
                    {name: "Tamim Iqbal", team: Team.find_by(id: 5), score: "1w, 2s, 1w"},
                    {name: "Mehidy Hasan", team: Team.find_by(id: 5), score: "1w, 2s, 1w"},
                    {name: "Towhid Hridoy", team: Team.find_by(id: 5), score: "1w, 2s, 1w"},
                    {name: "Rony Talukdar", team: Team.find_by(id: 5), score: "1w, 2s, 1w"},
                    {name: "Shamim Hossain", team: Team.find_by(id: 5), score: "1w, 2s, 1w"},
                    {name: "Mahmudullah", team: Team.find_by(id: 5), score: "1w, 2s, 1w"},
                    {name: "Soumya Sarkar", team: Team.find_by(id: 5), score: "1w, 2s, 1w"},
                    {name: "Sabbir Rahman", team: Team.find_by(id: 5), score: "1w, 2s, 1w"},
                    {name: "Mosaddek Hossain", team: Team.find_by(id: 5), score: "1w, 2s, 1w"},
                    {name: "Zakir Hasan", team: Team.find_by(id: 5), score: "1w, 2s, 1w"},
                    {name: "Mohammad Mithun", team: Team.find_by(id: 5), score: "1w, 2s, 1w"},
                    {name: "Abu Jayed", team: Team.find_by(id: 5), score: "1w, 2s, 1w"}])