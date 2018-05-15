package administration;

import java.io.*;
import java.sql.*;
import com.pwc.util.ConnectionManagers;
import java.util.Vector;
import javax.servlet.ServletRequest;
import java.util.*;
import java.text.*;
import java.util.Date;
import com.pwc.util.*;
import lib.util.BaseBean;
import lib.util.*;
import lib.test.AuditTrail;

public class SOMaster

{
  
String dtr1="",ss1="",gesName="",manu="", dtr="",dtr2="",dtr3="",dtrNo="",sstnNo="",ymanu="",cdtr="",pon="0",tender="0",po="0",so="0",poDtl="0",dyer="0",customer="0",otherCustomer="0",di="0";
int id=0,kva=0;
String fab="",acc="0",accType="0",accSubType="0", var="0",plain="0",invoice="0", product="0",style="0",subProduct="0",typeCheck="Print",print="0",optMonth="",optYear="";
int ges=0,division=0,subDivision=0,tenderName=0;
String adminId="",fetchPressed="",kvaName="",manuName="",startDate="",endDate="",transferDate="";
  String ratingCode="";
  String name="",amendmentNo="",remarks="";
  String displaySave="",styleType="self";;
  String tailor="0";
  String message="";
  String errorDisplay="",status="O";
  
  Connection conn = null;
  CallableStatement cstmt = null;
  String insertString="",updateString="",userName = "",compName = "";
  
  public SOMaster(){}

      
 public void setName(String name)  
    {  
      if(name != null) this.name = name;  else this.name = "";
    }
 public String getName(){return name;}
 
    public void setTypeCheck(String typeCheck)  
       {  
         if(typeCheck != null) this.typeCheck = typeCheck;  else this.typeCheck = "Print";
       }
    public String getTypeCheck(){return typeCheck;}
    
    public void setPrint(String print)  
       {  
         if(print != null) this.print = print;  else this.print = "0";
       }
    public String getPrint(){return print;}
    
    
    public void setStatus(String status)  
       {  
         if(status != null) this.status = status;  else this.status = "0";
       }
    public String getStatus(){return status;}
    
    public void setInvoice(String invoice)  
       {  
         if(invoice != null) this.invoice = invoice;  else this.invoice = "0";
       }
    public String getInvoice(){return invoice;}
    
    public void setFab(String fab)  
       {  
         if(fab != null) this.fab = fab;  else this.fab = "0";
       }
    public String getFab(){return fab;}
    
    public void setAcc(String acc)  
       {  
         if(acc != null) this.acc = acc;  else this.acc = "0";
       }
    public String getAcc(){return acc;}
    
    public void setAccType(String accType)  
       {  
         if(accType != null) this.accType = accType;  else this.accType = "0";
       }
    public String getAccType(){return accType;}
    
    public void setAccSubType(String accSubType)  
       {  
         if(accSubType != null) this.accSubType = accSubType;  else this.accSubType = "0";
       }
    public String getAccSubType(){return accSubType;}
    
    public void setProduct(String product)  
       {  
         if(product != null) this.product = product;  else this.product = "0";
       }
    public String getProduct(){return product;}
    
    public void setSubProduct(String subProduct)  
       {  
         if(subProduct != null) this.subProduct = subProduct;  else this.subProduct = "0";
       }
    public String getSubProduct(){return subProduct;}
    
    public void setCustomer(String customer)  
       {  
         if(customer != null) this.customer = customer;  else this.customer = "0";
       }
    public String getCustomer(){return customer;}
    
    public void setOtherCustomer(String otherCustomer)  
       {  
         if(otherCustomer != null) this.otherCustomer = otherCustomer;  else this.otherCustomer = "0";
       }
    public String getOtherCustomer(){return otherCustomer;}
    
    public void setStyle(String style)  
           {  
             if(style != null) this.style = style;  else this.style = "0";
           }
        public String getStyle(){return style;}
    
    public void setVar(String var)  
       {  
         if(var != null) this.var = var;  else this.var = "0";
       }
    public String getVar(){return var;}
    
    public void setStyleType(String styleType)  
       {  
         if(styleType != null) this.styleType = styleType;  else this.styleType = "self";
       }
    public String getStyleType(){return styleType;}
    
    
    public void setPlain(String plain)  
       {  
         if(plain != null) this.plain = plain;  else this.plain = "0";
       }
    public String getPlain(){return plain;}
    
    
    public void setDyer(String dyer)  
       {  
         if(dyer != null) this.dyer = dyer;  else this.dyer = "0";
       }
    public String getDyer(){return dyer;}
    
    
    
    
    public void setEndDate(String endDate)  
      {  
        if(endDate != null) this.endDate = endDate;  else this.endDate = "";
      }
    public String getEndDate(){return endDate;}
    
    
    public void setOptMonth(String optMonth)  
      {  
        if(optMonth != null) this.optMonth = optMonth;  else this.optMonth = "";
      }
    public String getOptMonth(){return optMonth;}
    
    public void setOptYear(String optYear)  
      {  
        if(optYear != null) this.optYear = optYear;  else this.optYear = "";
      }
    public String getOptYear(){return optYear;}
    
    
    public void setTransferDate(String transferDate)  
      {  
        if(transferDate != null) this.transferDate = transferDate;  else this.transferDate = "";
      }
    public String getTransferDate(){return transferDate;}
   public void setFetchPressed(String fetchPressed)  
      {  
        if(fetchPressed != null) this.fetchPressed = fetchPressed;  else this.fetchPressed = "";
      }
   public String getFetchPressed(){return fetchPressed;}
 
    public void setCdtr(String cdtr)
       {  
         if(cdtr != null) this.cdtr = cdtr;  else  this.cdtr = "";
       }
    public String getCdtr(){return cdtr;}
    
    public void setPon(String pon)
       {  
         if(pon != null) this.pon = pon;  else  this.pon = "0";
       }
    public String getPon(){return pon;}
    public void setAmendmentNo(String amendmentNo)  
     {  
       if(amendmentNo != null) this.amendmentNo = amendmentNo;  else this.amendmentNo = "";
     }
    public String getAmendmentNo(){return amendmentNo;}
    public void setTender(String tender)
       {  
         if(tender != null) this.tender = tender;  else  this.tender = "0";
       }
    public String getTender(){return tender;}
    
    public void setPo(String po)
       {  
         if(po != null) this.po = po;  else  this.po = "0";
       }
    public String getPo(){return po;}
    
    public void setTailor(String tailor)
       {  
         if(tailor != null) this.tailor = tailor;  else  this.tailor = "0";
       }
    public String getTailor(){return tailor;}
    
    public void setSo(String so)
       {  
         if(so != null) this.so = so;  else  this.so = "0";
       }
    public String getSo(){return so;}
    
    public void setPoDtl(String poDtl)
       {  
         if(poDtl != null) this.poDtl = poDtl;  else  this.poDtl = "0";
       }
    public String getPoDtl(){return poDtl;}
    
    

    public void setId(int id)
       {  
         if(id != 0) this.id = id;  else  id = 0;
       }
    public int getId(){return id;}
    
   public void setAdminId(String adminId)
      {  
        if(adminId != null) this.adminId = adminId;  else  adminId = "";
      }
   public String getAdminId(){return adminId;} 
    public void setRemarks(String remarks)  
       {  
         if(remarks != null) this.remarks = remarks;  else this.remarks = "";
       }
    public String getRemarks(){return remarks;}
   
  public void setUserName(String userName)  
    {  
      if(userName != null) this.userName = userName;  else this.userName = "";
    }
 public String getUserName(){return userName;}
 
