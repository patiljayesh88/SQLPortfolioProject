--SELECT * FROM PortfolioProject..covid__death$


/*SELECT*
From PortfolioProject..covid__vaccinations$*/


/*SELECT LOCATION , DATE , total_cases,new_cases,total_deaths , population
FROM PortfolioProject..covid__death$
where continent is not null
ORDER BY 1,2*/



--Now we do a comparison between cases and deaths totally

/*SELECT LOCATION , DATE , total_cases,total_deaths , (total_deaths/total_cases)*100 as DeathPercentage
FROM PortfolioProject..covid__death$
WHERE location like '%Senegal%'
ORDER BY 1,2*/

--LOOK AT TOTAL CASES VS POPULATION

/*SELECT LOCATION , DATE , total_cases, Population , (total_deaths/total_cases)*100 as PercentPopulationInfected
FROM PortfolioProject..covid__death$
WHERE location like '%states%'
ORDER BY 1,2


--look at countries with highest infection rate compared to popuulation

SELECT LOCATION , MAX(total_cases) as HighestInfectionCount, Population , MAX((total_cases/population))*100 as PercentPopulationInfected
FROM PortfolioProject..covid__death$
--WHERE location like '%india%'
Group by location,population
order by PercentPopulationInfected desc	*/

--Showing the countries with highest death count per population

/*SELECT continent , MAX(cast(total_deaths as int) ) as TotalDeathCount
FROM PortfolioProject..covid__death$
--WHERE location like '%india%'
Where continent is null
Group by continent
order by TotalDeathCount desc */

--showing the continents with highest death count


/*SELECT continent , MAX(cast(total_deaths as int) ) as TotalDeathCount
FROM PortfolioProject..covid__death$
--WHERE location like '%india%'
Where continent is not null
Group by continent
order by TotalDeathCount desc*/


-- GLOBAL NUMBER

SELECT  sum(new_cases) as Total_cases , sum (cast(new_deaths as int))as Total_deaths , sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
FROM PortfolioProject..covid__death$
--WHERE location like '%STATES
where continent is not null
--group by date
ORDER BY 1,2

