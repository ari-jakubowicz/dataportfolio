-- DATA EXPLORATION MADE FROM OUR WORLD IN DATA COVID-19 DATASET

select * from PortfolioProject..CovidDeaths order by 3,4

-- Select data that we are going to be using

select location, date, total_cases, new_cases, total_deaths, population 
from PortfolioProject..CovidDeaths 
order by 1,2

-- Total Cases vs Total Deaths
-- Shows likelihood of dying in you contract COVID in Argentina
select location, date, total_cases, total_deaths, (total_deaths/total_cases) * 100 as DeathPercentage
from PortfolioProject..CovidDeaths 
where location like '%argentina%'
order by 1,2

-- Looking at Total Cases vs Population
-- Shows what % of population got Covid
select location, date, population, total_cases, (total_cases/population) * 100 as ConfirmedCovidPercentage
from PortfolioProject..CovidDeaths 
where location like '%argentina%'
order by 1,2

-- Looking at countries with Highest Infection Rate compared to Population
select location, population, max(total_cases) as HighestInfectionCount, max((total_cases/population)) * 100 as ConfirmedCovidPercentage
from PortfolioProject..CovidDeaths 
group by population, location
order by ConfirmedCovidPercentage desc

--Showing countries wuth Highest Death Count per Population
select location, max(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
where continent is not null
group by population, location
order by TotalDeathCount desc

--Breaking things down by Continent

select continent, max(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
where continent is not null
group by continent
order by TotalDeathCount desc

-- GLOBAL NUMBERS

select SUM(new_cases) as TotalCases, sum(new_deaths) as TotalDeaths, SUM(new_deaths)/SUM(new_cases) * 100 as DeathPercentage
from PortfolioProject..CovidDeaths 
--where location like '%argentina%'
where continent is not null
--group by date
order by 1,2


-- CTE

With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(convert(float,vac.new_vaccinations)) over (Partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
--order by 2,3
)
Select *, (RollingPeopleVaccinated/Population)*100 as Percentage from PopvsVac order by 2

-- TEMP TABLE
Drop table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255), 
Location nvarchar(255), 
Date datetime, 
Population numeric, 
New_vaccinations numeric, 
RollingPeopleVaccinated numeric
)

insert into #PercentPopulationVaccinated
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(convert(float,vac.new_vaccinations)) over (Partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
--order by 2,3
Select *, (RollingPeopleVaccinated/Population)*100 as Percentage from #PercentPopulationVaccinated


-- CREATING VIEW to store data for later visualization

drop view if exists PercentPopulationVaccinated
Create View PercentPopulationVaccinated 
as
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(convert(float,vac.new_vaccinations)) over (Partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
