let numApartments = document.querySelector("#number-of-apartments");
let numCompanies = document.querySelector("#number-of-companies");
let numCorporations = document.querySelector("#number-of-corporations");
let numFloors = document.querySelector("#number-of-floors");
let numBasements = document.querySelector("#number-of-basements");
let numParking = document.querySelector("#number-of-parking-spots");
let numElevators = document.querySelector("#number-of-elevators");
let maxOccupancy = document.querySelector("#maximum-occupancy");
let busHours = document.querySelector("#business-hours");
let buildingTypeSelector = document.querySelector("#building-type");
let productLineSelector = document.querySelector('input[name="service_grade"]');
const standardPrice = 7565;
const premiumPrice = 12345;
const exceliumPrice = 15400;
const standardFee = .1;
const premiumFee = .13;
const exceliumFee = .16;


function HideAllElements(){
//    for(let i = 5; i < 22; i++){
//        fieldset1.getElementsByTagName("div")[i].style.display = "none"
//    }
    numApartments.style.display = "none";
    numCompanies.style.display = "none";
    numCorporations.style.display = "none";
    numFloors.style.display = "none";
    numBasements.style.display = "none";
    numParking.style.display = "none";
    numElevators.style.display = "none";
    maxOccupancy.style.display = "none";
    busHours.style.display = "none";
};

HideAllElements();

function ResetFields(){
    for(let i = 0; i < fieldset1.getElementsByTagName("input").length; i++){
        document.getElementsByTagName("input")[i].value = ""
    }
    document.querySelector("#required-elevators").value=""
}

function ShowResidentialElements(){
    numApartments.style.display = "block";
    numFloors.style.display = "block";
    numBasements.style.display = "block";
};

function ShowCommercialElements(){
    numCompanies.style.display = "block";
    numFloors.style.display = "block";
    numBasements.style.display = "block";
    numParking.style.display = "block";
    numElevators.style.display = "block";
};

function ShowCorporateElements(){
    numCorporations.style.display = "block";
    numFloors.style.display = "block";
    numBasements.style.display = "block";
    numParking.style.display = "block";
    maxOccupancy.style.display = "block";
};

function ShowHybridElements(){
    numCompanies.style.display = "block";
    numFloors.style.display = "block";
    numBasements.style.display = "block";
    numParking.style.display = "block";
    maxOccupancy.style.display = "block";
    busHours.style.display = "block";
};

function LoadSelection(){
    HideAllElements()
    let buildingVal = buildingTypeSelector.value
    ResetFields()
    if (buildingVal === "residential"){
        ShowResidentialElements()
    } else if (buildingVal === "commercial"){
        ShowCommercialElements()
    } else if (buildingVal === "corporate"){
        ShowCorporateElements()
    } else if (buildingVal === "hybrid"){
        ShowHybridElements()
    }
}

buildingTypeSelector.addEventListener("change", LoadSelection)

//function RequiredShafts(){
//
//}

function UnitPriceUpdate(){
    let productLineVal = document.querySelector('input[name="service_grade"]:checked').value
    let unitPriceBox = document.querySelector("#unit-price")
    unitPriceBox.value = ""
    if (productLineVal === "standard"){
        unitPriceBox.value = standardPrice.toLocaleString("en-US", {style: 'currency', currency: 'USD'});
    } else if (productLineVal === "premium") {
        unitPriceBox.value = premiumPrice.toLocaleString("en-US", {style: 'currency', currency: 'USD'});
    } else if (productLineVal === "excelium") {
        unitPriceBox.value = exceliumPrice.toLocaleString("en-US", {style: 'currency', currency: 'USD'});
    }
    CalculateCosts();
};

//productLineSelector.addEventListener("change", UnitPriceUpdate)
//removed because "onchange" added to raido buttons

function ResidentialCagesNeeded(){
    if(numApartments.querySelector("input").value==="" || numFloors.querySelector("input").value===""){
        return;
    }
    let totalApartments = numApartments.querySelector("input").value
    let totalFloors = numFloors.querySelector("input").value
    let aptsPerFloor = totalApartments / totalFloors
//    console.log(aptsPerFloor)
    let cagesApts = Math.ceil(aptsPerFloor / 6)
//    console.log(cagesApts)
    let floorMultiplier = Math.ceil(parseInt(numFloors.querySelector("input").value) / 20)
//    console.log(floorMultiplier)
    document.querySelector("#required-elevators").value = cagesApts * floorMultiplier
};

function CorporateHybridCagesNeeded(){
    let totalFloors = parseInt(numFloors.querySelector("input").value) + parseInt(numBasements.querySelector("input").value)
//    console.log(totalFloors)
    let totalOccupants = maxOccupancy.querySelector("input").value * totalFloors
//    console.log(totalOccupants)
    let elevatorsRequired = Math.ceil(totalOccupants / 1000)
//    console.log(elevatorsRequired)
    let columnsRequired = Math.ceil(totalFloors / 20)
//    console.log(columnsRequired)
    let elevatorsPerColumn = Math.ceil(elevatorsRequired/columnsRequired)
//    console.log(elevatorsPerColumn)
    if (isNaN(elevatorsPerColumn * columnsRequired)){
        document.querySelector("#required-elevators").value = "";
        return;
    }
    document.querySelector("#required-elevators").value = elevatorsPerColumn * columnsRequired
};

function CalculateElevatorsNeeded(){
    let buildingVal = buildingTypeSelector.value
    if (buildingVal === "residential"){
        ResidentialCagesNeeded()
    } else if (buildingVal === "commercial"){
        document.querySelector("#required-elevators").value = numElevators.querySelector("input").value
    } else if (buildingVal === "corporate"){
        CorporateHybridCagesNeeded()
    } else if (buildingVal === "hybrid"){
        CorporateHybridCagesNeeded()
    }
    if(document.querySelector('input[name="service_grade"]:checked')===null){
        return;
    }
    CalculateCosts()
}

function CalculateCosts(){
    let productLineVal = document.querySelector('input[name="service_grade"]:checked').value
    let requiredNumOfElevators = document.querySelector("#required-elevators").value
    let partsTotalCost = 0
    let installationFee = 0
    let totalCost = 0
    let unitPrice = 0
    let unitFee = 0
    let partsTotalCostBox = document.querySelector("#parts-total-cost")
    let installationFeeBox = document.querySelector("#installation-fee")
    let totalCostBox = document.querySelector("#total-cost")
    partsTotalCostBox.value = ""
    installationFeeBox.value = ""
    totalCostBox.value = ""
    if (productLineVal === "standard"){
        unitPrice = standardPrice
        unitFee = standardFee
    } else if (productLineVal === "premium") {
        unitPrice = premiumPrice
        unitFee = premiumFee
    } else if (productLineVal === "excelium") {
        unitPrice = exceliumPrice
        unitFee = exceliumFee
    }
    partsTotalCost = unitPrice * requiredNumOfElevators
    installationFee = partsTotalCost * unitFee
    totalCost = partsTotalCost + installationFee

    partsTotalCostBox.value = (partsTotalCost).toLocaleString("en-US", {style: 'currency', currency: 'USD'})
    installationFeeBox.value = (installationFee).toLocaleString("en-US", {style: 'currency', currency: 'USD'})
    totalCostBox.value = (totalCost).toLocaleString("en-US", {style: 'currency', currency: 'USD'})
};

function imposeMinMax(el){
    if(el.value != ""){
      if(parseInt(el.value) < parseInt(el.min)){
        el.value = el.min;
      }
      if(parseInt(el.value) > parseInt(el.max)){
        el.value = el.max;
      }
    }
  };