   public void setCompName(String compName)  
    {  
      if(compName != null) this.compName = compName;  else this.compName = "";
    }
 public String getCompName(){return compName;}
    public void setStartDate(String startDate)  
      {  
        if(startDate != null) this.startDate = startDate;  else this.startDate = "";
      }
    public String getStartDate(){return startDate;}
    public void setKva(int IKva)
       {  
         if(IKva != 0) kva = IKva;  else  kva = 0;
       }
    public int getKva(){return kva;}
    public void setManu(String manu)  
       {  
         if(manu != null) this.manu = manu;  else this.manu = "";
       }
    public String getManu(){return manu;}
    public void setTenderName(int ItenderName)
       {  
         if(ItenderName != 0) tenderName = ItenderName;  else  tenderName = 0;
       }
    public int getTenderName(){return tenderName;}
    public void setDi(String di)
       {  
         if(di != null) this.di = di;  else  this.di = "0";
       }
    public String getDi(){return di;}
   
    public String getPOMasterList() throws SQLException
     {
      String sql = "SELECT ID, PO_NO NAME FROM t_po_master WHERE PO_STATUS!='C' ORDER BY ID";
      LTStudList = BaseBean.get().getSelectHtmlOnChange("po",sql,"showData()",getPo());
      return LTStudList;
     }
    public String getTailorListOnChange() throws SQLException
     {
      String sql = "SELECT ID, concat(ACC_NO,'-',NAME)  NAME FROM t_tailor_master ORDER BY NAME";
      LTStudList = BaseBean.get().getSelectHtmlOnChange("tailor",sql,"showData()",getTailor());
      return LTStudList;
     }
    public String getPOSupllierMasterList() throws SQLException
     {
      String sql = "SELECT P.ID ID, concat(PO_NO,'-',S.NAME,'-dated.',DATE_FORMAT(PO_DATE,'%d-%b-%Y')) NAME FROM t_po_master P, t_supplier_master S where P.SUP_ID= S.ID and PO_STATUS!='C' ORDER BY ID";
      LTStudList = BaseBean.get().getSelectHtmlOnChange("po",sql,"showData()",getPo());
      return LTStudList;
     }
    public String getSOTailorWithDateListOnChange() throws SQLException
     {
      String sql = "SELECT DISTINCT so.ID ID, concat(c.NAME,'-',SO_NO,'-','-dated.',DATE_FORMAT(SO_DATE,'%d-%b-%Y')) NAME "+
                   " FROM t_so_master so, t_so_details sod, t_tailor_issue t, t_customer_master c"+
                   " where t.so_dtl_id= sod.id and sod.SO_ID=so.ID  and so.cust_id= c.id"+
                   " and t.TLR_ID="+tailor+"  ORDER BY ID";
      LTStudList = BaseBean.get().getSelectHtmlOnChange("so",sql,"showData()",getSo());
      return LTStudList; 
     }
    public String getSOWithDateListOnChange() throws SQLException
     {
      String sql = "SELECT SO.ID ID, concat(SO_NO,'-','-dated.',DATE_FORMAT(SO_DATE,'%d-%b-%Y')) NAME FROM t_so_master SO where CUST_ID="+customer+"  ORDER BY ID";
      LTStudList = BaseBean.get().getSelectHtmlOnChange("so",sql,"showData()",getSo());
      return LTStudList;
     }
    public String getDyerList() throws SQLException
     {
      String sql = "SELECT ID, NAME FROM t_dyer_master ORDER BY NAME";
      LTStudList = BaseBean.get().getSelectHtml("dyer",sql,getDyer());
      return LTStudList;
     }
    public String getSoPrintList(String soId) throws SQLException
     {
      String sql = "SELECT ID, NAME FROM t_print_master where id  in (select print_id from t_so_var_print_mapping where so_id="+soId+") ORDER BY NAME";
      LTStudList = BaseBean.get().getSelectHtml("print",sql,getPrint());
      return LTStudList;
     }
    public String getFabricListOnChange() throws SQLException
     {
      String sql = "SELECT ID,  NAME FROM t_fabric_master ORDER BY ID";
      LTStudList = BaseBean.get().getSelectHtmlOnChange("fab",sql,"showData()",getFab());
      return LTStudList;
     }
    public String getAccListOnChange() throws SQLException
     {
      String sql = "SELECT ID,  NAME FROM t_acc_master ORDER BY ID";
      LTStudList = BaseBean.get().getSelectHtmlOnChange("acc",sql,"showData()",getAcc());
      return LTStudList;
     }
    public String getFabricList() throws SQLException
     {
      String sql = "SELECT ID,  NAME FROM t_fabric_master ORDER BY ID";
      LTStudList = BaseBean.get().getSelectHtml("fab",sql,getFab());
      return LTStudList;
     }
    public String getProductCategoryList() throws SQLException
     {
      String sql = "SELECT ID,  NAME FROM t_product_master ORDER BY ID";
      LTStudList = BaseBean.get().getSelectHtml("product",sql,getProduct());
      return LTStudList;
     }
    public String getAccList() throws SQLException
     {
      String sql = "SELECT ID,  NAME FROM t_acc_master ORDER BY ID";
      LTStudList = BaseBean.get().getSelectHtml("acc",sql,getAcc());
      return LTStudList;
     }
    public String getProductCategoryListOnChange() throws SQLException
     {
      String sql = "SELECT ID,  NAME FROM t_product_master ORDER BY ID";
      LTStudList = BaseBean.get().getSelectHtmlOnChange("product",sql,"showData()",getProduct());
      return LTStudList;
     }
    public String getProductSubCategoryListOnChange() throws SQLException
     {
        // System.out.println("lets see"+product);
             
         if(product != "0")
         {
         String sql = "SELECT  ID,  NAME FROM t_product_sub_master WHERE PRODUCT_ID='"+product+"'";
         DivisionList = BaseBean.get().getSelectHtmlOnChange("subProduct",sql,"showData()",getSubProduct());
         return DivisionList;
         }
         else{
             DivisionList = BaseBean.get().emptyListBox("subProduct");
             return DivisionList;
         }
      
     }
    
    public String getAccTypeListOnChange() throws SQLException
     {
        // System.out.println("lets see"+product);
             
         if(acc != "0")
         {
         String sql = "SELECT  ID,  NAME FROM t_acc_type_master WHERE ACC_ID='"+acc+"'";
         DivisionList = BaseBean.get().getSelectHtmlOnChange("accType",sql,"showData()",getAccType());
         return DivisionList;
         }
         else{
             DivisionList = BaseBean.get().emptyListBox("accType");
             return DivisionList;
         }
      
     }
    public String getAccSubTypeListOnChange() throws SQLException
     {
        // System.out.println("lets see"+product);
             
         if(accType != "0")
         {
         String sql = "SELECT  ID,  NAME FROM t_acc_sub_type_master WHERE TYPE_ID="+accType+""; 
         DivisionList = BaseBean.get().getSelectHtmlOnChange("accSubType",sql,"showData()",getAccSubType());
         return DivisionList;
         }
         else{
             DivisionList = BaseBean.get().emptyListBox("accSubType");
             return DivisionList;
         }
      
     }
    
    public String getInvoiceListOnChange() throws SQLException
     {
        // System.out.println("lets see"+product);
             
         if(so != "0")
         {
         String sql = "SELECT  ID , concat(INV_NO,'-','-dated.',DATE_FORMAT(INV_DATE,'%d-%b-%Y')) NAME FROM "+
                      " t_invoice_master WHERE SO_ID='"+so+"'";
         DivisionList = BaseBean.get().getSelectHtmlOnChange("invoice",sql,"showData()",getInvoice());
         return DivisionList;
         }
         else{
             DivisionList = BaseBean.get().emptyListBox("invoice");
             return DivisionList;
         }
      
     }
    public String getSOPrintListOnChange() throws SQLException
     {
        // System.out.println("lets see"+product);
             
         if(so != "0")
         {
        
             String  sql ="  SELECT DISTINCT PRINT.ID ID,PRINT.NAME NAME from t_so_combo_details SOC, t_style_details SD , "+ 
                                   "  t_style_master S, t_so_master SO, t_so_details SOD, "+ 
                                   "  t_print_master PRINT WHERE SOC.SO_DTL_ID= SOD.ID  AND SOD.SO_ID= SO.ID"+ 
                                   " AND SOC.ST_DTL_ID=SD.ID AND SD.STYLE_ID= S.ID "+ 
                                   " AND SOC.TYPE_ID= PRINT.ID "+ 
                                   " AND SOC.TYPE_CHECK='Print' "+ 
                                   " AND SO.ID="+so+"";
             
         
         DivisionList = BaseBean.get().getSelectHtmlOnChange("print",sql,"showData()",getPrint());
         return DivisionList;
         }
         else{
             DivisionList = BaseBean.get().emptyListBox("print");
             return DivisionList;
         }
      
     }
    
