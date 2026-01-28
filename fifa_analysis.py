import pandas as pd
import sqlite3
import seaborn as sns
import matplotlib.pyplot as plt


conn = sqlite3.connect('fifa_database')


query = """
SELECT Name, Age, OVA, Value_Num_in_EUR, Wage_Num_in_EUR, "Best Position"
FROM fifa21_cleaned
WHERE Value_Num_in_EUR > 10000000
"""
df_10M = pd.read_sql_query(query, conn)

print(f"Players with Value > 10M EUR = {len(df_10M)}")

print(df_10M.corr(numeric_only=True))

stats = df_10M.groupby('Best Position')['Value_Num_in_EUR'].agg(['mean', 'var', 'median'])
stats['mean_M'] = stats['mean'] / 1_000_000
stats['median_M'] = stats['median'] / 1_000_000

print("--- Positional Statistics (in Millions EUR) ---")
print(stats[['mean_M', 'median_M', 'var']].sort_values(by='mean_M', ascending=False))

#sns.pairplot(df_10M[['Age', 'OVA', 'Value_Num_in_EUR', 'Wage_Num_in_EUR']])

# --- Jointplot (Correlation) ---
# Even after filtering for players valued >10M EUR, 
# the distribution remains right-skewed. This highlights the massive 
# price gap between "Regular Starters" and "World-Class Elite" players.
# A correlation of 0.80 confirms that Overall Rating (OVA) is the primary driver of Market Value.
# Marginal plots (histograms) reveal that most high-value players are concentrated in the 75-85 OVA range,

g = sns.jointplot(data=df_10M, x='OVA', y='Value_Num_in_EUR', kind='reg', color='purple', height=8)

#g.ax_joint.set_title('High-Value Players: Rating vs Market Value', fontsize=16, pad=80)

plt.show()

# --- Boxplot (Positional Analysis) ---
# High-Risk/High-Reward: Positions like ST, CF, and CAM show the highest variance. 
# This means there is a huge price gap between average players and Elite stars.
# Elite Skewness: In these positions, a few 'Elite' outliers (like Mbappe or Messi) 
# massively inflate the market value, making them much more volatile than defenders.
# Market Stability: Lower variance in defensive positions suggests a more 
# standardized and predictable pricing model.

plt.figure(figsize=(12, 6))
sns.boxplot(data=df_10M, x='Best Position', y='Value_Num_in_EUR', palette='viridis')
plt.show()


df_10M.to_excel("fifa_data_for_powerbi.xlsx", index=False)