library(tidyverse)
library(data.world)

## connect with API
token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyLWFuZC1yLXN0dWRpbzpqb3NoMWRlbiIsImlzcyI6ImNsaWVudDpyLWFuZC1yLXN0dWRpbzphZ2VudDpqb3NoMWRlbjo6ZTU4MjkzNmUtZGZkYS00NmU4LWJlYTYtYzI0ZmFmNWZiNGI0IiwiaWF0IjoxNjY4MDI4MTUzLCJyb2xlIjpbInVzZXJfYXBpX2FkbWluIiwidXNlcl9hcGlfcmVhZCIsInVzZXJfYXBpX3dyaXRlIl0sImdlbmVyYWwtcHVycG9zZSI6dHJ1ZSwic2FtbCI6e319.84ISSKi2oCdgthvpRuwRhX6KUKvsaGNbn6K7ddfT3hyxSiDBXLDiZCfCYCYvrI6dreGm8fAvskPl5GQiW-pbGQ"
saved_cfg <- data.world::save_config(token)
data.world::set_config(saved_cfg)
vignette("quickstart", package = "data.world")

# load the dataset
loyalty = "https://data.world/cesarpolo/consumer-loyalty-in-retail"
query = qry_sql("SELECT * FROM Loyalty")
df = data.world::query(query, loyalty)

head(df)
