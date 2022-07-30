using DataFrames, CSV
using Gadfly

df = DataFrame(CSV.File("001-eda-happines/data/2021.csv"))

life_expectancy = sort!(select(df, "Country name", "Healthy life expectancy"),
		       :"Healthy life expectancy", 
		       rev = true)

#bar(life_expectancy, y="Country name", x="Healthy life expectancy", kind = "bar")
bar(life_expectancy[:,"Country name"], 
    life_expectancy[:,"Healthy life expectancy"] ,
    title="Healthy Life expectancy",
    xrotation = 50,
    legend= false,
    color = "red",
    size= (1000,600)
   )

bar(first(life_expectancy[:,"Country name"], 10), 
    first(life_expectancy[:,"Healthy life expectancy"],10) ,
    title="Healthy Life expectancy",
    xrotation = 50,
    legend = false,
    color = "green",
    size= (1000,600)
   )
bar(last(life_expectancy[:,"Country name"], 10), 
    last(life_expectancy[:,"Healthy life expectancy"],10) ,
    title="Healthy Life expectancy",
    xrotation = 50,
    legend = false,
    color = "red",
    size= (1000,600)
   )