    public String getCustomerListOnChange() throws SQLException
     {
      String sql = "SELECT ID,  NAME FROM t_customer_master ORDER BY ID";
      LTStudList = BaseBean.get().getSelectHtmlOnChange("customer",sql,"showData()",getCustomer());
      return LTStudList;
     }
    public String getCustomerListOnChangeSODetails() throws SQLException
     {
      String sql = "SELECT ID,  NAME FROM t_customer_master where ID!=0 ORDER BY ID";
      LTStudList = BaseBean.get().getSelectHtmlOnChange("customer",sql,"showDataSoDetails()",getCustomer());
      return LTStudList;
     }
    public String getCustomerListStyleOnChange() throws SQLException
     {
      String sql = "SELECT ID,  NAME FROM t_customer_master ORDER BY ID";
      LTStudList = BaseBean.get().getSelectHtmlOnChange("customer",sql,"showDataCustomer()",getCustomer());
      return LTStudList;
     }
    public String getOtherCustomerListOnChange() throws SQLException
     {
      if(customer != "0")
      {
      String sql = "SELECT ID,  NAME FROM t_customer_master where ID!="+customer+" ORDER BY ID";
      LTStudList = BaseBean.get().getSelectHtmlOnChange("otherCustomer",sql,"showData()",getOtherCustomer());
      return LTStudList;
      }else{
          
          LTStudList = BaseBean.get().emptyListBox("otherCustomer");
          return LTStudList;
      
      }
      
     }
    
    public String getCustomerList() throws SQLException
     {
      String sql = "SELECT ID,  NAME FROM t_customer_master ORDER BY ID";
      LTStudList = BaseBean.get().getSelectHtml("customer",sql,getCustomer());
      return LTStudList;
     }
    public String getCustomerSaleList() throws SQLException
     {
      String sql = "SELECT ID,  NAME FROM t_customer_master where ID!=0 ORDER BY ID";
      LTStudList = BaseBean.get().getSelectHtml("customer",sql,getCustomer());
      return LTStudList;
     }
    public String getStyleListOnChange() throws SQLException
     {
     
         if(customer != "0")
         {
         String sql = "SELECT  ID,  NAME FROM t_style_master WHERE CUST_ID='"+customer+"'";
         LTStudList = BaseBean.get().getSelectHtmlOnChange("style",sql,"showData()",getStyle());
         return LTStudList;
         }
         else{
             LTStudList = BaseBean.get().emptyListBox("style");
             return LTStudList;
         }
         
      
     }
    
    public String getStyleListOnChange2() throws SQLException
     { 
        //System.out.println("otherCustomer-"+otherCustomer); 
         //System.out.println("customer-"+customer); 
        
         if(styleType.equalsIgnoreCase("customer"))
         {
         String sql = "SELECT  ID,  NAME FROM t_style_master WHERE CUST_ID='"+otherCustomer+"'";
         
          if(!optMonth.equalsIgnoreCase(""))sql+= " AND MONTH='"+optMonth+"'";
          if(!optYear.equalsIgnoreCase(""))sql+= " AND YEAR='"+optYear+"'";
     
         LTStudList = BaseBean.get().getSelectHtmlOnChange("style",sql,"showData()",getStyle());
         return LTStudList;
         }else if(styleType.equalsIgnoreCase("self"))
         {
            // System.out.println("sql-"); 
         String sql = "SELECT  ID,  NAME FROM t_style_master WHERE CUST_ID='"+customer+"'";
            
             if(!optMonth.equalsIgnoreCase(""))sql+= " AND MONTH='"+optMonth+"'";
             if(!optYear.equalsIgnoreCase(""))sql+= " AND YEAR='"+optYear+"'";
             
             
         LTStudList = BaseBean.get().getSelectHtmlOnChange("style",sql,"showData()",getStyle());
         return LTStudList;
         }
         else{
             LTStudList = BaseBean.get().emptyListBox("style");
             return LTStudList;
         }
       
     }
    
    public String getStyleListOnChange3() throws SQLException
     { 
        // System.out.println("otherCustomer-"+otherCustomer); 
         //System.out.println("customer-"+customer); 
        
         if(!customer.equalsIgnoreCase("0"))
         {
         String sql = "select distinct s.ID ID, s.NAME NAME from "+
                        " t_style_master s, t_style_details sd, t_so_master so,  "+
                         " t_so_details sod, t_so_combo_details soc, t_customer_master c "+
                         " where soc.so_dtl_id= sod.id and sod.so_id= so.id  "+
                         " and soc.st_dtl_id= sd.id and sd.style_id= s.id "+
                         " and so.cust_id= c.id "+
                         " and c.id="+customer+"";
                    
         
         LTStudList = BaseBean.get().getSelectHtmlOnChange("style",sql,"showData()",getStyle());
         return LTStudList;
         }
         else{
             LTStudList = BaseBean.get().emptyListBox("style");
             return LTStudList;
         }
       
     }
    public String getStyleListOnChange4() throws SQLException
     { 
        // System.out.println("otherCustomer-"+otherCustomer); 
         //System.out.println("customer-"+customer); 
        
         if(!customer.equalsIgnoreCase("0")&&!so.equalsIgnoreCase("0"))
         {
         String sql = "select distinct s.ID ID, s.NAME NAME from "+
                        " t_style_master s, t_style_details sd, t_so_master so,  "+
                         " t_so_details sod, t_so_combo_details soc, t_customer_master c "+
                         " where soc.so_dtl_id= sod.id and sod.so_id= so.id  "+
                         " and soc.st_dtl_id= sd.id and sd.style_id= s.id "+
                         " and so.cust_id= c.id "+
                         " and so.id="+so+"";
                         //" and c.id="+customer+"";
                    
         
         LTStudList = BaseBean.get().getSelectHtmlOnChange("style",sql,"showData()",getStyle());
         return LTStudList;
         }
         else{
             LTStudList = BaseBean.get().emptyListBox("style");
             return LTStudList;
         }
       
     }
    public String getStyleInvoiceList(String soT) throws SQLException
     { 
        // System.out.println("otherCustomer-"+otherCustomer); 
         //System.out.println("customer-"+customer); 
        
         if(!soT.equalsIgnoreCase("0"))
         {
         String sql = "select distinct s.ID ID, s.NAME NAME from "+
                        " t_style_master s, t_style_details sd, t_so_master so,  "+
                         " t_so_details sod, t_so_combo_details soc, t_customer_master c "+
                         " where soc.so_dtl_id= sod.id and sod.so_id= so.id  "+
                         " and soc.st_dtl_id= sd.id and sd.style_id= s.id "+
                         " and so.cust_id= c.id "+
                         " and so.id="+soT+"";
                         //" and c.id="+customer+"";
                    
         
         LTStudList = BaseBean.get().getSelectHtml("style",sql,getStyle());
         return LTStudList;
         }
         else{
             LTStudList = BaseBean.get().emptyListBox("style");
             return LTStudList;
         }
       
     }
    
