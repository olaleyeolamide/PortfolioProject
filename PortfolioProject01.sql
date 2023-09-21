select *
from PortfolioProjects..covid_deaths$
order by 3,4


select *
from PortfolioProjects..covid_vaccination$
order by 3,4

select Location, date, total_cases, new_cases, total_deaths, population, (total_cases/population)*100 as PercentageCases
from PortfolioProjects..covid_deaths$
where location like '%states%'
order by 1,2

select location, population, max(total_cases) as HighestInfectionCount, max(total_cases/population)*100 as PercentPopulation
from PortfolioProjects..covid_deaths$
group by location, population
order by PercentPopulation desc

select location, population, max(total_deaths) as MaxDeathPerLocation
from PortfolioProjects..covid_deaths$
where continent is not null
group by location, population
order by MaxDeathPerLocation desc

select continent, max(total_deaths) as TotalDeathCount
from PortfolioProjects..covid_deaths$
where continent is not null
group by continent
order by TotalDeathCount desc

select location, max(total_deaths) as TotalDeathCount
from PortfolioProjects..covid_deaths$
where continent is null
group by location
order by TotalDeathCount desc


select date, sum(new_cases) as total_cases, sum(new_deaths) as total_deaths
from PortfolioProjects..covid_deaths$
where continent is not null
group by date
order by total_cases desc


select cvd.date, cvd.new_cases,cvc.new_vaccinations
from PortfolioProjects..covid_deaths$ cvd join PortfolioProjects..covid_vaccination$ cvc
on cvd.date = cvc.date
order by date

select cvd.continent, cvd.location, cvd.date, cvd.population, cvc.new_vaccinations, 
sum(cast(cvc.new_vaccinations as bigint)) over (Partition by cvd.location order by cvd.location, cvd.date) as TotalVaccination 
from PortfolioProjects..covid_deaths$ cvd join PortfolioProjects..covid_vaccination$ cvc
on cvd.location = cvc.location and cvd.date = cvc.date
where cvd.continent is not null
order by 2,3

