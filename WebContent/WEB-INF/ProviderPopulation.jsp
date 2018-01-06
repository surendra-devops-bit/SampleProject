<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<%-- <%@ page import="com.eds.ir.util.DBHelper"%> --%>

<!--  ProviderPopulation.jsp JSP -->

<script type="text/javascript"
	src="<%=request.getContextPath()%>/script/jquery-1.11.3.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/script/jquery.validate.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/script/additional-methods.js"></script>

<style type="text/css">
.left-space1 {
	margin-left: 1px
}
</style>
<style type="text/css">
.left-space2 {
	margin-left: 2px
}
</style>
<style type="text/css">
.left-space3 {
	margin-left: 3px
}
</style>
<style type="text/css">
.left-space23 {
	margin-left: 23px
}
</style>
<style type="text/css">
.left-space32 {
	margin-left: 32px
}
</style>
<style type="text/css">
.left-space50 {
	margin-left: 50px
}
</style>
<style type="text/css">
.left-space70 {
	margin-left: 70px
}
</style>
<style type="text/css">
.left-space95 {
	margin-left: 95px
}
</style>
<style type="text/css">
.left-space100 {
	margin-left: 100px
}
</style>
<style type="text/css">
.left-space105 {
	margin-left: 105px
}
</style>
<style type="text/css">
.left-space126 {
	margin-left: 126px
}
</style>
<style type="text/css">
.left-space137 {
	margin-left: 137px
}
</style>
<style type="text/css">
.left-space185 {
	margin-left: 185px
}
</style>
<style type="text/css">
.left-space187 {
	margin-left: 187px
}
</style>
<style type="text/css">
.left-space210 {
	margin-left: 210px
}
</style>
<style type="text/css">
.left-space213 {
	margin-left: 213px
}
</style>
<style type="text/css">
.left-space234 {
	margin-left: 234px
}
</style>
<style type="text/css">
.left-space285 {
	margin-left: 285px
}
</style>
<style type="text/css">
td.bright {
	font-weight: bold;
}
</style>