    public String getCapacityList() throws SQLException
    {

        String sql = "SELECT ID, NAME FROM TMS_RATING ORDER BY ID";
        LTStudList = BaseBean.get().getSelectHtml("kva",sql,getKva());
        return LTStudList;
    }
    public String getCapacityListUploaded(String diVal) throws SQLException
    {

        String sql = "SELECT ID, NAME FROM TMS_RATING WHERE ID IN (SELECT DISTINCT KVA_RATING FROM TMS_DI_DTR_CSV_UPLOAD WHERE DI_ID="+diVal+") ORDER BY ID";
        LTStudList = BaseBean.get().getSelectHtml("kva",sql,getKva());
        return LTStudList;
    }
    public String getSupplierList() throws SQLException
     {
       String sql = "SELECT ID, NAME FROM t_supplier_master ORDER BY NAME";
       ManufacturerList = BaseBean.get().getSelectHtml("manu",sql,getManu());
       return ManufacturerList;
     } 
    public String getTypeCheckList() throws SQLException
     {
       String sql = "SELECT NAME ID, NAME FROM t_type_check ORDER BY NAME";
       ManufacturerList = BaseBean.get().getSelectHtml("typeCheck",sql,getTypeCheck());
       return ManufacturerList;
     }
    
    public String getTypeCheckListOnChange() throws SQLException
     {
       String sql = "SELECT NAME ID, NAME FROM t_type_check ORDER BY NAME";
       ManufacturerList = BaseBean.get().getSelectHtmlOnChange("typeCheck",sql,"showData()",getTypeCheck());
       return ManufacturerList;
     }
    public String getVarietyList() throws SQLException
     {
         if(fab != "0")
         {
         String sql = "SELECT  ID,  NAME FROM t_var_master WHERE FABRIC_ID='"+fab+"'";
         DivisionList = BaseBean.get().getSelectHtml("var",sql,getVar());
         return DivisionList;
         }
         else{
             DivisionList = BaseBean.get().emptyListBox("var");
             return DivisionList;
         }
     }
    public String getVarietyListOnChange() throws SQLException
     {
         if(fab != "0")
         {
         String sql = "SELECT  ID,  NAME FROM t_var_master WHERE FABRIC_ID='"+fab+"'";
         DivisionList = BaseBean.get().getSelectHtmlOnChange("var",sql,"showData()",getVar());
         return DivisionList;
         }
         else{
             DivisionList = BaseBean.get().emptyListBox("var");
             return DivisionList;
         }
     }
    public String getProductSubCategoryList() throws SQLException
     {
         if(product != "0")
         {
         String sql = "SELECT  ID,  NAME FROM t_product_sub_master WHERE PRODUCT_ID='"+product+"'";
         DivisionList = BaseBean.get().getSelectHtml("subProduct",sql,getSubProduct());
         return DivisionList;
         }
         else{
             DivisionList = BaseBean.get().emptyListBox("subProduct");
             return DivisionList;
         }
     }
    public String getPoDtlList() throws SQLException
     {
         if(po != "0")
         {
         String sql = "SELECT  P.ID ID, concat(FAB.NAME,' - ',VAR.name,' - ',P.qty,' mtrs')  NAME FROM t_po_details P, t_fabric_master FAB, t_var_master VAR "+
                      " WHERE P.VAR_ID= VAR.ID and VAR.FABRIC_ID= FAB.ID "+
                      " and P.PO_ID= "+po+" order by P.ID asc";
         DivisionList = BaseBean.get().getSelectHtmlOnChange("poDtl",sql,"showData()",getPoDtl());
         return DivisionList;
         }
         else{
             DivisionList = BaseBean.get().emptyListBox("poDtl");
             return DivisionList;
         }
     }
    
