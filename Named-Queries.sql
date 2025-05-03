-- Query Name: StudyDurationInYears
SELECT COUNT(DISTINCT YEAR(date_time)) AS study_years
FROM SL_WQ_data;

-- Query Name: TotalSamplingSites
SELECT COUNT(DISTINCT site_no) AS total_sites
FROM SL_WQ_data;

-- Query Name: TotalMeasuredParameters
SELECT COUNT(DISTINCT variable) AS total_parameters
FROM SL_WQ_data;

-- Query Name: AvgMercuryAtLevisByYear
SELECT YEAR(date_time) AS year, ROUND(AVG(result), 2) AS avg_mercury
FROM SL_WQ_data
WHERE variable = 'MERCURY DISSOLVED' AND site_no = 'QU02PH9024'
GROUP BY YEAR(date_time);

-- Query Name: MaxLeadPerSite
SELECT site_no, MAX(result) AS max_lead
FROM SL_WQ_data
WHERE variable = 'LEAD DISSOLVED'
GROUP BY site_no;

-- Query Name: MercuryRangePerSite
SELECT site_no, MIN(result) AS min_mercury, MAX(result) AS max_mercury
FROM SL_WQ_data
WHERE variable = 'MERCURY DISSOLVED'
GROUP BY site_no;

-- Query Name: GlyphosateExceedingLimit
SELECT site_no, MAX(result) AS max_glyphosate
FROM SL_WQ_data
WHERE variable = 'GLYPHOSATE'
GROUP BY site_no
HAVING MAX(result) > 280000
ORDER BY max_glyphosate DESC;

-- Query Name: PHCompliantSites
SELECT site_no, MIN(result) AS min_ph, MAX(result) AS max_ph
FROM SL_WQ_data
WHERE variable = 'PH (FIELD)' AND result BETWEEN 6.5 AND 8.5
GROUP BY site_no;

-- Query Name: LowConductivitySites
SELECT COUNT(*) AS low_conductivity_sites
FROM (
  SELECT site_no
  FROM SL_WQ_data
  WHERE variable = 'CONDUCTANCE (FIELD)' AND result < 200
) AS subquery;

-- Query Name: HealthyOxygenSaturationSites
SELECT site_no, ROUND(AVG(result), 2) AS avg_oxygen_saturation
FROM SL_WQ_data
WHERE variable = 'OXYGEN DISSOLVED % SATURATION'
GROUP BY site_no
HAVING AVG(result) > 80;

-- Query Name: CadmiumExceedanceAtCarillon
SELECT COUNT(*) AS exceedance_count
FROM SL_WQ_data
WHERE variable = 'CADMIUM DISSOLVED' AND site_no = 'QU02LB9001' AND result > 10;

-- Query Name: AvgTotalHeavyMetalsPerYear_TroisRivieres
SELECT site_no, YEAR(date_time) AS year, ROUND(AVG(result), 2) AS avg_heavy_metals
FROM SL_WQ_data
WHERE site_no = 'QU02NG3013'
  AND variable IN ('ALUMINUM TOTAL RECOVERABLE', 'BARIUM TOTAL', 'BERYLLIUM TOTAL', 'CADMIUM TOTAL', 'COBALT TOTAL', 'CHROMIUM TOTAL', 'COPPER TOTAL', 'IRON TOTAL', 'LITHIUM TOTAL', 'MANGANESE TOTAL', 'MOLYBDENUM TOTAL', 'NICKEL TOTAL', 'LEAD TOTAL', 'STRONTIUM TOTAL', 'VANADIUM TOTAL', 'ZINC TOTAL', 'BORON TOTAL')
GROUP BY site_no, YEAR(date_time);

-- Query Name: SiteWithMostMeasuredParameters
SELECT site_no
FROM (
  SELECT site_no, COUNT(DISTINCT variable) AS variable_count
  FROM SL_WQ_data
  GROUP BY site_no
) AS site_counts
WHERE variable_count = (
  SELECT MAX(variable_count)
  FROM (
    SELECT site_no, COUNT(DISTINCT variable) AS variable_count
    FROM SL_WQ_data
    GROUP BY site_no
  ) AS inner_counts
);