<html:form styleId="ProviderPopulationForm"
	action="/ProviderPopulation.do" method="post">
	<input type="hidden" name="pSecureId"
		value="<bean:write name="userBean" property="secureId"/>">
	<%-- <input type="hidden" name="onlineURL"
		value="https://<%=DBHelper.getSysGlobalParameter("DOMAIN_NAME")%>/<%=DBHelper.getSysGlobalParameter("DAD_NAME") --%>
						.toLowerCase()%>/">
	<html:hidden styleId="vfcSiteId" property="vfcSiteId" />
	<html:hidden styleId="cmdAction" property="cmdAction" />
	<html:hidden styleId="vfcPin" property="vfcPin" />
	<html:hidden styleId="vfcEditFlg" property="vfcEditFlg" />
	<html:hidden styleId="publicHealth" property="publicHealth" />
	<html:hidden styleId="hdnbenchmarking" property="hdnbenchmarking" />
	<html:hidden styleId="hdndoseadmin" property="hdndoseadmin" />
	<html:hidden styleId="hdnmedicaidclaims" property="hdnmedicaidclaims" />
	<html:hidden styleId="hdnprovenctrdata" property="hdnprovenctrdata" />
	<html:hidden styleId="hdngrits" property="hdngrits" />
	<html:hidden styleId="hdnbillingsys" property="hdnbillingsys" />
	<html:hidden styleId="hdnother" property="hdnother" />

	<div class="container">
		<table border="0" width="80%" style="background-color: #f0f0f0">
			<tr>
				<td>
					<table style="background-color: #f0f0f0" width="100%" border="0"
						cellspacing="1">
						<tr>
							<td bgcolor="#cccccc"><p class=large>
									<b>&nbsp;&nbsp;Provider Population</b>
								</p></td>
							<td bgcolor="#cccccc"><p class=large>
									<span class="left-space95"></span><b>VFC PIN: </b>
									<bean:write name="ProviderPopulationForm" property="vfcPin" />
									</b><span class="left-space95"></span>
								</p></td>
							<td bgcolor="#cccccc"><p class=large>
									<span class="left-space70"></span><b>Brand New Site</b>
								</p></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table bgcolor="#f0f0f0" width="100%" border="0" cellspacing="1">
						<tr>
							<td width="85%" align="left" colspan="2"></td>
							<td width="15%" align="right"><input type="submit"
								name="btnNext" id="btnNext" tabindex="77" value="Next"
								style="width: 80px;"></td>
						</tr>
						<tr>
							<td width="85%" align="left" colspan="2"></td>
							<td width="15%" align="right"><input type="button"
								value="Cancel" id="btnCancel" style="width: 80px;"></td>
						</tr>
						<tr>
							<td width="85%" align="left" colspan="2"><p>
									<b>Generate GRITS immunization data for this site for
										previous calendar year...</b>
								</p></td>
							<td width="15%" align="right"><input type="button"
								name="btnGenerate" id="btnGenerate" tabindex="77"
								value="Generate" onclick="getAjax()" style="width: 80px;">
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table bgcolor="#f0f0f0" width="100%" border="0" cellspacing="1">
						<tr>
							<td width="75%" bgcolor="#cccccc">
								<p class=large>
									<b>&nbsp;&nbsp;Provider Population</b>
								</p>
							</td>
							<td width="25%" bgcolor="#cccccc">
								<div id="hdnElement"
									style="display: none; color: red; text-align: right;">
									<img src="images/ajax-loader.gif" alt="Spinning Wheel Path"
										style="vertical-align: text-top;" /> <b>Processing.
										Please Wait...</b>
								</div>
							</td>
						</tr>
						<tr>
							<td width="675" height="70" align="left">Provider Population
								based on patients seen during the previous 12 months (estimates
								are required for new clinics). Report the number of children who
								received vaccinations at your facility, by age group. Only count
								a child once based on the status at the last immunization visit,
								regardless of the number of visits made. The following table
								documents how many children received VFC vaccine, by category,
								and how many received non-VFC vaccine.
							<td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table bgcolor="#f0f0f0" width="675" border="0" cellspacing="1">
						<tr>
							<td bgcolor="#cccccc"><p class=large>
									<b>&nbsp;&nbsp;VFC Vaccine Eligibility Categories</b><span
										class="left-space95"></span><b># of children who received
										VFC Vaccine by Age Category</b>
								</p></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table id="sum_tableVFC">
						<tr class='trTextOnly'>
							<td nowrap class='tdTextOnly'><span class="left-space285"></span><
								1 Year</td>
							<td nowrap class='tdTextOnly'>1-2 Years</td>
							<td nowrap class='tdTextOnly'>3-6 Years</td>
							<td nowrap class='tdTextOnly'>7-18 years</td>
							<td nowrap class='tdTextOnly'>Total:</td>
							<td></td>
						</tr>
						<tr>
							<td nowrap align=left>Enrolled in Medicaid<span
								class="left-space187"></span> <html:text styleClass="sumVFC1"
									size="4" property="medicaidlt1yr"></html:text></td>
							<td align=left><html:text styleClass="sumVFC2" size="4"
									property="medicaid12yr"></html:text></td>
							<td align=left><label></label> <html:text
									styleClass="sumVFC3" size="4" property="medicaid36yr"></html:text></td>
							<td align=left><label></label> <html:text
									styleClass="sumVFC4" size="4" property="medicaid718yr"></html:text></td>
							<td class="totalVFC" align=left><html:text
									styleClass="totalTxtVFC" property="medicaidTot" size="4"
									readonly="true"></html:text></td>
							<td></td>
						</tr>
						<tr>
							<td nowrap align=left>No Health Insurance<span
								class="left-space187"></span> <html:text styleClass="sumVFC1"
									size="4" property="noHealthInslt1yr"></html:text></td>
							<td align=left><html:text styleClass="sumVFC2" size="4"
									property="noHealthIns12yr"></html:text></td>
							<td align=left><html:text styleClass="sumVFC3" size="4"
									property="noHealthIns36yr"></html:text></td>
							<td align=left><html:text styleClass="sumVFC4" size="4"
									property="noHealthIns718yr"></html:text></td>
							<td class="totalVFC" align=left><html:text
									styleClass="totalTxtVFC" property="noHealthInsTot" size="4"
									readonly="true" /></td>
							<td></td>
						</tr>
						<tr>
							<td nowrap align=left>American Indian/Alaska Native<span
								class="left-space137"></span> <html:text styleClass="sumVFC1"
									size="4" property="aIALlt1yr"></html:text></td>
							<td align=left><html:text styleClass="sumVFC2" size="4"
									property="aIAL12yr"></html:text></td>
							<td align=left><html:text styleClass="sumVFC3" size="4"
									property="aIAL36yr"></html:text></td>
							<td align=left><html:text styleClass="sumVFC4" size="4"
									property="aIAL718yr"></html:text></td>
							<td class="totalVFC" align=left><html:text
									styleClass="totalTxtVFC" property="aIALTot" size="4"
									readonly="true" /></td>
						</tr>
						<tr>
							<td nowrap align=left>Underinsured in the FQHC/RHC or
								Deputized Facility<sup>1</sup><span class="left-space23"></span>
								<html:text styleClass="sumVFC1" size="4" property="fQHCRHClt1yr"></html:text>
							</td>
							<td align=left><html:text styleClass="sumVFC2" size="4"
									property="fQHCRHC12yr"></html:text></td>
							<td align=left><html:text styleClass="sumVFC3" size="4"
									property="fQHCRHC36yr"></html:text></td>
							<td align=left><html:text styleClass="sumVFC4" size="4"
									property="fQHCRHC718yr"></html:text></td>
							<td class="totalVFC" align=left><html:text
									styleClass="totalTxtVFC" property="fQHCRHCTot" size="4"
									readonly="true" /></td>
						</tr>
						<tr class="totalColVFC">
							<td class="bright">TotalVFC:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<html:text
									styleClass="totalSumVFC1" property="totVFC12yr" size="4"
									readonly="true"></html:text></td>
							<td><html:text styleClass="totalSumVFC2"
									property="totVFC12yr" size="4" readonly="true"></html:text></td>
							<td><html:text styleClass="totalSumVFC3"
									property="totVFC36yr" size="4" readonly="true"></html:text></td>
							<td><html:text styleClass="totalSumVFC4"
									property="totVFC718yr" size="4" readonly="true"></html:text></td>
							<td><html:text styleId="grandTotalVFC"
									property="grandTotalVFC" size="4" readonly="true"></html:text></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table id="checkBxTbl" bgcolor="#f0f0f0" width="675" border="0"
						cellspacing="1">
						<tr>
							<td bgcolor="#cccccc"><p class=large>
									<b>&nbsp;&nbsp;Non-VFC Eligibility Vaccine Categories</b><span
										class="left-space70"></span><b># of children who received
										Non-VFC Vaccine by Age Category</b>
								</p></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table id="sum_tableNonVFC">
						<tr class='trTextOnly'>
							<td nowrap class='tdTextOnly'><span class="left-space285"></span><
								1 Year</td>
							<td nowrap class='tdTextOnly'>1-2 Years</td>
							<td nowrap class='tdTextOnly'>3-6 Years</td>
							<td nowrap class='tdTextOnly'>7-18 years</td>
							<td nowrap class='tdTextOnly'>Total:</td>
						</tr>
						<tr>
							<td nowrap align=left>Insured (private payhealth insurance
								covers vaccines)<span class="left-space23"></span> <html:text
									styleClass="sumNonVFC1" size="4" property='insuredlt1yr'></html:text>
							</td>
							<td align=left><html:text styleClass="sumNonVFC2" size="4"
									property='insured12yr'></html:text></td>
							<td align=left><html:text styleClass="sumNonVFC3" size="4"
									property='insured36yr'></html:text></td>
							<td align=left><html:text styleClass="sumNonVFC4" size="4"
									property='insured718yr'></html:text></td>
							<td class="totalNonVFC" align=left><html:text
									styleClass="totalTxtNonVFC" property="insuredTot" size="4"
									readonly="true" /></td>
						</tr>
						<tr>
							<td nowrap align=left>Other Underinsured<sup>2</sup><span
								class="left-space185"></span> <html:text styleClass="sumNonVFC1"
									size="4" property='othUninsuredlt1yr'></html:text></td>
							<td align=left><html:text styleClass="sumNonVFC2" size="4"
									property='othUninsured12yr'></html:text></td>
							<td align=left><html:text styleClass="sumNonVFC3" size="4"
									property='othUninsured36yr'></html:text></td>
							<td align=left><html:text styleClass="sumNonVFC4" size="4"
									property='othUninsured718yr'></html:text></td>
							<td class="totalNonVFC" align=left><html:text
									styleClass="totalTxtNonVFC" property="othUninsuredTot" size="4"
									readonly="true" /></td>
						</tr>
						<tr>
							<td nowrap align=left>Children's Health Program (CHIP)<sup>3</sup><br>(Amerigroup,
								Peach State, WellCare)<span class="left-space105"></span> <html:text
									styleClass="sumNonVFC1" size="4" property='cHIPlt1yr'></html:text></td>
							<td valign=bottom align=left><html:text
									styleClass="sumNonVFC2" size="4" property='cHIP12yr'></html:text></td>
							<td valign=bottom align=left><html:text
									styleClass="sumNonVFC3" size="4" property='cHIP36yr'></html:text></td>
							<td valign=bottom align=left><html:text
									styleClass="sumNonVFC4" size="4" property='cHIP718yr'></html:text></td>
							<td valign=bottom class="totalNonVFC" align=left><html:text
									styleClass="totalTxtNonVFC" property="cHIPTot" size="4"
									readonly="true" /></td>
						</tr>
						<tr>
							<td class="bright">Total
								Non-VFC:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<html:text
									size="4" styleClass="totalSumNonVFC1" property="totNonVFCLT1yr"
									readonly="true" />
							</td>
							<td><html:text size="4" styleClass="totalSumNonVFC2"
									property="totNonVFC12yr" readonly="true" /></td>
							<td><html:text size="4" styleClass="totalSumNonVFC3"
									property="totNonVFC36yr" readonly="true" /></td>
							<td><html:text size="4" styleClass="totalSumNonVFC4"
									property="totNonVFC718yr" readonly="true" /></td>
							<td><html:text size="4" styleId="grandTotalNonVFC"
									property="grandTotalNonVFC" readonly="true" /></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table id="sum_tableGTVFCNonVFC">
						<tr class="totalColVFCNonVFC">
							<td><b>Total Patients</b></BR>(must equal sum of Total VFC +
								Total Non-VFC)<span class="left-space50"></span> <html:text
									size="4" styleClass="totalSumVFCNonVFC1"
									property="totVFCNonVFCLT1yr" readonly="true" /></td>
							<td valign=bottom><html:text size="4"
									styleClass="totalSumVFCNonVFC2" property="totVFCNonVFC12yr"
									readonly="true" /></td>
							<td valign=bottom><html:text size="4"
									styleClass="totalSumVFCNonVFC3" property="totVFCNonVFC36yr"
									readonly="true" /></td>
							<td valign=bottom><html:text size="4"
									styleClass="totalSumVFCNonVFC4" property="totVFCNonVFC718yr"
									readonly="true" /></td>
							<td valign=bottom><html:text size="4"
									styleId="grandTotalVFCNonVFC" property="grandTotalVFCNonVFC"
									readonly="true" /></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table id=textTbl " bgcolor="#f0f0f0" width="675" border="0"
						cellspacing="1">
						<tr>
							<td bgcolor="#cccccc" colspan="3"><p class=large>
									<b>&nbsp;&nbsp;Type of Data Used to Determine Provider
										Population (choose all that apply)</b>
								</p></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="45%">
						<tr>
							<td><html:checkbox styleId="benchmarking"
									property="benchmarking" value="BEN" />Benchmarking</td>
							<td align="left"><html:checkbox styleId="doseadmin"
									property="doseadmin" value="DOS" />Doses Administered</td>
						</tr>
						<tr>
							<td><html:checkbox styleId="medicaidclaims"
									property="medicaidclaims" value="MED" />Medicaid Claims</td>
							<td><html:checkbox styleId="provenctrdata"
									property="provenctrdata" value="PRO" />Provider Encounter Data</td>
						</tr>
						<tr>
							<td><html:checkbox styleId="grits" property="grits"
									value="IIS" />IIS (GRITS)</td>
							<td><html:checkbox styleId="billingsys"
									property="billingsys" value="BILL" />Billing System</td>
						</tr>
						<tr>
							<td><html:checkbox styleId="other" property="other" value="OTH" />Other
								(must describe)</td>
						</tr>
					</table>
					<hr>
				</td>
			</tr>
			<tr>
				<td>
					<table bgcolor="#f0f0f0" width="675" border="0" cellspacing="1">
						<tr>
							<td width="615" height="70" align="left">
								<p>
									<sup>1</sup> Underinsured includes children with health
									insurance that does not include vaccines or only covers
									specific vaccine types. Children are only eligible for vaccines
									that are not covered by insurance.
								</p>
								<p>In addition, to receive VFC vaccine, underinsured
									children must be vaccinated through a Federally Qualified
									Health Center (FQHC) or Rural Health Clinic (RHC) or under an
									approved deputized provider. The deputized provider must have a
									written agreement with an FQHC/RHC and the
									state/local/territorial immunization program in order to
									vaccinate these underinsured children.</p>
								<p>
									<sup>2</sup> Other underinsured are children that are
									underinsured but are not eligible to receive federal vaccine
									through the VFC program because the provider or facility is not
									a FQHC/RHC or a deputized provider. However, these children may
									be served if vaccines are provided by the state program to
									cover these non-VFC eligible children.
								</p>
								<p>
									<sup>3</sup> CHIP/Peachcare - Children enrolled in the state
									Children's Health Insurance Program (CHIP). These children are
									considered insured and are not eligible for vaccines through
									the VFC program. Patients in this group are enrolled in one of
									the following Peachcare plans: Amerigroup, Peach State, or
									WellCare.
								</p>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			checkTopLocation();
			prepareJQueryEvents();
			$('input[type="text"]').attr({
				maxLength : 6
			});
		});//document.ready

		$(document).on(
				'keyup change',
				'#sum_tableVFC tr:not(.totalColVFC) input:text',
				function() {
					var $table = $(this).closest('table');
					var total = 0;
					var thisNumber = $(this).attr('class').match(/(\d+)/)[1];
					var vfcTotalVal = 0;
					var nonVFCTotalVal = 0;
					var gtVFCNonVFCVal = 0;
					var greatGrandTotalVFC = 0;
					var greatGrandTotalNonVFC = 0;
					var greatGrandTotalVFCNonVFC = 0;

					$table.find('tr:not(.totalColVFC) .sumVFC' + thisNumber)
							.each(
									function() {
										if (!isNaN(this.value)
												&& this.value.length != 0) {
											total += parseFloat(this.value);
										}
									});

					$table
							.find(
									'.totalColVFC td:nth-child(' + thisNumber
											+ ')').children().val(total);
					vfcTotalVal = $table.find(
							'.totalColVFC td:nth-child(' + thisNumber + ')')
							.children().val();
					nonVFCTotalVal = $("#sum_tableNonVFC").find(
							'.totalColNonVFC td:nth-child(' + thisNumber + ')')
							.children().val();
					gtVFCNonVFCVal = parseFloat(vfcTotalVal)
							+ parseFloat(nonVFCTotalVal);

					//grand total for selected VFC/Non-VFC columns   
					$("#sum_tableGTVFCNonVFC").find(
							'.totalColVFCNonVFC td:nth-child(' + thisNumber
									+ ')').children().val(gtVFCNonVFCVal);

					var that = this;
					newSumVFC.call(that); // pass in a context for newsum():
					// call() redefines what "this" means
					// so newSum() sees 'this' as the <input> element
					total = 0;
					$('.totalTxtVFC').each(function() {
						if (!isNaN(this.value) && this.value.length != 0) {
							total += parseFloat(this.value);
						}
					});
					$("#grandTotalVFC").val(total);
					//get "ultimate" grandTotal
					greatGrandTotalVFC = $("#grandTotalVFC").val();
					greatGrandTotalNonVFC = $("#grandTotalNonVFC").val();
					greatGrandTotalVFCNonVFC = parseFloat(greatGrandTotalVFC)
							+ parseFloat(greatGrandTotalNonVFC);
					$("#grandTotalVFCNonVFC").val(greatGrandTotalVFCNonVFC);
				});
		$(document)
				.on(
						'keyup change',
						'#sum_tableNonVFC tr:not(.totalColNonVFC) input:text',
						function() {
							var $table = $(this).closest('table');
							var total = 0;
							var thisNumber = $(this).attr('class').match(
									/(\d+)/)[1];
							var vfcTotalVal = 0;
							var nonVFCTotalVal = 0;
							var gtVFCNonVFCVal = 0;
							var greatGrandTotalVFC = 0;
							var greatGrandTotalNonVFC = 0;
							var greatGrandTotalVFCNonVFC = 0;

							$table
									.find(
											'tr:not(.totalColNonVFC) .sumNonVFC'
													+ thisNumber)
									.each(
											function() {
												if (!isNaN(this.value)
														&& this.value.length != 0) {
													total += parseFloat(this.value) || 0;
												}
											});

							$table.find(
									'.totalColNonVFC td:nth-child('
											+ thisNumber + ')').children().val(
									total);
							nonVFCTotalVal = $table.find(
									'.totalColNonVFC td:nth-child('
											+ thisNumber + ')').children()
									.val();
							vfcTotalVal = $("#sum_tableVFC").find(
									'.totalColVFC td:nth-child(' + thisNumber
											+ ')').children().val();
							gtVFCNonVFCVal = parseFloat(vfcTotalVal)
									+ parseFloat(nonVFCTotalVal);

							//grand total for selected VFC/Non-VFC columns
							$("#sum_tableGTVFCNonVFC").find(
									'.totalColVFCNonVFC td:nth-child('
											+ thisNumber + ')').children().val(
									gtVFCNonVFCVal);

							var that = this;
							newSumNonVFC.call(that); // pass in a context for newsum():
							// call() redefines what "this" means
							// so newSum() sees 'this' as the <input> element
							total = 0;
							$('.totalTxtNonVFC').each(
									function() {
										if (!isNaN(this.value)
												&& this.value.length != 0) {
											total += parseFloat(this.value);
										}
									});

							$("#grandTotalNonVFC").val(total);
							//get "ultimate" grandTotal
							greatGrandTotalVFC = $("#grandTotalVFC").val();
							greatGrandTotalNonVFC = $("#grandTotalNonVFC")
									.val();
							greatGrandTotalVFCNonVFC = parseFloat(greatGrandTotalVFC)
									+ parseFloat(greatGrandTotalNonVFC);
							$("#grandTotalVFCNonVFC").val(
									greatGrandTotalVFCNonVFC);
						});
		function prepareJQueryEvents() {
			$("input:text")
					.each(
							function() {
								$(this)
										.keyup(
												function() {
													if (this.value != this.value
															.replace(
																	/[^0-9\.]/g,
																	'0')) {
														alert("Only positive numbers are allowed in the VFC text fields.");
														this.value = this.value
																.replace(
																		/[^0-9\.]/g,
																		'0');
													}
												});
							});
			/** AUTO TAB **/
			$('input').keyup(function() {
				if ($(this).val().length == $(this).attr('maxlength')) {
					var inputs = $(this).closest('form').find(':input');
					inputs.eq(inputs.index(this) + 1).focus();
				}
			});
			$("#btnCancel")
					.click(
							function() {
								var frm = window.document.ProviderPopulationForm;
								var preUrl = frm.onlineURL.value;
								var url = preUrl
										+ "site_ui.showSelectSite?pSecureId="
										+ frm.pSecureId.value + "&pSiteId="
										+ $("#vfcSiteId").val() + "&pStatus=-3";
								if (confirm("By clicking OK, you will be returned to the Edit Site screen and no changes will be saved.\nClick Cancel to remain on this screen and continue.")) {
									window.location.href = url;
								} else {
									return false;
								}
							});

			$('input[type="checkbox"]').change(
					function() {
						$('input[name="hdn' + this.id + '"]').val(
								$(this).is(':checked') ? 'on' : 'off');
						var chkTxt = $('input[name="hdn' + this.id + '"]')
								.val();
					});

			if ($("#vfcEditFlg").val() === "True") {
				//checkboxes
				$('input[name^=hdn]').each(function() {
					if (this.value === "on") {
						var tmpName = this.name.substring(3);
						$("#" + tmpName).prop('checked', true);
					}
				});
			} //if
		}
		function checkTopLocation() {
			if (window.top.location != window.location) {
				window.top.location.href = window.location.href;
			}
		}
		function newSumVFC() {
			var sum = 0;
			var thisRow = $(this).closest('tr');

			thisRow.find('td:not(.totalVFC) input:text').each(function() {
				if (!isNaN(this.value) && this.value.length != 0) {
					sum += parseFloat(this.value); // or parseInt(this.value,10) if appropriate
				}
			});
			thisRow.find('td.totalVFC input:text').val(sum);
		}
		function newSumNonVFC() {
			var sum = 0;
			var thisRow = $(this).closest('tr');

			thisRow.find('td:not(.totalNonVFC) input:text').each(function() {
				if (!isNaN(this.value) && this.value.length != 0) {
					sum += parseFloat(this.value); // or parseInt(this.value,10) if appropriate
				}
			});
			thisRow.find('td.totalNonVFC input:text').val(sum);
		}

		function getAjax() {
			alert("call Ajax to get Generate data...");
		}

		function displayLoadingProcess() {
			document.getElementById("hdnElement").style.display = "";
		}

		$(function() {
			$("#ProviderPopulationForm")
					.validate(
							{
								invalidHandler : function(form, validator) {
									var errors = validator.numberOfInvalids();
									if (errors) {
										alert(validator.errorList[0].message);
										validator.errorList[0].element.focus();
									}
								},
								errorPlacement : function(error, element) {
									// Override error placement to not show error messages beside elements //
								},
								submitHandler : function(form) {
									var request;
									var checked = false;
									var notZero = false;
									$(form).find('input[type=text]').each(
											function() {
												if ($(this).val() > 0) {
													notZero = true;
													return true;
												}
											});
									if (!notZero) {
										alert("At least one Recertification Provider Population field must be greater than 0.");
										return false;
									}
									$('input[type="checkbox"]').each(
											function() {
												if ($(this).is(':checked')) {
													checked = true;
												}
											});
									if (!checked) {
										alert("At least one Type of Data Used option is required.");
										$("#benchmarking").focus();
										return false;
									}
									$("#cmdAction").val("save");
									$("#btnNext").attr("disabled", true);
									$("#btnCancel").attr("disabled", true);
									$("#btnGenerate").attr("disabled", true);
									displayLoadingProcess();
									setTimeout(function() {
										form.submit();
									}, 1500);//Time in milliseconds

								}//submitHandler
							}); // validate
		}); // function
	</script>
</html:form>