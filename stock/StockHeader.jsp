<%@ include file="/security/Authenticate.jsp" %>
<div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Pushkar Ganesh Cotton Club Export Pvt. Ltd. (Stock Module)</a>
            </div>
            <!-- /.navbar-header -->
            <ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
	        		<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-comments-o"></i><span class="badge">4</span></a>
	        		<ul class="dropdown-menu">
						<li class="dropdown-menu-header">
							<strong>Messages</strong>
							<div class="progress thin">
							  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
							    <span class="sr-only">40% Complete (success)</span>
							  </div>
							</div>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="images/1.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
								<span class="label label-info">NEW</span>
							</a>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="images/2.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
								<span class="label label-info">NEW</span>
							</a>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="images/3.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
							</a>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="images/4.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
							</a>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="images/5.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
							</a>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="images/pic1.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
							</a>
						</li>
						<li class="dropdown-menu-footer text-center">
							<a href="#">View all messages</a>
						</li>	
	        		</ul>
	      		</li>
			    <li class="dropdown">
	        		<a href="#" class="dropdown-toggle avatar" data-toggle="dropdown"><img src="images/1.png"><span class="badge">9</span></a>
	        		<ul class="dropdown-menu">
						<li class="dropdown-menu-header text-center">
							<strong>Account</strong>
						</li>
						<li class="m_2"><a href="#"><i class="fa fa-bell-o"></i> Updates <span class="label label-info">42</span></a></li>
						<li class="m_2"><a href="#"><i class="fa fa-envelope-o"></i> Messages <span class="label label-success">42</span></a></li>
						<li class="m_2"><a href="#"><i class="fa fa-tasks"></i> Tasks <span class="label label-danger">42</span></a></li>
						<li><a href="#"><i class="fa fa-comments"></i> Comments <span class="label label-warning">42</span></a></li>
						<li class="dropdown-menu-header text-center">
							<strong>Settings</strong>
						</li>
						<li class="m_2"><a href="#"><i class="fa fa-user"></i> Profile</a></li>
						<li class="m_2"><a href="#"><i class="fa fa-wrench"></i> Settings</a></li>
						<li class="m_2"><a href="#"><i class="fa fa-usd"></i> Payments <span class="label label-default">42</span></a></li>
						<li class="m_2"><a href="#"><i class="fa fa-file"></i> Projects <span class="label label-primary">42</span></a></li>
						<li class="divider"></li>
						<li class="m_2"><a href="#"><i class="fa fa-shield"></i> Lock Profile</a></li>
						<li class="m_2"><a href="#"><i class="fa fa-lock"></i> Logout</a></li>	
	        		</ul>
	      		</li>
			</ul>
			<form class="navbar-form navbar-right">
              <input type="text" class="form-control" value="Search..." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search...';}">
            </form>
<div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                                             
                         <li>
                            <a href="StockIndex.jsp"><i class="fa fa-dashboard fa-fw nav_icon"></i><b>Home</b></a>
                        </li>
                        
                         
                         <li>
                            <a href="#"><i class="fa fa-laptop nav_icon"></i><b>Inspection</b><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="ReceiveAtInspFromDyer.jsp">Receive material from Dyer</a>
                                </li>
                                 <li>
                                    <a href="ReceiveAtInspFromPrinter.jsp">Receive material from Printer</a>
                                </li>
                             
                                 <li>
                                    <a href="Temp.jsp">Reports</a>
                                </li>
                               
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                       
                         <li>
                            <a href="#"><i class="fa fa-laptop nav_icon"></i><b>Receive Material </b><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="ReceiveAtStock.jsp">From Inspection Department</a>
                                </li>
                                   <li>
                                    <a href="ReceiveAtStockGM.jsp">From Supplier</a>
                                </li>
                                 <li>
                                    <a href="StockReceiveReport.jsp">Reports</a>
                                </li>
                               
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                           
                         <li>
                            <a href="#"><i class="fa fa-laptop nav_icon"></i><b>Issue to Cutting Dept</b><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="StockIssue.jsp">Issue </a>
                                </li>
                                
                                 <li>
                                    <a href="StockIssueReport.jsp">Reports</a>
                                </li>
                               
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                        <li>
                            <a href="#"><i class="fa fa-laptop nav_icon"></i><b>Issue to Sampling Dept</b><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="SampleIssue.jsp">Issue </a>
                                </li>
                                
                                 <li>
                                    <a href="SampleIssueReport.jsp">Report</a>
                                </li>
                               
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                       <li>
                            <a href=""><i class="fa fa-laptop nav_icon"></i><b>Update Stock</b><span class="fa arrow"></span></a>
                        
                         
                           <ul class="nav nav-second-level">
                                <li>
                                    <a href="UpdateStock.jsp">Plain/Print Stock </a>
                                </li>
                                
                                 <li>
                                    <a href="UpdateStockGM.jsp">Grey Material Stock</a>
                                </li>
                                <li>
                                    <a href="UpdateAccStock.jsp">Accessories Stock</a>
                                </li>
                               
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                      
                      <li>
                            <a href=""><i class="fa fa-laptop nav_icon"></i><b>Stock Report</b><span class="fa arrow"></span></a>
                        
                         
                           <ul class="nav nav-second-level">
                                <li>
                                    <a href="StockReport.jsp">Stock Report</a>
                                </li>
                                
                                 <li>
                                    <a href="StockAccReport.jsp">Accessories Stock Report</a>
                                </li>
                               
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                      
                      
                         <li>
                            <a href="RejectQtyMain.jsp"><i class="fa fa-laptop nav_icon"></i><b>Rejected Quantity Report</b><span class="fa arrow"></span></a>
                           
                            <!-- /.nav-second-level -->
                        </li>
                         <li>
                            <a href="/pgmis/Logout.jsp"><i class="fa fa-laptop nav_icon"></i><b>Logout</b><span class="fa arrow"></span></a>
                           
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>