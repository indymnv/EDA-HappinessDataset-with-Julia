using DataFrames, CSV
using Plots
theme(:ggplot2)

df = DataFrame(CSV.File("001-eda-happines/data/2021.csv"))

life_expectancy = sort!(select(df, "Country name", "Healthy life expectancy"),
		       :"Healthy life expectancy", 
		       rev = true)

bar(life_expectancy[:,"Country name"], 
    life_expectancy[:,"Healthy life expectancy"] ,
    title="Healthy Life expectancy",
    xrotation = 50,
    legend= false,
    color = "red",
    size= (1000,600)
   )



function barchar_countries(df, fragment_df, var, color, number)
  bar(
    fragment_df(df[:,"Country name"], number), 
    fragment_df(df[:,var], number) ,
    title="$fragment_df $number countries by $var",
    xrotation = 45,
    legend = false,
    xticks = :all,
    color = color,
    size= (1000,600)
   )
  savefig("$fragment_df $number countries by $var.png")
end

barchar_countries(life_expectancy,
		 last,
		 "Healthy life expectancy",
		 "red", 20)

scatter(df[:,"Social support"],
	df[:,"Healthy life expectancy"],
	xaxis = "Healthy life expectancy",
	yaxis = "Social support",
	label = "countries"
	)