    public String getPlainCodeList(String vId) throws SQLException
     {
         if(vId != "0")
         {
         String sql = "SELECT  ID,NAME FROM t_plain_master where VAR_ID="+vId+" order by NAME asc";
         DivisionList = BaseBean.get().getSelectHtml("plain",sql,getPlain());
         return DivisionList;
         }
         else{
             DivisionList = BaseBean.get().emptyListBox("plain");
             return DivisionList;
         }
     }
    public String getPrintList() throws SQLException
     {
         
         String sql = "SELECT  concat('Print-',ID) ID,NAME FROM t_print_master" + 
         " union select concat('Plain-',ID)ID, NAME FROM t_plain_master";
         DivisionList = BaseBean.get().getSelectHtml("print",sql,getPrint());
         return DivisionList;
     }
    public String getPrintListOnChange() throws SQLException
     {
         if(!var.equalsIgnoreCase("0"))
         {
        // String sql = "SELECT  concat('Print-',ID) ID,concat('Print-',NAME)NAME,t_print_master.ID PRID FROM t_print_master" + 
         //" union select concat('Plain-',ID)ID, concat('Plain-',NAME)NAME,t_plain_master.ID PRID FROM t_plain_master WHERE VAR_ID="+var+" order by PRID ASC";
        
          String sql = "SELECT  concat('Print-',ID) ID,NAME,t_print_master.ID PRID FROM t_print_master" + 
         " union select concat('Plain-',ID)ID, NAME,t_plain_master.ID PRID FROM t_plain_master WHERE VAR_ID="+var+" order by PRID ASC";
         
        
         DivisionList = BaseBean.get().getSelectHtmlOnChange("print",sql,"showData()",getPrint());
         return DivisionList;
        
         }else{
             DivisionList = BaseBean.get().emptyListBox("print");
             return DivisionList;
         }
     }
    public String getRestrictedPrintList() throws SQLException
     {
         
         if(!so.equalsIgnoreCase("0") && !style.equalsIgnoreCase("0"))
         { 
         String sql=" SELECT concat('Print-',PRINT.ID) ID,PRINT.NAME"+
         "   from t_so_combo_details SOC, t_style_details SD , t_style_master S, t_so_master SO,  "+
                              "  t_so_details SOD,t_print_master PRINT WHERE SOC.SO_DTL_ID= SOD.ID  AND SOD.SO_ID= SO.ID   "+
                              "    AND SOC.ST_DTL_ID=SD.ID AND SD.STYLE_ID= S.ID    "+
                              "    AND SOC.TYPE_ID= PRINT.ID  "+
                              "    AND SOC.TYPE_CHECK='Print' "+
                              "    AND SO.ID="+getSo()+" "+ 
                              "   AND S.ID="+getStyle()+"";
         
          sql+=" union SELECT concat('Plain-',PRINT.ID) ID,PRINT.NAME "+
         "   from t_so_combo_details SOC, t_style_details SD , t_style_master S, t_so_master SO,  "+
                              "  t_so_details SOD,t_plain_master PRINT WHERE SOC.SO_DTL_ID= SOD.ID  AND SOD.SO_ID= SO.ID   "+
                              "    AND SOC.ST_DTL_ID=SD.ID AND SD.STYLE_ID= S.ID    "+
                              "    AND SOC.TYPE_ID= PRINT.ID  "+
                              "    AND SOC.TYPE_CHECK='Plain' "+
                              "    AND SO.ID="+getSo()+" "+ 
                              "   AND S.ID="+getStyle()+"";
         
         DivisionList = BaseBean.get().getSelectHtmlOnChange("print",sql,"showData()",getPrint());
         return DivisionList;
         }         else{
             DivisionList = BaseBean.get().emptyListBox("print");
             return DivisionList;
         }
          
     }
  public void displayData()
  {
       try
         {
         
           sql = "SELECT TENDER_NAME,TO_CHAR(MC_DATE,'DD-MON-YYYY') MC_DATE,STATUS FROM TMS_TENDER_PURCHASE WHERE ID = "+tenderName;
           //System.out.println(sql);
           c = new ConnectionManagers().startConnection();
           s = c.createStatement();
           rs = s.executeQuery(sql);
           if(rs.next())
           {
             tender = rs.getString("TENDER_NAME"); if (name == null) name="";
             startDate = rs.getString("MC_DATE"); if (startDate == null) startDate="";
             status = rs.getString("STATUS"); if (status == null) status="O";
             
             rs.close();
             s.close();
             c.close();
           }else
           {
             tender = "";
             startDate = "";
             status="O";
             
           }
             try{
                 if(rs!=null)rs.close();
                 if(s!=null)s.close();
                 if(c!=null)c.close();
             }catch(Exception er){}
           
         }
       catch (SQLException e)
         {
           //e.printStackTrace();
         }    finally{
             
             try{
                 if(rs!=null)rs.close();
                 if(s!=null)s.close();
                 if(c!=null)c.close();
             }catch(Exception er){}
             
         }
    
   }
    public void displayData1()
    {
         try
           {
           
             sql = "SELECT TO_CHAR(MANU_OFFERED_TST_DATE,'DD-MON-YYYY') MC_DATE,WORKS_PRICE FROM TMS_TENDER_INFO WHERE ID = "+tenderName;
             //System.out.println(sql);
             c = new ConnectionManagers().startConnection();
             s = c.createStatement();
             rs = s.executeQuery(sql);
             if(rs.next())
             {
               tender = rs.getString("WORKS_PRICE"); if (tender == null) tender="";
               startDate = rs.getString("MC_DATE"); if (startDate == null) startDate="";
               
               rs.close();
               s.close();
               c.close();
             }else
             {
               tender = "";
               startDate = "";
               
             }
               try{
                   if(rs!=null)rs.close();
                   if(s!=null)s.close();
                   if(c!=null)c.close();
               }catch(Exception er){}
             
           }
         catch (SQLException e)
           {
             //e.printStackTrace();
           }    finally{
               
               try{
                   if(rs!=null)rs.close();
                   if(s!=null)s.close();
                   if(c!=null)c.close();
               }catch(Exception er){}
               
           }
      
     }
    public void saveTestingDates(ServletRequest request)
         {
          try
          {       getConnection();
                  s=c.createStatement();  
                   
                        
                       
                       String ponVal = request.getParameter("pon");
                       String diVal = request.getParameter("di"); 
                       String kvaVal = request.getParameter("kva"); 
                      
                       String startDateVal = request.getParameter("startDate");
                       //System.out.println("startDateVal"+startDateVal);
                       String offerDateVal = request.getParameter("offerDate");
                       String endDateVal = request.getParameter("endDate");
               
                       String dtrOfferedVal= request.getParameter("dtrOffered"); if(dtrOfferedVal==null)dtrOfferedVal="";
                       String dtrOfferedActualVal= request.getParameter("dtrOfferedActual"); if(dtrOfferedActualVal==null)dtrOfferedActualVal="";
                       
                       if(dtrOfferedVal.equalsIgnoreCase(""))dtrOfferedVal="0";
                        if(dtrOfferedActualVal.equalsIgnoreCase(""))dtrOfferedActualVal="0";         
                       
                       String dtrPassedVal= request.getParameter("dtrPassed"); if(dtrPassedVal==null)dtrPassedVal="";
                       if(dtrPassedVal.equalsIgnoreCase(""))dtrPassedVal="0";
               
                       String remarksVal= request.getParameter("remarks"); if(remarksVal==null)remarksVal="";
                    
                       
                       
                       //System.out.println("Reached Here");
                       int maxId = MaxId.get().maxId("TMS_MANU_TESTING_DETAILS");
                      //System.out.println("calling line");
                      String insertSql="INSERT INTO TMS_MANU_TESTING_DETAILS(ID,PO_ID,TESTING_OFFER_DATE,TESTING_START_DATE ,TESTING_END_DATE,"+
                      " DTR_FOR_TESTING ,DTR_PASSED,REMARKS,ACTUAL_DTR_OFFERED_FOR_TESTING,DI_ID,KVA_RATING) VALUES ("+
                      ""+maxId+","+ponVal+",to_date('"+offerDateVal+"','DD-MON-YYYY'),to_date('"+startDateVal+"','DD-MON-YYYY'),to_date('"+endDateVal+"','DD-MON-YYYY'),"+
                      " "+dtrOfferedVal+","+dtrPassedVal+",'"+remarksVal+"',"+dtrOfferedActualVal+","+diVal+","+kvaVal+")";
                      //System.out.println("insert sql2:-"+insertSql);
                      int x= s.executeUpdate(insertSql);
                      message="Data Saved Successfully";
                      if(c!=null)c.close();
                      if(s!=null)s.close();    
              clearData();
                  
          }
         catch (SQLException e)
          {
             //e.printStackTrace();
              //System.out.println(e.getMessage());
          }catch (Exception e)
          {
             //e.printStackTrace();
              //System.out.println(e.getMessage());
          }
          finally
            {
              try
              {
                if(c != null) c.close();
                if(s!=null) s.close();
              }catch(SQLException sqle){}
                  }
             
         }
    public void saveTenderDetail(ServletRequest request)
         {
          try
          {       getConnection();
                  s=c.createStatement();  
                   
                        
                      String tender = request.getParameter("tender");
                      String kva = request.getParameter("kva"); if(kva==null)kva="0";
                      String noTrans = request.getParameter("noTrans"); if(noTrans==null)noTrans="0";
                     
                      String workPriceVal= request.getParameter("workPrice"); if(workPriceVal==null)workPriceVal="";
                      if(workPriceVal.equalsIgnoreCase(""))workPriceVal="0";
              
                      String faPriceVal= request.getParameter("faPrice"); if(faPriceVal==null)faPriceVal="";
                      if(faPriceVal.equalsIgnoreCase(""))faPriceVal="0";
                      
                      
                      //System.out.println("Reached Here");
                      int maxId = MaxId.get().maxId("TMS_PO_DETAILS");
                      //System.out.println("calling line");
                      String insertSql="INSERT INTO TMS_PO_DETAILS(ID,PO_ID,KVA_RATING,"+
                      " NO_TRANSFORMER , WORKS_PRICE,FI_PRICE) VALUES ("+
                      " "+maxId+", "+tender+","+kva+","+
                      " "+noTrans+","+workPriceVal+","+faPriceVal+")";
                      //System.out.println("insert sql2:-"+insertSql);
                      int x= s.executeUpdate(insertSql);
                      message="Data Saved Successfully";
                      if(c!=null)c.close();
                      if(s!=null)s.close();    
              clearData();
                  
          }
         catch (SQLException e)
          {
             //e.printStackTrace();
              //System.out.println(e.getMessage());
          }catch (Exception e)
          {
             //e.printStackTrace();
              //System.out.println(e.getMessage());
          }
          finally
            {
              try
              {
                if(c != null) c.close();
                if(s!=null) s.close();
              }catch(SQLException sqle){}
                  }
             
         }
    
