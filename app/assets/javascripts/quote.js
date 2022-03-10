
var numApts = document.getElementById("number-of-apartments").value;
var numFloors = document.querySelector("#number-of-floors").value;
var numBase = document.querySelector("#number-of-basements").value;
var numComs = document.querySelector("#number-of-companies").value;
var numPS = document.querySelector("#number-of-parking-spots").value;
var numEle = document.querySelector("#number-of-elevators").value;
var numCorp = document.querySelector("#number-of-corporations").value;
var maxOcc = document.querySelector("#maximum-occupancy").value;
var busHrs = document.querySelector("#business-hours").value;


  var residential = document.querySelector(".resi");
  var commercial = document.querySelector(".comm");
  var corporate = document.querySelector(".corp");
  var hybrid = document.querySelector(".hybr");
  var dept = document.querySelector("#department");
  
  // Hide
  function hideStuff() {
      $(".resi").hide();
      $(".corp").hide();
      $(".hybr").hide();
      $(".comm").hide();
  };
  
  // Display
  function displayStuff() {
    dept.addEventListener("change", function display() {
      var deptVal = dept.value;
      if (deptVal === "residential") {
        hideStuff();
        $(".resi").show();
      } else if (deptVal === "corporate") {
        hideStuff();
        $(".corp").show();
      } else if (deptVal === "commercial") {
        hideStuff();
        $(".comm").show();
      } else if (deptVal === "hybrid") {
        hideStuff();
        $(".hybr").show();
      } else if (deptVal === "select") {
        hideStuff();
      }
     });
    };

hideStuff();
displayStuff();

// Quote Calculator
function quotecalculate () {

  console.log(numApts)
        var unitPrice;
        var percentage;
        if (document.getElementById('standard-option').checked) {
          unitPrice = 7565
          percentage = 0.1
        } else if (document.getElementById('premium-option').checked) {
          unitPrice = 12345
          percentage = 0.13
        } else if(document.getElementById('excelium-option').checked) {
          unitPrice = 15400
          percentage = 0.16 
        }
        if (dept.value === "residential") {
          var numApts = document.getElementById("num-of-apartments").value;
          var numFloors = document.querySelector("#num-of-floors").value;
          var avgAptPerFloor = Math.ceil(numApts/numFloors);
          var doorForApp = Math.ceil(avgAptPerFloor/6);
          var columnFloorRatio = Math.ceil(numFloors/20);
          var numEleRqd =  doorForApp * columnFloorRatio;
          var totalPriceOfElevators = numEleRqd * unitPrice;
          var installationFee = totalPriceOfElevators * percentage;
          var total = totalPriceOfElevators + installationFee;
        } else if (dept.value=== "commercial"){
          var numEle = document.querySelector("#num-of-elevators").value;
          var numEleRqd = numEle
          var totalPriceOfElevators = numEle * unitPrice;
          var installationFee = totalPriceOfElevators * percentage;
          var total = totalPriceOfElevators + installationFee;
        } else if (dept.value === "corporate"){
          var maxOcc = document.querySelector("#max-occupancy").value;
          var numFloors = document.querySelector("#num-of-floors").value;
          var numBase = document.querySelector("#num-of-basements").value;
          var totalFloor = (Number(numFloors) + Number(numBase));
          var totalOccupants = maxOcc * totalFloor;
          var numEle = totalOccupants/1000;
          var columnFloorRatio = Math.ceil(totalFloor/20);
          var eleColumnRatio = Math.ceil(numEle / columnFloorRatio);
          var numEleRqd = eleColumnRatio * columnFloorRatio;
          var totalPriceOfElevators = numEleRqd * unitPrice;
          var installationFee = totalPriceOfElevators * percentage;
          var total = totalPriceOfElevators + installationFee;
        } else if (dept.value === "hybrid"){
          var numFloors = document.querySelector("#num-of-floors").value;
          var numBase = document.querySelector("#num-of-basements").value;
          var maxOcc = document.querySelector("#max-occupancy").value;
          var totalFloor = (Number(numFloors) + Number(numBase));
          var totalOccupants = maxOcc * totalFloor;
          var numEle = totalOccupants/1000;
          var columnFloorRatio = Math.ceil(totalFloor/20);
          var eleColumnRatio = Math.ceil(numEle / columnFloorRatio);
          var numEleRqd = eleColumnRatio * columnFloorRatio;
          var totalPriceOfElevators = numEleRqd * unitPrice;
          var installationFee = totalPriceOfElevators * percentage;
          var total = totalPriceOfElevators + installationFee;
        };
        unitPrice = unitPrice || 0
        numEleRqd = numEleRqd || 0
        totalPriceOfElevators = totalPriceOfElevators || 0
        installationFee = installationFee || 0
        total = total || 0
        
        document.getElementById('elevator-unit-price1').value = ("$") + (Number(unitPrice).toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        document.getElementById('elevator-amount1').value = (numEleRqd);
        document.getElementById('elevator-total-price1').value = ("$") + (totalPriceOfElevators.toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        document.getElementById('installation-fees1').value = ("$") + (installationFee.toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        document.getElementById('final-price1').value = ("$") + (total.toFixed(2).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
      };