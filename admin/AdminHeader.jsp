<%@ include file="/security/Authenticate.jsp" %>
<div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Pushkar Ganesh Cotton Club Export Pvt. Ltd. (Administration)</a>
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
                            <a href="AdminIndex.jsp"><i class="fa fa-dashboard fa-fw nav_icon"></i>Admin Home</a>
                        </li>
                        
                        <li>
                            <a href="#"><i class="fa fa-laptop nav_icon"></i>Fabric <span class="fa arrow"></span></a>
                          
                             <ul class="nav nav-third-level">
                                <li>
                                    <a href="AddFabric.jsp">Add Fabric</a>
                                </li>
                                 <li>
                                    <a href="EditFabric.jsp">Edit Fabric</a>
                                </li>
                                 <li>
                                    <a href="FabricReport.jsp">Fabric Report</a>
                                </li>
                                 <li>
                                    <a href="AddVariety.jsp">Add Variety</a>
                                </li>
                                 <li>
                                    <a href="EditVariety.jsp">Edit Variety</a>
                                </li>
                                 <li>
                                    <a href="VarietyReport.jsp">Variety Report</a>
                                </li>
                                   <li>
                                    <a href="AddPlain.jsp">Add Plain Code</a>
                                </li>
                                 <li>
                                    <a href="EditPlain.jsp">Edit Plain Master</a>
                                </li>
                                 <li>
                                    <a href="PlainReport.jsp">Plain Code Report</a>
                                </li>
                                <li>
                                    <a href="AddPrint.jsp">Add Print</a>
                                </li>
                                 <li>
                                    <a href="EditPrint.jsp">Edit Print</a>
                                </li>
                                 <li>
                                    <a href="PrintReport.jsp">Print Report</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                          </li>
                           
                          
                         
                        
                         
                        
                        
                    
                            <!-- /.nav-second-level -->
                   
                        
                      <li>
                            <a href="#"><i class="fa fa-laptop nav_icon"></i>Stakeholders<span class="fa arrow"></span></a>
                       
                      
                          <ul class="nav nav-third-level">
                                <li>
                                    <a href="AddSupplier.jsp">Add Suppplier</a>
                                </li>
                                 <li>
                                    <a href="EditSupplier.jsp">Edit Supplier</a>
                                </li>
                                 <li>
                                    <a href="SupplierReport.jsp">Supplier Report</a>
                                </li>
                                <li>
                                    <a href="AddDyer.jsp">Add Dyer</a>
                                </li>
                                 <li>
                                    <a href="EditDyer.jsp">Edit Dyer</a>
                                </li>
                                 <li>
                                    <a href="DyerReport.jsp">Dyer Report</a>
                                </li>
                                
                                  <li>
                                    <a href="AddPrinter.jsp">Add Printer</a>
                                </li>
                                 <li>
                                    <a href="EditPrinter.jsp">Edit Printer</a>
                                </li>
                                 <li>
                                    <a href="PrinterReport.jsp">Printer Report</a>
                                </li>
                                  <li>
                                    <a href="AddCustomer.jsp">Add Customer</a>
                                </li>
                                 <li>
                                    <a href="EditCustomer.jsp">Edit Customer</a>
                                </li>
                                 <li>
                                    <a href="CustomerReport.jsp">Customer Report</a>
                                </li>
                                  <li>
                                    <a href="AddTailor.jsp">Add Tailor</a>
                                </li>
                                 <li>
                                    <a href="EditTailor.jsp">Edit Tailor</a>
                                </li>
                                 <li>
                                    <a href="TailorReport.jsp">Tailor Report</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                      
                 
                        
                        </li>
                       
                          <li>
                            <a href="#"><i class="fa fa-laptop nav_icon"></i>Style<span class="fa arrow"></span></a>
                           <ul class="nav nav-third-level">
                                <li>
                                    <a href="AddProductCategory.jsp">Add Product Category</a>
                                </li>
                                 <li>
                                    <a href="EditProductCategory.jsp">Edit Product Category</a>
                                </li>
                                 <li>
                                    <a href="ProductCategoryReport.jsp">Product Category Report</a>
                                </li>
                                 <li>
                                    <a href="AddProductSubCategory.jsp">Add Product Sub Category</a>
                                </li>
                                 <li>
                                    <a href="EditProductSubCategory.jsp">Edit Product Sub Category</a>
                                </li>
                                 <li>
                                    <a href="ProductSubCategoryReport.jsp">Product Sub Category Report</a>
                                </li>
                                <li>
                                    <a href="AddStyle.jsp">Add Style</a>
                                </li>
                                 <li>
                                    <a href="AddStylePosition.jsp">Add Positions in Style</a>
                                </li>
                                 <li>
                                    <a href="EditStyle.jsp">Edit Style</a>
                                </li>
                                 <li>
                                    <a href="StyleReport.jsp">Style Report</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
       
                   
                     
                     <li>
                            <a href="#"><i class="fa fa-laptop nav_icon"></i>Accessories<span class="fa arrow"></span></a>
                             <ul class="nav nav-third-level">
                                    <li>
                                    <a href="AddAcc.jsp">Add Accessory</a>
                                </li>
                                 <li>
                                    <a href="EditAcc.jsp">Edit Accessory</a>
                                </li>
                                 <li>
                                    <a href="AccReport.jsp">Accessory Report</a>
                                </li>
                                   <li>
                                    <a href="AddAccType.jsp">Add Accessory Type</a>
                                </li>
                                 <li>
                                    <a href="EditAccType.jsp">Edit Accessory Type</a>
                                </li>
                                 <li>
                                    <a href="AccTypeReport.jsp">Accessory Type Report</a>
                                </li>
                                  <li>
                                    <a href="AddAccSubType.jsp">Add Accessory Sub-type</a>
                                </li>
                                 <li>
                                    <a href="EditAccSubType.jsp">Edit Accessory Sub-type</a>
                                </li>
                                 <li>
                                    <a href="AccSubTypeReport.jsp">Accessory Sub-type Report</a>
                                </li>
                                </ul>
                            <!-- /.nav-second-level -->
                           </li>
                          
                          
                         
                       
                        
                         <li>
                            <a href="#"><i class="fa fa-laptop nav_icon"></i>Verification<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="VerifyPO.jsp">Verify PO</a>
                                </li>
                                
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                      
                            
                        
                        </li>
                         
                         <li>
                            <a href="#"><i class="fa fa-laptop nav_icon"></i>User Management<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                      
                       <li>
                            <a href="#"><i class="fa fa-laptop nav_icon"></i>User Management<span class="fa arrow"></span></a>
                            <ul class="nav nav-third-level">
                                <li>
                                    <a href="AddUser.jsp">Add User</a>
                                </li>
                                 <li>
                                    <a href="EditUser.jsp">Edit User</a>
                                </li>
                                 <li>
                                    <a href="UserReport.jsp">User Report</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                      
                      <li>
                            <a href="OnlineQryReport.jsp"><i class="fa fa-laptop nav_icon"></i>Online Queries<span class="fa arrow"></span></a>
                           
                            <!-- /.nav-second-level -->
                        </li>
                      
                       <li>
                            <a href="LoginReport.jsp"><i class="fa fa-laptop nav_icon"></i>Login Report<span class="fa arrow"></span></a>
                           
                            <!-- /.nav-second-level -->
                        </li>
                         </ul>     
                        
                        </li>
                         
                        
                       
                        
                        
                        
                          
                        
                         <li>
                            <a href="/pgmis/Logout.jsp"><i class="fa fa-laptop nav_icon"></i>Logout<span class="fa arrow"></span></a>
                           
                            <!-- /.nav-second-level -->
                        </li>
                 
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>