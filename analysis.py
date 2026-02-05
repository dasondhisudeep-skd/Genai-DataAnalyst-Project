
import pandas as pd

df = pd.read_excel("sales_data_1000_rows.xlsx")

df["Total"] = df["Quantity"] * df["UnitPrice"]

print("Total Rows:", len(df))
print("Grand Total Sales:", df["Total"].sum())
print("\nTop 5 Products:")
print(df.groupby("Product")["Total"].sum().sort_values(ascending=False).head(5))
