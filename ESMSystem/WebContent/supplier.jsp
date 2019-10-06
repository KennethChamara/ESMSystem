<!DOCTYPE html>
<html lang="en">
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/8922d3021e.js" crossorigin="anonymous"></script>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src='https://github.com/iconic/open-iconic.git'></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>


section {
   margin-top: 80px;
    margin-left: 150px;
    border-radius: 12px;
    padding-left: 35px;
    padding-right: 35px;
    margin-right: 150px;
    padding-top: 30px;
    padding-bottom: 35px;
    padding-right: 20px;
    background-color: #f1f4fa;
}
.wrap {
    display: flex;
    background: white;
    padding: 1rem 1rem 1rem 1rem;
    border-radius: 0.5rem;
    box-shadow: 7px 7px 30px -5px rgba(0,0,0,0.1);
    margin-bottom: 2rem;
  position: relative;
}

.wrap a{
  position: absolute;
  width:100%;
  height:100%;
  top:0px;
  left:0px;
}

.wrap:hover {
    background: linear-gradient(135deg,#6394ff 0%,#0a193b 100%);
    color: white;
}

.ico-wrap {
    margin: auto;
}

.mbr-iconfont {
    font-size: 4.5rem !important;
    color: #313131;
    margin: 1rem;
    padding-right: 1rem;
    color:#ffff4d;
}
.vcenter {
    margin: auto;
}

.mbr-section-title3 {
    text-align: left;
}
h2 {
    margin-top: 0.5rem;
    margin-bottom: 0.5rem;
}
.display-5 {
    font-family: 'Source Sans Pro',sans-serif;
    font-size: 1.4rem;
}
.mbr-bold {
    font-weight: 700;
}

 p {
    padding-top: 0.5rem;
    padding-bottom: 0.5rem;
    line-height: 25px;
}
.display-6 {
    font-family: 'Source Sans Pro',sans-serif;
    font-size: 1rem;
}
h.tech
{
    width: 240px;
    font-size: -webkit-xxx-large;
    font-weight: bold;
    height: max-content;
    color: black;

}
</style>





</head>
<body>
<jsp:include page="/WEB-INF/header.jsp"></jsp:include>


	<section>
			<h class="tech">Supplier and Products Portal</h>
<div class="container">

	
		<div class="row mbr-justify-content-center">

            <div class="col-lg-6 mbr-col-md-10">
                <div class="wrap">
                  <a href="addsupplier.jsp"></a>
                    <div class="ico-wrap">
                        <span class="mbr-iconfont fas fa-user-tie"> </span>
                    </div>
                    <div class="text-wrap vcenter">
                        <h2 class="mbr-fonts-style mbr-bold mbr-section-title3 display-5">Add <span>Supplier</span></h2>
                        <p class="mbr-fonts-style text1 mbr-text display-6">Details Such as adding suppliers report generating</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 mbr-col-md-10">
                <div class="wrap">
                  <a href="AddProductdetails.jsp"></a>
                    <div class="ico-wrap">
                        <span class="fas fa-people-carry mbr-iconfont"> </span>
                    </div>
                    <div class="text-wrap vcenter">
                        <h2 class="mbr-fonts-style mbr-bold mbr-section-title3 display-5">Add
                            <span>Products</span>
                        </h2>
                        <p class="mbr-fonts-style text1 mbr-text display-6">Details Such as adding products report generating</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 mbr-col-md-10">
                <div class="wrap">
                  <a href="Listsupplier.jsp"></a>
                    <div class="ico-wrap">
                        <span class="mbr-iconfont fas fa-clipboard-list"></span>
                    </div>
                    <div class="text-wrap vcenter">
                        <h2 class="mbr-fonts-style mbr-bold mbr-section-title3 display-5">Display
                            <span>Suppliers</span>
                        </h2>
                        <p class="mbr-fonts-style text1 mbr-text display-6">List all suppliers and Update/Delete the supplier</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 mbr-col-md-10">
                <div class="wrap">
                  <a href="Listproducts.jsp"></a>
                    <div class="ico-wrap">
                        <span class="mbr-iconfont fas fa-book"></span>
                    </div>
                    <div class="text-wrap vcenter">
                        <h2 class="mbr-fonts-style mbr-bold mbr-section-title3 display-5">Display <span>Products</span></h2>
                        <p class="mbr-fonts-style text1 mbr-text display-6">List all Products and Update/Delete the Products</p>
                    </div>
                </div>
            </div>

            

            
        </div>

</div>

</section>


</body>