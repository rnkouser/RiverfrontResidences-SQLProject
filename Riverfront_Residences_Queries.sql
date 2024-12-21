--============================
--Cleaning Data in SQL Queries
--============================
--Retrieves all rows and columns from the Riverfront_Residences table--

Select *
From [dbo].[Riverfront_Residences]

-------------------------------------------------------------------

-- Standardize Date Format

--change SaleDate to Date format--
Select saleDate, CONVERT(Date,SaleDate) as SaleDate
From Riverfront_Residences

--updates the SaleDate column in the Riverfront_Residences table to its Date format for all records--
Update Riverfront_Residences
SET SaleDate = CONVERT(Date,SaleDate)


-- If it doesn't Update properly--

ALTER TABLE Riverfront_Residences
Add SaleDateConverted Date;

Update Riverfront_Residences
SET SaleDate = CONVERT(Date,SaleDate)

 --------------------------------------------------------------------------------------------------------------------------

-- Populate Property Address data

Select *
From Riverfront_Residences
--Where PropertyAddress is null
order by ParcelID


 ---Using Join----

 --to fill out null PropertyAddress values in Riverfront_Residences by joining the table on matching ParcelIDs 
 --and excluding records with the same UniqueID--

Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress,b.PropertyAddress)
From Riverfront_Residences a
JOIN Riverfront_Residences b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null


--to update PropertyAddress in Riverfront_Residences to non-null values from joined 
--records with the same ParcelID but different UniqueID--
Update a
SET PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
From Riverfront_Residences a
JOIN Riverfront_Residences b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null

---------------------------------------------------------------------------

-- Breaking out Address into Individual Columns (Address, City, State)


Select PropertyAddress
From Riverfront_Residences
--Where PropertyAddress is null
--order by ParcelID

--To split PropertyAddress into two parts: before and after the comma.--

SELECT
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) as Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress)) as Address
From Riverfront_Residences


ALTER TABLE Riverfront_Residences
Add PropertySplitAddress Nvarchar(255);

Update Riverfront_Residences
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 )


ALTER TABLE Riverfront_Residences
Add PropertySplitCity Nvarchar(255);

Update Riverfront_Residences
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress))


Select *
From Riverfront_Residences

Select OwnerAddress
From Riverfront_Residences

--To split the OwnerAddress into three parts using commas as delimiter--
Select
PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3),
PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2),
PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)
From Riverfront_Residences


ALTER TABLE Riverfront_Residences
Add OwnerSplitAddress Nvarchar(255);

Update Riverfront_Residences
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 3)


ALTER TABLE Riverfront_Residences
Add OwnerSplitCity Nvarchar(255);

Update Riverfront_Residences
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 2)


ALTER TABLE Riverfront_Residences
Add OwnerSplitState Nvarchar(255);

Update Riverfront_Residences
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.') , 1)


Select *
From Riverfront_Residences


----------------------------------------------------------------------


-- Change Y and N to Yes and No in "Sold as Vacant" field

--Count distinct SoldAsVacant values and orders by count--

Select Distinct(SoldAsVacant), Count(SoldAsVacant)
From Riverfront_Residences
Group by SoldAsVacant
order by 2


Select SoldAsVacant
, CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END
From Riverfront_Residences


Update Riverfront_Residences
SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END


------------------------------------------------------------

-- Remove Duplicates

WITH RowNumCTE AS(
Select *,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
					UniqueID
					) row_num

From Riverfront_Residences
--order by ParcelID
)
Select *
From RowNumCTE
Where row_num > 1
Order by PropertyAddress



Select *
From Riverfront_Residences


----------------------------------------------------

-- Delete Unused Columns


Select *
From Riverfront_Residences


ALTER TABLE Riverfront_Residences
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate


ALTER TABLE Riverfront_Residences
DROP COLUMN SaleDate


-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------