    public void savePOMasterDetail(ServletRequest request)
         {
          try
          {       getConnection();
                  s=c.createStatement();  
                   
                        
                      String tender = request.getParameter("tender");
                      String purchaseNo = request.getParameter("purchaseNo");
                      String manu = request.getParameter("manu"); if(manu==null)manu="0";
                      String amendmentNo = request.getParameter("amendmentNo"); if(amendmentNo==null)amendmentNo="";
                     
                      String startDate = request.getParameter("startDate");
                     
                      
                      
                      //System.out.println("Reached Here");
                      int maxId = MaxId.get().maxId("TMS_PO_MASTER");
                      //System.out.println("calling line");
                      String insertSql="INSERT INTO TMS_PO_MASTER(ID,TENDER_ID,PO_NO,MANU_ID ,"+
                      " PO_DATE,AMENDMENT_NO) VALUES ("+
                      " "+maxId+", "+tender+",'"+purchaseNo+"',"+manu+","+
                      " to_date('"+startDate+"','DD-MON-YYYY'),'"+amendmentNo+"')";
                      //System.out.println("insert sql2:-"+insertSql);
                      int x= s.executeUpdate(insertSql);
                      message="Data Saved Successfully";
                      if(c!=null)c.close();
                      if(s!=null)s.close();    
              clearData();
                  
          }
         catch (SQLException e)
          {
             //e.printStackTrace();
              //System.out.println(e.getMessage());
          }catch (Exception e)
          {
             //e.printStackTrace();
              //System.out.println(e.getMessage());
          }
          finally
            {
              try
              {
                if(c != null) c.close();
                if(s!=null) s.close();
              }catch(SQLException sqle){}
                  }
             
         } 
    public void saveDIDetail(ServletRequest request)
         {
          try
          {       getConnection();
                  s=c.createStatement();  
                   
                        
                      String poId = request.getParameter("tender");// from list box
                      String diNo = request.getParameter("diNo");
                      String startDate = request.getParameter("startDate");
                      String remarks= request.getParameter("remarks"); if(remarks==null)remarks="";
                     
                      
                      //System.out.println("Reached Here");
                      int maxId = MaxId.get().maxId("TMS_DI_MASTER");
                      //System.out.println("calling line");
                      String insertSql="INSERT INTO TMS_DI_MASTER(ID,PO_ID,DI_NO,DI_DATE ,REMARKS) VALUES ("+
                      " "+maxId+", "+poId+",'"+diNo+"',TO_DATE('"+startDate+"','DD-MON-YYYY'),'"+remarks+"')";
                      //System.out.println("insert sql2:-"+insertSql);
                      int x= s.executeUpdate(insertSql);
                      message="Data Saved Successfully";
                      if(c!=null)c.close();
                      if(s!=null)s.close();    
              clearData();
                  
          }
         catch (SQLException e)
          {
             //e.printStackTrace();
              //System.out.println(e.getMessage());
          }catch (Exception e)
          {
             //e.printStackTrace();
              //System.out.println(e.getMessage());
          }
          finally
            {
              try
              {
                if(c != null) c.close();
                if(s!=null) s.close();
              }catch(SQLException sqle){}
                  }
             
         }  
    public String costofDtr (ServletRequest request)//Cost Of DTR 
       {
          String name="";
          String dtrMasterIdList;
           getConnection();
          try
          {
              //System.out.println("reached here 1");
              s = c.createStatement();
              //System.out.println("reached here 2");
              String[] dtrMasterId = request.getParameterValues("dtrMasterId");
              String[] cdtr = request.getParameterValues("cdtr");
                                   
              //System.out.println("reached here 3");
              userName= request.getParameter("userName"); 
              int dtrMasterIdlength=0;
              int costOfRepairingLength=0,repairerIdLength=0;
              try{
                  dtrMasterIdlength= dtrMasterId.length;
                
              }catch(Exception r){
                  dtrMasterIdlength=0;
              }
             
              try{
                 costOfRepairingLength=cdtr.length;
                
              }catch(Exception r){
                  costOfRepairingLength=0;
              }
              
              for(int i= 0; i<dtrMasterIdlength;i++)
              {
                  
              // update previous record
             
              String updateTrans= " UPDATE TMS_DTR_MASTER SET COST_OF_DTR='"+cdtr[i]+"' "+
              " WHERE  ID= "+dtrMasterId[i]+" AND INSPECTION_DONE='Y' ";
              //System.out.println(updateTrans);
              int x=s.executeUpdate(updateTrans); 
            
              }
              
           //rs.close();
            s.close();
            closeConnection();
          }
         
         catch(SQLException e)
         
         {
           //System.out.println(e.getMessage());
           // e.printStackTrace();
         }    finally{
              
              try{
                  if(s!=null)s.close();
                  if(c!=null)c.close();
              }catch(Exception er){}
              
              
          }
          //System.out.println("gggg   "+name);
          return name;
       } 
    public void deleteTenderDetail(ServletRequest request)
               {
                try
                {       getConnection();
                        s=c.createStatement();  
                    //System.out.println("reached here in function");
                         
                            
                            String id = request.getParameter("id");
                            
                             String deleteSql="DELETE FROM  TMS_PO_DETAILS" +
                              " WHERE ID="+id+"";
                                                     
                          //System.out.println("insert sql1"+updateSql);
                            int x= s.executeUpdate(deleteSql);
                            message="Data Deleted Successfully";
                            if(c!=null)c.close();
                            if(s!=null)s.close();    
                         
                        
                }
               catch (SQLException e)
                {
                   //e.printStackTrace();
                   message=e.getMessage();
                }catch (Exception e)
                {
                   //e.printStackTrace();
                }
                finally
                  {
                    try
                    {
                      if(c != null) c.close();
                      if(s!=null) s.close();
                    }catch(SQLException sqle){}
                        }
                   
    }
    public void deletePOMasterDetail(ServletRequest request)
               {
                try
                {       getConnection();
                        s=c.createStatement();  
                    //System.out.println("reached here in function");
                         
                            
                            String id = request.getParameter("id");
                            
                             String deleteSql="DELETE FROM  TMS_PO_MASTER" +
                              " WHERE ID="+id+"";
                                                     
                          //System.out.println("insert sql1"+updateSql);
                            int x= s.executeUpdate(deleteSql);
                            message="Data Deleted Successfully";
                            if(c!=null)c.close();
                            if(s!=null)s.close();    
                         
                        
                }
               catch (SQLException e)
                {
                   //e.printStackTrace();
                   message=e.getMessage();
                }catch (Exception e)
                {
                   //e.printStackTrace();
                }
                finally
                  {
                    try
                    {
                      if(c != null) c.close();
                      if(s!=null) s.close();
                    }catch(SQLException sqle){}
                        }
                   
    }
    public void deleteTestingDates(ServletRequest request)
               {
                try
                {       getConnection();
                        s=c.createStatement();  
                    //System.out.println("reached here in function");
                         
                            
                            String id = request.getParameter("id");
                            
                             String deleteSql="DELETE FROM  TMS_MANU_TESTING_DETAILS" +
                              " WHERE ID="+id+"";
                                                     
                          //System.out.println("insert sql1"+updateSql);
                            int x= s.executeUpdate(deleteSql);
                            message="Data Deleted Successfully";
                            if(c!=null)c.close();
                            if(s!=null)s.close();    
                         
                        
                }
               catch (SQLException e)
                {
                   //e.printStackTrace();
                   message=e.getMessage();
                }catch (Exception e)
                {
                   //e.printStackTrace();
                }
                finally
                  {
                    try
                    {
                      if(c != null) c.close();
                      if(s!=null) s.close();
                    }catch(SQLException sqle){}
                        }
                   
    }
    public void deleteDIDetail(ServletRequest request)
               {
                try
                {       getConnection();
                        s=c.createStatement();  
                    //System.out.println("reached here in function");
                         
                            
                            String id = request.getParameter("id");
                            
                             String deleteSql="DELETE FROM  TMS_DI_MASTER" +
                              " WHERE ID="+id+"";
                                                     
                          //System.out.println("insert sql1"+updateSql);
                            int x= s.executeUpdate(deleteSql);
                            message="Data Deleted Successfully";
                            if(c!=null)c.close();
                            if(s!=null)s.close();    
                         
                        
                }
               catch (SQLException e)
                {
                   //e.printStackTrace();
                   message=e.getMessage();
                }catch (Exception e)
                {
                   //e.printStackTrace();
                }
                finally
                  {
                    try
                    {
                      if(c != null) c.close();
                      if(s!=null) s.close();
                    }catch(SQLException sqle){}
                        }
                   
    } 
    public void updateTenderDetail(ServletRequest request)
               {
                try
                {       getConnection();
                        s=c.createStatement();  
                    //System.out.println("reached here in function");
                         
                    String tender = request.getParameter("tender");
                    String kva = request.getParameter("kva");
                    //System.out.println("Kva:"+kva);
                    String noTrans = request.getParameter("noTrans");
                    String workPriceVal= request.getParameter("workPrice"); if(workPriceVal==null)workPriceVal="";
                    if(workPriceVal.equalsIgnoreCase(""))workPriceVal="0";
                    //System.out.println("Reached Here");       
                    String faPriceVal= request.getParameter("faPrice"); if(faPriceVal==null)faPriceVal="";
                    if(faPriceVal.equalsIgnoreCase(""))faPriceVal="0";
                    
                            
                             String updateSql="UPDATE TMS_PO_DETAILS" +
                             " SET KVA_RATING="+kva+"" +
                             ",NO_TRANSFORMER="+noTrans+"" +
                             ", WORKS_PRICE='"+workPriceVal+"'" +    
                             ", FI_PRICE='"+faPriceVal+"'" +  
                             " WHERE ID="+id+"";
                             
                             
                            //System.out.println("updateSql :-"+updateSql);
                            int x= s.executeUpdate(updateSql);
                            message="Data Updated Successfully";
                            if(c!=null)c.close();
                            if(s!=null)s.close();    
                         
                        
                }
               catch (SQLException e)
                {
                   //e.printStackTrace();
                   message=e.getMessage();
                }catch (Exception e)
                {
                    message=e.getMessage();
                }
                finally
                  {
                    try
                    {
                      if(c != null) c.close();
                      if(s!=null) s.close();
                    }catch(SQLException sqle){}
                        }
                   
               }
    
    
    public void updatePOMasterDetail(ServletRequest request)
               {
                try
                {       getConnection();
                        s=c.createStatement();  
                    //System.out.println("reached here in function");
                         
                    String tender = request.getParameter("tender");
                    String purchaseNo = request.getParameter("purchaseNo");
                    String amendmentNo = request.getParameter("amendmentNo");
                    String manu = request.getParameter("manu");
                    String startDate = request.getParameter("startDate");
                    String statusVal= request.getParameter("status"); if(statusVal==null)statusVal="O";
                   
                    
                            
                             String updateSql="UPDATE TMS_PO_MASTER" +
                             " SET PO_NO= '"+purchaseNo+"',AMENDMENT_NO='"+amendmentNo+"'   " +
                             ",MANU_ID= "+manu+" " +
                             ",PO_DATE=TO_DATE('"+startDate+"','DD-MON-YYYY')" +
                             ", STATUS='"+statusVal+"'" +  
                            " WHERE ID="+id+"";
                             
                             
                            //System.out.println("updateSql :-"+updateSql);
                            int x= s.executeUpdate(updateSql);
                            message="Data Updated Successfully";
                            if(c!=null)c.close();
                            if(s!=null)s.close();    
                         
                        
                }
               catch (SQLException e)
                {
                   //e.printStackTrace();
                   message=e.getMessage();
                }catch (Exception e)
                {
                    message=e.getMessage();
                }
                finally
                  {
                    try
                    {
                      if(c != null) c.close();
                      if(s!=null) s.close();
                    }catch(SQLException sqle){}
                        }
                   
               } 
    public void updateTestingDates(ServletRequest request)
               {
                try
                {       getConnection();
                        s=c.createStatement();  
                    //System.out.println("reached here in function");
                         
                    String startDateVal = request.getParameter("startDate");
                    String kvaVal = request.getParameter("kva");
                    //System.out.println("startDateVal"+startDateVal);
                    String offerDateVal = request.getParameter("offerDate");
                    String endDateVal = request.getParameter("endDate");
                    
                    String dtrOfferedVal= request.getParameter("dtrOffered"); if(dtrOfferedVal==null)dtrOfferedVal="";
                    if(dtrOfferedVal.equalsIgnoreCase(""))dtrOfferedVal="0";
                    
                    String dtrOfferedActualVal= request.getParameter("dtrOfferedActual"); if(dtrOfferedActualVal==null)dtrOfferedActualVal="";
                    if(dtrOfferedActualVal.equalsIgnoreCase(""))dtrOfferedActualVal="0";
                    
                    String dtrPassedVal= request.getParameter("dtrPassed"); if(dtrPassedVal==null)dtrPassedVal="";
                    if(dtrPassedVal.equalsIgnoreCase(""))dtrPassedVal="0";
                    
                    String remarksVal= request.getParameter("remarks"); if(remarksVal==null)remarksVal="";
                    
                            
                             String updateSql="UPDATE TMS_MANU_TESTING_DETAILS "+
                             " SET TESTING_START_DATE= TO_DATE('"+startDateVal+"','DD-MON-YYYY'),"+
                             " TESTING_END_DATE= TO_DATE('"+endDateVal+"','DD-MON-YYYY'), "+
                             " TESTING_OFFER_DATE= TO_DATE('"+offerDateVal+"','DD-MON-YYYY'),"+
                             " DTR_FOR_TESTING="+dtrOfferedVal+","+ 
                             " DTR_PASSED="+dtrPassedVal+","+  
                             " KVA_RATING="+kvaVal+", "+
                             " REMARKS='"+remarksVal+"', "+  
                             " ACTUAL_DTR_OFFERED_FOR_TESTING="+dtrOfferedActualVal+" "+  
                             " WHERE ID="+id+"";
                             
                             
                            //System.out.println("updateSql :-"+updateSql);
                            int x= s.executeUpdate(updateSql);
                            message="Data Updated Successfully";
                            if(c!=null)c.close();
                            if(s!=null)s.close();    
                         
                        
                }
               catch (SQLException e)
                {
                   //e.printStackTrace();
                   message=e.getMessage();
                }catch (Exception e)
                {
                    message=e.getMessage();
                }
                finally
                  {
                    try
                    {
                      if(c != null) c.close();
                      if(s!=null) s.close();
                    }catch(SQLException sqle){}
                        }
                   
               } 
    public void updateDIDetail(ServletRequest request)
               {
                try
                {       getConnection();
                        s=c.createStatement();  
                    //System.out.println("reached here in function");
                         
                    String diNo = request.getParameter("diNo");
                    String startDate = request.getParameter("startDate");
                    String remarks = request.getParameter("remarks");
                    String status = request.getParameter("status");
                 
                            
                             String updateSql="UPDATE TMS_DI_MASTER" +
                             " SET DI_NO= '"+diNo+"',DI_DATE= TO_DATE('"+startDate+"','DD-MON-YYYY') ,STATUS='"+status+"',  REMARKS='"+remarks+"'" +
                             " WHERE ID="+id+"";
                             
                             
                            //System.out.println("updateSql :-"+updateSql);
                            int x= s.executeUpdate(updateSql);
                            message="Data Updated Successfully";
                            if(c!=null)c.close();
                            if(s!=null)s.close();    
                         
                        
                }
               catch (SQLException e)
                {
                   //e.printStackTrace();
                   message=e.getMessage();
                }catch (Exception e)
                {
                    message=e.getMessage();
                }
                finally
                  {
                    try
                    {
                      if(c != null) c.close();
                      if(s!=null) s.close();
                    }catch(SQLException sqle){}
                        }
                   
               }
                          
