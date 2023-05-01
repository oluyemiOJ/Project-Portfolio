SELECT *
FROM CovidDeaths
ORDER BY 3,4

SELECT *
FROM CovidVaccinations
ORDER BY 3,4


SELECT *
FROM CovidDeaths

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM CovidDeaths
ORDER BY 1,2



--LOOKING AT TOTAL CASES VS TOTAL DEATHS
--Shows likelihood of dying if COVID is  contracted in the Cayman Island

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage 
FROM CovidDeaths
WHERE location like '%Cayman Island%'
ORDER BY 1,2
 

 --LOOKING AT THE TOTAL CASES VS POPULATION
SELECT location, date, population, total_cases, (total_deaths/population)*100 AS DeathPercentage 
FROM CovidDeaths
WHERE location like '%Cayman Island%'
ORDER BY 1,2

--LOOKING AT COUNTRIES WITH THE HIGHEST INFECTION RATE COMPARED TO POPULATION
SELECT location, population, MAX(total_cases) AS HighestInfection, MAX((total_deaths/population))*100 AS PercentagePopulationInfected
FROM CovidDeaths
GROUP BY location, population
ORDER BY PercentagePopulationInfected DESC

-- SHOWING COUNTRIES WITH HIGHEST DEATH COUNT PER POLPULATION

SELECT location, MAX(CAST(total_deaths as Int)) AS TotalDeathCount
FROM CovidDeaths
WHERE continent is not null
GROUP BY location
ORDER BY TotalDeathCount DESC


-- SHOWING CONTINENT WITH HIGHEST DEATH COUNT PER POLPULATION

SELECT continent, MAX(CAST(total_deaths as Int)) AS TotalDeathCount
FROM CovidDeaths
WHERE continent is not null
GROUP BY continent
ORDER BY TotalDeathCount DESC


-- GLOBAL NUMBERS 

SELECT SUM(new_cases) AS Total_cases, SUM(CAST(new_deaths AS INT)) AS total_deaths, SUM(CAST(new_deaths AS INT))/ SUM(new_cases)*100 AS DeathPercentage 
FROM CovidDeaths
--WHERE location like '%Cayman Island%'
WHERE continent is not null
ORDER BY 1,2


-- JOINING TWO TABLES

SELECT *
FROM CovidDeaths AS DEA
JOIN CovidVaccinations AS VAC
ON DEA.location = VAC.location
AND DEA.date = VAC.date

-- LOOKING AT TOTAL POPULATION VS VACINATIONS

SELECT DEA.continent, DEA.location,DEA.date, DEA.population, VAC.new_vaccinations,
SUM(CONVERT(INT, VAC.new_vaccinations)) OVER (PARTITION BY DEA.location ORDER BY DEA.location, DEA.date) AS RollingPeopleVaccinated
FROM CovidDeaths AS DEA
JOIN CovidVaccinations AS VAC
ON DEA.location = VAC.location
AND DEA.date = VAC.date
WHERE DEA.continent is not null
ORDER BY 2,3


--USING COMMON TABLE EXPRESSION (CTE)

WITH popVSvac (continent, location, date, population, New_vaccinations, RollingPeopleVaccinated)
AS
(
SELECT DEA.continent, DEA.location,DEA.date, DEA.population, VAC.new_vaccinations,
SUM(CONVERT(INT, VAC.new_vaccinations)) OVER (PARTITION BY DEA.location ORDER BY DEA.location, DEA.date) AS RollingPeopleVaccinated
FROM CovidDeaths AS DEA
JOIN CovidVaccinations AS VAC
ON DEA.location = VAC.location
AND DEA.date = VAC.date
WHERE DEA.continent is not null
--ORDER BY 2,3
)
SELECT *, (RollingPeopleVaccinated/Population)*100
FROM popVSvac

-- TEMP TABLE

DROP TABLE if exists #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
continent NVARCHAR(225),
location NVARCHAR(225),
date DATETIME,
population NUMERIC,
New_vaccinations NUMERIC,
RollingPeopleVaccinated NUMERIC
)
INSERT INTO #PercentPopulationVaccinated
SELECT DEA.continent, DEA.location,DEA.date, DEA.population, VAC.new_vaccinations,
SUM(CONVERT(INT, VAC.new_vaccinations)) OVER (PARTITION BY DEA.location ORDER BY DEA.location, DEA.date) AS RollingPeopleVaccinated
FROM CovidDeaths AS DEA
JOIN CovidVaccinations AS VAC
ON DEA.location = VAC.location
AND DEA.date = VAC.date
WHERE DEA.continent is not null
--ORDER BY 2,3

SELECT *, (RollingPeopleVaccinated/Population)*100
FROM  #PercentPopulationVaccinated




--CREATING VIEW TO STORE DATA FOR VISUALIZATION

CREATE VIEW PercentPopulationVaccinated as
SELECT DEA.continent, DEA.location,DEA.date, DEA.population, VAC.new_vaccinations,
SUM(CONVERT(INT, VAC.new_vaccinations)) OVER (PARTITION BY DEA.location ORDER BY DEA.location, DEA.date) AS RollingPeopleVaccinated
FROM CovidDeaths AS DEA
JOIN CovidVaccinations AS VAC
ON DEA.location = VAC.location
AND DEA.date = VAC.date
WHERE DEA.continent is not null
--ORDER BY 2,3


SELECT *
FROM PercentPopulationVaccinated