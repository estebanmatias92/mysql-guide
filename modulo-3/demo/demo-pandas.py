import pandas as pd
import numpy as np

# Get the months
months = ["enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre"]
number_months = len(months) # 12

number_years = 8
end = 2023
start = end - number_years

# Get the years
years = np.arange(start, end)


# Get the rainfall matrix
random_floats = np.random.rand(number_months * number_years).reshape(number_years, number_months)
avg_mm = np.round(random_floats, 4) * 100

# Create DataFrame
df_avg_rainfall = pd.DataFrame(avg_mm, index=years, columns=months)

print(df_avg_rainfall)