    public void clearData() 
    {
     try
     {
               kva=0;
               manu = "";
               startDate="";
               
           
         }
         catch (Exception e)
         {
         e.printStackTrace();
         }
    
    }
 
 public boolean recordexists (String TENDER)
 {
    boolean x= true;
    try
    {
     sql = "SELECT * FROM TMS_TENDER_PURCHASE WHERE TENDER_NAME = '"+TENDER+"'";
     //System.out.println("reached in check "+sql);
      c = new ConnectionManagers().startConnection();
      s = c.createStatement();
      rs = s.executeQuery(sql);
      //System.out.println(sql);
      if(rs.next())
      {
      x=false;
      }
      else
      {
      x=true;
      }
    rs.close();
    s.close();
    }
   
   catch(SQLException e)
   
   {
      //e.printStackTrace();
   }    finally{
        
        try{
            if(rs!=null)rs.close();
            if(s!=null)s.close();
            //if(c!=null)c.close();
        }catch(Exception er){}
        
        
    }
    return x;
 }

    public boolean recordexists_update (int idTemp )
    {
    
        boolean x= true;

       try
       {
        
         sql = "SELECT * FROM TMS_TENDER_PURCHASE WHERE ID = "+idTemp+"";
         c = new ConnectionManagers().startConnection();
         s = c.createStatement();
         rs = s.executeQuery(sql);
         
         if(rs.next())
         {
         x=true;
         }
         else
         {
         x=false;
         }
       rs.close();
       s.close();
       c.close();
       }
      
      catch(SQLException e)
      
      {
         //e.printStackTrace();
      }finally{
           
           try{
               if(rs!=null)rs.close();
               if(s!=null)s.close();
               if(c!=null)c.close();
           }catch(Exception er){}
           
           
       }
       return x;
    }
    public void saveData()
    {
     
        if (tender!="")
       {
         //System.out.println("division  value "+subDivision);
          if(recordexists(tender) && tenderName==0)
            {       
               insertSql();
               displayData();
            }
          else  if(recordexists_update(tenderName)){
               updateSql();
               displayData();
            }
              else
            {
               message=tender+" already exists as Tender. It can not be saved.";
            }
         
       }
       else
       {
           message="Name can not be empty. Pl enter data.";
       }

    } 

