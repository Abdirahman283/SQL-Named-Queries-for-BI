# 🏞️ **Saint-Laurent River Water Quality Analysis (SQL Project)**

## 📚 **Project Overview**

This project focuses on analyzing historical water quality data collected from multiple monitoring stations along the Saint-Laurent River. Using MySQL, we designed a series of named queries based on hypothetical business rules provided by data scientists to help identify environmental risks, monitor key contaminants, and support scientific evaluations.

The dataset contains parameters such as heavy metals, pH, pesticides, conductivity, and dissolved oxygen, collected over several years.

## ℹ️ About the dataset/Source
**Source of the dataset** : Open Gouvernment Canada
Data collected by: Environnement et Changement climatique Canada

**Theme**: Saint Lawrence River Basin Long-term Water Quality Monitoring Data
(Long-term water quality monitoring data from the St. Lawrence River basin)

Source link: [click here](https://open.canada.ca/data/dataset/10cf9528-6761-4ece-ad63-f60698ff9d51)

---

## 🛠️ **Named Queries Included**

| Query Name                                 | Description                                                                                      |
| ------------------------------------------ | ------------------------------------------------------------------------------------------------ |
| `StudyDurationInYears`                     | Number of distinct years covered by the monitoring study.                                        |
| `TotalSamplingSites`                       | Total number of distinct sampling sites in the dataset.                                          |
| `TotalMeasuredParameters`                  | Total number of distinct measured parameters (variables).                                        |
| `AvgMercuryAtLevisByYear`                  | Average yearly dissolved mercury levels at the Lévis filtration plant site.                      |
| `MaxLeadPerSite`                           | Maximum dissolved lead value per site to flag high-risk locations.                               |
| `MercuryRangePerSite`                      | Minimum and maximum mercury values per site to understand concentration ranges.                  |
| `GlyphosateExceedingLimit`                 | Sites where glyphosate concentration exceeds Canadian drinking water standards.                  |
| `PHCompliantSites`                         | Sites where pH values fall within the biologically favorable range of 6.5–8.5.                   |
| `LowConductivitySites`                     | Number of sites where electrical conductivity is below 200 µS/cm, indicating low mineralization. |
| `HealthyOxygenSaturationSites`             | Sites with average dissolved oxygen saturation above 80%, indicating good water quality.         |
| `CadmiumExceedanceAtCarillon`              | Number of exceedances for dissolved cadmium over 10 µg/L at the Carillon dam site.               |
| `AvgTotalHeavyMetalsPerYear_TroisRivieres` | Yearly average of total heavy metals at the Trois-Rivières filtration site.                      |
| `SiteWithMostMeasuredParameters`           | Site with the highest number of distinct measured parameters over the study period.              |

---
## 📊 **Recommended Visualizations**

* **Line Charts** → Trends over time (e.g., yearly average mercury, total heavy metals)
* **Bar Charts** → Comparisons across sites (e.g., max lead per site, number of measured parameters)
* **Heatmaps or Risk Maps** → Geographic visualization of sites exceeding environmental thresholds
* **Boxplots** → Distribution of measurements per parameter (e.g., pH, conductivity)

---

## 🔗 **How to Use**

1. Run the provided SQL script in your MySQL database.
2. Use the named queries to extract analytical datasets.
3. Export the query outputs to CSV/Excel or connect them directly to visualization tools like Power BI or Tableau.
4. Build visual dashboards to present key insights for environmental scientists, policymakers, or stakeholders.

---

## 👨‍💻 **Author**

**Abdirahman Abdillahi**
Academic project for advanced SQL practice and environmental data analysis.
📧 Contact: [aagd47@gmail.com](mailto:aagd47@gmail.com)
🔗 [LinkedIn Profile](https://www.linkedin.com/in/abdirahmnabdillahi/)

---

✅ Feel free to fork this repository or use the queries as templates for your own environmental or scientific database projects!
