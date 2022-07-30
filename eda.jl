using DataFrames, CSV
using Plots

df = DataFrame(CSV.File("001-eda-happines/data/2021.csv"))

life_expectancy = select(df, "Country name", "Healthy life expectancy")

bar(life_expectancy, y="Country name", x="Healthy life expectancy", kind = "bar")
bar(df[:,"Country name"], df[:,"Healthy life expectancy"] , orientation = :v )