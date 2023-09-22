Select * 
from PortfolioProjects..NashvilleHousing

Select SaleDate, convert(date,SaleDate) 
from PortfolioProjects..NashvilleHousing

Update NashvilleHousing
set SaleDate = convert(date,SaleDate)

ALTER TABLE NashvilleHousing
ADD SaleDateConverted date

Update NashvilleHousing
set SaleDateConverted = convert(date,SaleDate)

Select SaleDateConverted
from PortfolioProjects..NashvilleHousing

select * from PortfolioProjects..NashvilleHousing
where PropertyAddress is null

select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, isnull(a.PropertyAddress, b.PropertyAddress)
from PortfolioProjects..NashvilleHousing a 
join PortfolioProjects..NashvilleHousing b
on a.ParcelID = b.ParcelID
and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null
order by a.ParcelID

UPDATE a
set a.PropertyAddress = isnull(a.PropertyAddress, b.PropertyAddress)
from PortfolioProjects..NashvilleHousing a 
join PortfolioProjects..NashvilleHousing b
on a.ParcelID = b.ParcelID
and a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null

select PropertyAddress from PortfolioProjects..NashvilleHousing

select 
SUBSTRING(PropertyAddress, 1, charindex(',', PropertyAddress) -1) as Address,
SUBSTRING(PropertyAddress, charindex(',', PropertyAddress) +1, LEN(PropertyAddress)) as Address
from PortfolioProjects..NashvilleHousing

ALTER TABLE NashvilleHousing
ADD AddressSplitCity varchar (200)

Update NashvilleHousing
set AddressSplitCity = SUBSTRING(PropertyAddress, 1, charindex(',', PropertyAddress) -1)

ALTER TABLE NashvilleHousing
ADD AddressSplitState varchar(100)

Update NashvilleHousing
set AddressSplitState = SUBSTRING(PropertyAddress, charindex(',', PropertyAddress) +1, LEN(PropertyAddress))

Select *
from PortfolioProjects..NashvilleHousing

select OwnerAddress
from PortfolioProjects..NashvilleHousing


Select OwnerAddress,
substring(OwnerAddress, 1, charindex(',', OwnerAddress) -1) as OwnerCityAdd,
substring(OwnerAddress, -1, charindex(',', OwnerAddress)) as OwnerStateAdd
from PortfolioProjects..NashvilleHousing

select
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3),
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2),
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)
FROM PortfolioProjects..NashvilleHousing

ALTER TABLE NashvilleHousing
ADD OwnerSplitAddress varchar(100)

Update NashvilleHousing
set OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3)

ALTER TABLE NashvilleHousing
ADD OwnerSplitCity varchar(100)

Update NashvilleHousing
set OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2)

ALTER TABLE NashvilleHousing
ADD OwnerSplitState varchar(100)

Update NashvilleHousing
set OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)

Select *
from PortfolioProjects..NashvilleHousing


Select SoldAsVacant,
Case when SoldAsVacant = 'Y' then 'Yes'
when SoldAsVacant = 'N' then 'No'
else SoldAsVacant
end
From PortfolioProjects..NashvilleHousing


Update NashvilleHousing
set SoldAsVacant =
Case when SoldAsVacant = 'Y' then 'Yes'
when SoldAsVacant = 'N' then 'No'
else SoldAsVacant
end
From PortfolioProjects..NashvilleHousing

select distinct(SoldAsVacant), Count(SoldAsVacant)
from PortfolioProjects..NashvilleHousing
Group by SoldAsVacant


ALTER TABLE NashvilleHousing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress

ALTER TABLE NashvilleHousing
DROP COLUMN SaleDate