 public void insertSql()
    {
      try{

    // User Action Audit Starts.........
      conn = new DBConnLT().getConn();
      
      MaxId mId = new MaxId();
      int maxId = mId.maxId("TMS_TENDER_PURCHASE");
      division = maxId;
        
      //insertString = "TMS_TENDER_PURCHASE,'"+userName+"','"+compName+"',INSERT,ID,"+maxId+",TENDER_NAME,'"+tender+"',MC_DATE,'"+startDate+"',";
      insertString = "INSERT INTO TMS_TENDER_PURCHASE (ID,TENDER_NAME,MC_DATE,STATUS) VALUES ("+maxId+",'"+tender+"',TO_DATE('"+startDate+"','DD-MON-YYYY'),'"+status+"')";
      //System.out.println(insertString);
      
      AuditTrail.get().insertLog(insertString,"Y",userName,compName);
      //System.out.println("reached here");
      //cstmt = conn.prepareCall("{call USER_AUDIT_LOG.TRANSACT(?,?)}");
      //cstmt.setString(1,insertString);
      //cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
      //cstmt.executeQuery();
        
           if(conn != null) conn.close();
           if(cstmt != null) cstmt.close();   
       
        message="Data uploaded successfully.";
        //return sql;
      //conn.close();
      //cstmt.close();
        
      }
      catch (SQLException e) 
      {
      //System.out.println(e.getMessage());
      message="Data not uploaded successfully.";}
      finally{
              
              try{
                  if(cstmt!=null)cstmt.close();
                  if(conn!=null)conn.close();
               
              }catch(Exception er){}
              
              
          }
   
    }

    public void updateSql()
    { 
        int id=0;
    //System.out.println("reached in up ");
    try{
          sql = "SELECT TENDER_NAME,TO_CHAR(MC_DATE,'DD-MON-YYYY') MC_DATE,STATUS FROM TMS_TENDER_PURCHASE WHERE ID = "+tenderName;
          //System.out.println(sql);
          conn = new ConnectionManagers().startConnection();
          s=conn.createStatement();
          rs=s.executeQuery(sql);
          
          if(rs.next())
             {
              String nameInVal = rs.getString("TENDER_NAME"); if (nameInVal == null) nameInVal="";
              //int divisionInVal = rs.getInt("DIVISION_ID"); 
              //int circleInVal = rs.getInt("CIRCLE_ID"); 
              String startDateInVal = rs.getString("MC_DATE"); if (startDateInVal == null) startDateInVal="";
              String statusInVal = rs.getString("STATUS"); if (statusInVal == null) statusInVal="O";
                             
              //updateString = "S,10,WHERE ID = "+tenderName+",TMS_TENDER_PURCHASE,'"+userName+"','"+compName+"',UPDATE,TENDER_NAME,'"+nameInVal+"','"+tender+"',MC_DATE,'"+startDateInVal+"','"+startDate+"',";
              //updateString = "UPDATE, TMS_TENDER_PURCHASE,'"+userName+"','"+compName+"',TENDER_NAME,'"+nameInVal+"','"+tender+"',MC_DATE,'"+startDateInVal+"','"+startDate+"', WHERE ID = "+tenderName+" "; 
              updateString = "UPDATE TMS_TENDER_PURCHASE SET TENDER_NAME='"+tender+"', MC_DATE= '"+startDate+"', STATUS='"+status+"' WHERE ID ="+tenderName+" "; 
              //System.out.println(updateString);
              AuditTrail.get().updateLog(updateString,"Y",userName,compName); 
               
              //System.out.println(updateString);
              //cstmt = conn.prepareCall("{call USER_AUDIT_LOG.TRANSACT(?,?)}");
              //cstmt.setString(1,updateString);
              //cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
              //cstmt.executeQuery();

                if(conn != null) conn.close();
                               if(rs != null) rs.close();
                               if(s!=null) s.close();
                               if(cstmt != null) cstmt.close();
               
             }  
             message="Data updated successfully.";
            
      }
      catch (SQLException e) 
      { 
        message="Data not updated successfully.";}
        finally{
                
                try{
                    if(cstmt!=null)cstmt.close();
                    if(s!=null) s.close();
                    if(rs != null) rs.close();
                    if(conn!=null)conn.close();
                   
           }catch(Exception er){}
           
       }
      
       //displayData();
    }
        public void deleteRecord()
        {
          try
          {
          conn = new DBConnLT().getConn();
          s=conn.createStatement();
          String deleteString="DELETE FROM TMS_TENDER_PURCHASE  WHERE ID = "+tenderName;
         
          AuditTrail.get().deleteLog(deleteString,"Y",userName,compName); 
          //System.out.println(deleteString);
          //s.executeQuery(deleteString);
          if(conn != null) conn.close();
          if(s != null) s.close();   
           
          message="Record Deleted successfully.";
          displayData();
         //return sql;
            
          }
          catch (SQLException e) 
          { message="Record not Deleted successfully.";}
           finally{
                   
                   try{
                       if(s != null) s.close();
                       if(conn!=null)conn.close();
                    
                   }catch(Exception er){}
               }
          ////return sql; 
        }  
  public String returnName (String tableName,String idTemp)
  {
     String name="";
     try
     {
      sql = "SELECT NAME FROM "+tableName+" WHERE ID = "+idTemp+"";
     //System.out.println("reached in check "+sql);
       c = new ConnectionManagers().startConnection();
       s = c.createStatement();
       rs = s.executeQuery(sql);
       //System.out.println(sql);
       if(rs.next())
       {
       name=rs.getString("NAME");if(name==null)name="";
       }
       else
       {
         name="";
       }
     rs.close();
     s.close();
     }
    
    catch(SQLException e)
    
    {
       //e.printStackTrace();
    }    finally{
         
         try{
             if(rs!=null)rs.close();
             if(s!=null)s.close();
             if(c!=null)c.close();
         }catch(Exception er){}
         
         
     }
     //System.out.println("gggg   "+name);
     return name;
  }

     public void getConnection()
     {
      c = new ConnectionManagers().startConnection();
     }

     public void closeConnection()
        throws SQLException
         {
           c.close();
         }
public String returnMessage()
{
   return message;
}
   public String displaySql()
 {
  return errorDisplay;
 }
    private static String DivisionList;
    public static String Id;
    private static String SubDivisionList;
    private static String ManufacturerList;
    private static String HTBushList;
    private static String LTBushList;
    private static String HTStudList;
    private static String LTStudList;
    private static Connection c;
    private static Connection con;
    private static Statement s;
    private static String sql;
    private static String sql1;
    private static ResultSet rs;
    private static int DMLVal;
}

