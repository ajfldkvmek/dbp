<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!//선언부는 첫 방문자에 의해서 단 한번 수행합니다.

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String uid = "scott";
	String pass = "tiger";
	String sql = "select wafer_sec, count(*) as cnt from err_log group by wafer_sec	order by wafer_sec";
	String sql2 = "select count(*) from err_log";
	String str;
	String []strArr = new String[25];
	String test;
	int count[] = new int[25];
	int cnt = 0;
	int num = 0;
%>

<%
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, uid, pass);
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	while (rs.next()) {
		strArr[cnt] = rs.getString("cnt");
		//out.print(strArr[cnt] + " ");
		cnt++;
	}//while의 끝
	
	
	
	for(int i = 0; i < 25; i++) {
		num += Integer.parseInt(strArr[i]);
	}
	str = String.join(",", strArr);
	
	
	
} catch (Exception e) {
	e.printStackTrace();
} finally {
	try {
		if (rs != null)
	rs.close();
		if (stmt != null)
	stmt.close();
		if (conn != null)
	conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
} //finally의 끝

%>

<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Refractive index measurement system</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="code/css/highchart.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<style>
    .right {
        float: right;
        width: 50%;
    }
    .left {
        float: left;
        width: 50%;
    }
</style>
		<style type="text/css">
#container {
	height: 500px;
}

.highcharts-figure, .highcharts-data-table table {
    min-width: 320px; 
    max-width: 700px;
    margin: 1em auto;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}
.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}
.highcharts-data-table th {
	font-weight: 600;
    padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
    padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}
.highcharts-data-table tr:hover {
    background: #f1f7ff;
}

		</style>

</head>
<body class="sb-nav-fixed" style="height: 740px; padding-top: 180px;">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="index.html">Refractive index measurement system</a>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Measurement</div>
                             <a class="nav-link" href="measure.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Measurement
                            </a>
                            <a class="nav-link" href="input data to db.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Input data to DB
                            </a>                        
                            <div class="sb-sidenav-menu-heading">Analysis</div>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables
                            </a>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Results
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="section.html">Section</a>
                                    <a class="nav-link" href="resulterror.html">Error</a>
                                    <a class="nav-link" href="yield.html">Yield</a>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Code List</div>
                            <a class="nav-link" href="error.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Error Code
                            </a>
                            <a class="nav-link" href="solution.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Solution Code
                            </a>
                        </div>
                    </div>
                </div>    
            </nav>

            
        </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
    	crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script> 

<script src="code/highcharts.js"></script>
<script src="code/modules/exporting.js"></script>
<script src="code/modules/export-data.js"></script>
<script src="code/modules/accessibility.js"></script>
<script src="code/modules/coloraxis.js"></script>

    <div class="right">
<figure class="highcharts-figure">
    <div id="container"></div>
    <p class="highcharts-description">
        This chart shows the number of errors in each section as a percentage.
    </p>
</figure>



		<script type="text/javascript">
		
		
		var str = "<%= str%>";
		
	
		var arr = str.split(",");
		
		for(var i = 0; i < arr.length; i++)
			arr[i] = Number(arr[i]);
			
// Radialize the colors
Highcharts.setOptions({
    colors: Highcharts.map(Highcharts.getOptions().colors, function (color) {
        return {
            radialGradient: {
                cx: 0.5,
                cy: 0.3,
                r: 0.7
            },
            stops: [
                [0, color],
                [1, Highcharts.color(color).brighten(-0.2).get('rgb')] // darken
            ]
        };
    })
});

// Build the chart
Highcharts.chart('container', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: 'Proportion of errors per section'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    accessibility: {
        point: {
            valueSuffix: '%'
        }
    },
    colorAxis: {},
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                connectorColor: 'silver'
            }
        }
    },
    series: [{
        name: 'Share',
        colorBypoint: true,
        data: [
            { name: '1', y: arr[0] },
            { name: '2', y: arr[1] },
            { name: '3', y: arr[2] },
            { name: '4', y: arr[3] },
            { name: '5', y: arr[4] },
            { name: '6', y: arr[5] },
            { name: '7', y: arr[6] },
            { name: '8', y: arr[7] },
            { name: '9', y: arr[8] },
            { name: '10', y: arr[9] },
            { name: '11', y: arr[10] },
            { name: '12', y: arr[11] },
            { name: '13', y: arr[12] },
            { name: '14', y: arr[13] },
            { name: '15', y: arr[14] },
            { name: '16', y: arr[15] },
            { name: '17', y: arr[16] },
            { name: '18', y: arr[17]},
            { name: '19', y: arr[18] },
            { name: '20', y: arr[19] },
            { name: '21', y: arr[20] },
            { name: '22', y: arr[21] },
            { name: '23', y: arr[22] },
            { name: '24', y: arr[23] },
            { name: '25', y: arr[24] }

        ]
    }]
});

		</script>
        </div>
        <div class="left">>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <div class="card mb-4">  
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>Section no.</th>
                                        <th>Counts</th>
                                        <th>Percentage</th>
                                    </tr>
                                </thead>
                                <tbody>
						 -->		<%
									try {
										Class.forName("oracle.jdbc.driver.OracleDriver");
										conn = DriverManager.getConnection(url, uid, pass);
										stmt = conn.createStatement();
										rs = stmt.executeQuery(sql);
										while (rs.next()) {
											out.println("<tr>");
											out.println("<td>" + rs.getString("wafer_sec") + "</td>");
											out.println("<td>" + rs.getString("cnt") + "</td>");
											out.println("<td>" + (rs.getDouble("cnt") / num * 100) + "</td>");
											out.println("</tr>");
									
										} //while의 끝
									} catch (Exception e) {
										e.printStackTrace();
									} finally {
										try {
											if (rs != null)
										rs.close();
											if (stmt != null)
										stmt.close();
											if (conn != null)
										conn.close();
										} catch (Exception e) {
											e.printStackTrace();
										}
									} //finally의 끝
									
									%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>
</body>
</html>