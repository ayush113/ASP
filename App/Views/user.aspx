<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="Views_user" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script>
        function status() {
            
        }
    </script>
    <style>
        .AccordionHeader
        {
            background-color: Red;
            border: 1px solid #2F4F4F;
            color: white;
            cursor: pointer;
            font-family: Arial,Sans-Serif;
            font-size: 12px;
            font-weight: bold;
            margin-top: 5px;
            padding: 5px;
            width: 40%;
        }
        .AccordionHeaderSelected
        {
            background-color: green;
            border: 1px solid #2F4F4F;
            color: white;
            width: 100%;
        }
        .ali
        {
            margin-left:100px;
            margin-top:30px;
        }
        .cld
        {
            max-height:200px;
            overflow-x:scroll;
            overflow-y:scroll;
        }
        .marg
        {
            margin-top: 20px;
            margin-left:100px;
            margin-bottom: 20px;
        }
        .text-ali
        {
            margin-right:100px;
            color: azure;
        }
        .text-ali1
        {
            margin-right:250px;
            color: azure;
        }
        .marg1
        {
            margin-top: 20px;
            margin-left:50px;
            margin-bottom: 20px;
        }
        .table-ali
        {
            margin-top:20px;
            margin-left:100px;
            margin-bottom: 20px;
        }
        .req
        {
            color:crimson;
        }
        .textbtn
        {
            color:blue;
            border:outset;
            border-color: blue;
            background-color:darkgray;
        }
        .label
        {
            background-color:cornflowerblue;
        }
        .txt
        {
            color:antiquewhite;
        }
        .table
        {
            border:solid;
            height: 30px;
            width: 150px;
            border-color:darkgrey;
        }
        .alig
        {
            margin-left:50px;
        }
        .table2
        {
            border:solid;
            border-bottom:none;
        }
    </style>

    <script type="text/javascript">
            function clickme(){
                alert("AJAJAJ");
                PageMethods.report_Click();
                alert("BBBBBB");
            }
    </script>
    
    <div class="container-fluid">
        
        <div class="row float-right">
        <a href="../Views/attendance.aspx">
            <div class="textbtn">
                &nbsp Attendance &nbsp  
            </div>
            
            <!--<asp:Button runat="server" CssClass="btn-primary" ID="attend1" Text="Attendance" OnClick="attend_Click"/>-->
        </a>
        
            <asp:Panel runat="server" ID="panel" BorderColor="Tan" BorderWidth="2px" BackColor="WhiteSmoke" Width="500px" Height="600px">
        <div class="container">
            <div class="row">
                <div class="col-sm-10 label">
                <div class="txt">
                    Attendance Report
                </div>
            </div>
            <div class="col-sm-2 label">
                <asp:Button runat="server" CssClass="btn-success" ID="close1" Text="OK" />
            </div>
            </div>
            <div class="row" runat="server" id="data" visible="false" style="margin-top:30px;">
                <table class="alig">
                    <tr class="table">
                        <td>
                            Days Attended&nbsp : -
                        </td>
                        <td>
                            <asp:Label runat="server" ID="days" ></asp:Label>
                        </td>
                    </tr>
                    <tr class="table">
                        <td>
                            Half Days &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp : -
                        </td>
                        <td>
                            <asp:Label runat="server" ID="half" ></asp:Label>
                        </td>
                    </tr>
                    <tr class="table">
                        <td>
                            Overtime &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp : -
                        </td>
                        <td>
                            <asp:Label runat="server" ID="ot"></asp:Label>
                        </td>
                    </tr>
                    <tr class="table">
                        <td>
                            Leaves Taken
                        </td>
                        <td class="table">
                            <table>
                                <tr>
                                    <td>CL</td>
                                    <td>PL</td>
                                    <td>SL</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label runat="server" ID="cl"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" ID="pl"></asp:Label>
                                    </td>
                                    <td>
                                        
                                        <asp:Label runat="server" ID="sl"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
                
    </asp:Panel>
            </div>
        <div class="col-sm-8 ali">
            
        <ajaxToolkit:Accordion runat="server" ID="Accordion" HeaderCssClass="AccordionHeader" HeaderSelectedCssClass="AccordionHeaderSelected" FadeTransitions="true" SelectedIndex="-1" RequireOpenedPane="false">
            
            <Panes>    
                <ajaxToolkit:AccordionPane runat="server" ID="leave">
                    <Header>
                        Leave Status
                    </Header>
                    <Content>
                        <div class="row">
                            <div class="col-sm-3">
                                <asp:ImageButton runat="server" ID="Status" ImageUrl="~/Images/status.png" />
                                <ajaxToolkit:ModalPopupExtender ID="Modal1" TargetControlID="Status" runat="server" PopupControlID="LeaveStatus" OkControlID="but">
                                    <Animations>
                                        <OnShown><Fadein Duration="0.75"/></OnShown>
                                        <OnHiding><Fadeout Duration="0.25"/></OnHiding>
                                    </Animations>
                                </ajaxToolkit:ModalPopupExtender>
                            </div>
                            <div class="col-sm-3">
                                <asp:ImageButton runat="server" ID="Pending" ImageUrl="~/Images/pending.png" />
                            <ajaxToolkit:ModalPopupExtender ID="Modal2" TargetControlID="Pending" runat="server" PopupControlID="PendingModal" OkControlID="close">
                                <Animations>
                                    <OnShown><Fadein Duration="0.75"></Fadein></OnShown>
                                    <OnHiding><FadeOut Duration="0.25"/></OnHiding>
                                </Animations>
                            </ajaxToolkit:ModalPopupExtender>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <asp:ImageButton runat="server" ID="All" ImageUrl="~/Images/all.png" />
                                <!--Enter modal extender here !-->
                                <ajaxToolkit:ModalPopupExtender runat="server" ID="Modal3" TargetControlID="All" PopupControlID="AllPanel" OkControlID="ImageButton1">
                                    <Animations>
                                    <OnShown><Fadein Duration="0.75"></Fadein></OnShown>
                                    <OnHiding><FadeOut Duration="0.25"/></OnHiding>
                                </Animations>
                                </ajaxToolkit:ModalPopupExtender>
                            </div>
                            <div class="col-sm-3">
                                <asp:ImageButton runat="server" ID="Apply" ImageUrl="~/Images/apply.png" />
                                <ajaxToolkit:ModalPopupExtender runat="server" ID="Modal4" TargetControlID="Apply" PopupControlID="ApplyPanel" OkControlID="but1">
                                    <Animations>
                                    <OnShown><Fadein Duration="0.75"></Fadein></OnShown>
                                    <OnHiding><FadeOut Duration="0.25"/></OnHiding>
                                </Animations>
                                </ajaxToolkit:ModalPopupExtender>
                            </div>
                        </div>
                        
                    </Content>
                </ajaxToolkit:AccordionPane>
                <ajaxToolkit:AccordionPane runat="server" ID="attendance">
                    <Header>
                        Attendance Status
                    </Header>
                    <Content>
                        attttt
                    </Content>
                </ajaxToolkit:AccordionPane>
                <ajaxToolkit:AccordionPane runat="server" ID="task">
                    <Header>
                        Task Status
                    </Header>
                    <Content>
                        asfasfd
                    </Content>
                </ajaxToolkit:AccordionPane>
            </Panes>
        </ajaxToolkit:Accordion>
    </div>
        
        <div class="col-sm-4 float-right">
            <div class="row">
                <h5 style="background-color:cornflowerblue">News Feed</h5>
            </div>
            
            <div class="row">
                <div class="cld">
            <asp:GridView ID="gvRss" runat="server">
</asp:GridView>
        </div>
            
            </div>
        </div>
    <asp:Panel runat ="server" ID="LeaveStatus" Width="500px" BorderWidth="2px" BorderColor="Black" BackColor="Teal" Height="600px">
        <div class="container">
            <div class="row">
                <div class="col-sm-11">
                    <div class="float-right text-ali">
                        <b>Remaining Leave Status</b>
                    </div>
                </div>
                <div class="col-sm-1 float-right">
                    <asp:ImageButton runat="server" ID="but" ImageUrl="~/Images/close.png" Width ="15px" Height="15px" BackColor="Teal" />
                </div>
            </div>
            <div class="row marg">
                <asp:GridView runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SQLLeavestatus" ForeColor="Black" GridLines="Horizontal">

                    <Columns>
                        <asp:BoundField DataField="userid" HeaderText="userid" SortExpression="userid" />
                        <asp:BoundField DataField="CL" HeaderText="CL" SortExpression="CL" />
                        <asp:BoundField DataField="SL" HeaderText="SL" SortExpression="SL" />
                        <asp:BoundField DataField="PL" HeaderText="PL" SortExpression="PL" />
                        <asp:BoundField DataField="FinancialYear" HeaderText="FinancialYear" SortExpression="FinancialYear" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />

                </asp:GridView>
                <asp:SqlDataSource ID="SQLLeavestatus" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [userid], [CL], [SL], [PL], [FinancialYear] FROM [LeaveMaster] WHERE ([userid] = @userid)">
                    <SelectParameters>
                        <asp:SessionParameter Name="userid" SessionField="userid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>    
        
    </asp:Panel>

        <asp:Panel runat="server" ID="PendingModal" Width="500px" BorderWidth="2px" BorderColor="Black" BackColor="Teal" Height="600px">
            <div class="container">
                <div class="row">
                    <div class="col-sm-11">
                        <div class="float-right text-ali">
                            <b>Pending Leaves</b>
                        </div>
                    </div>
                    <div class="col-sm-1 float-right">
                        <asp:ImageButton runat="server" ID="close" ImageUrl="~/Images/close.png" Width="15px" Height="15px" />
                    </div>
                </div>
                <div class="row marg">
                    <asp:GridView runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlPending" ForeColor="Black" GridLines="Horizontal">

                        <Columns>
                            <asp:BoundField DataField="userid" HeaderText="userid" SortExpression="userid" />
                            <asp:BoundField DataField="DateApplied" HeaderText="DateApplied" SortExpression="DateApplied" />
                            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                            <asp:BoundField DataField="NoOfDays" HeaderText="NoOfDays" SortExpression="NoOfDays" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />

                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlPending" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [userid], [DateApplied], [Type], [NoOfDays] FROM [LeaveTracker] WHERE (([userid] = @userid) AND ([ApprovedBy] = @ApprovedBy))">
                        <SelectParameters>
                            <asp:SessionParameter Name="userid" SessionField="userid" Type="Int32" />
                            <asp:Parameter DefaultValue="0" Name="ApprovedBy" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            
        </asp:Panel>
    
        <asp:Panel runat="server" ID="AllPanel" Width="800px" BorderWidth="2px" BorderColor="Black" BackColor="Teal" Height="600px">
            <div class="container">
                <div class="row">
                    <div class="col-sm-11">
                        <div class="float-right text-ali1">
                            <b>All Leaves</b>
                        </div>
                    </div>
                    <div class="col-sm-1 float-right">
                        <asp:ImageButton runat="server" ID="ImageButton1" ImageUrl="~/Images/close.png" Width="15px" Height="15px" />
                    </div>
                </div>
                <div class="row marg1">
                    <asp:GridView runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlAll" ForeColor="Black" GridLines="Horizontal">

                        <Columns>
                            <asp:BoundField DataField="userid" HeaderText="userid" SortExpression="userid" />
                            <asp:BoundField DataField="DateApplied" HeaderText="DateApplied" SortExpression="DateApplied" />
                            <asp:BoundField DataField="DateTaken" HeaderText="DateTaken" SortExpression="DateTaken" />
                            <asp:BoundField DataField="NoOfDays" HeaderText="NoOfDays" SortExpression="NoOfDays" />
                            <asp:BoundField DataField="NoofDaysActual" HeaderText="NoofDaysActual" SortExpression="NoofDaysActual" />
                            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                            <asp:CheckBoxField DataField="hasTaken" HeaderText="hasTaken" SortExpression="hasTaken" />
                            <asp:BoundField DataField="ApprovedBy" HeaderText="ApprovedBy" SortExpression="ApprovedBy" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />

                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlAll" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [userid], [DateApplied], [DateTaken], [NoOfDays], [NoofDaysActual], [Type], [hasTaken], [ApprovedBy] FROM [LeaveTracker] WHERE ([userid] = @userid)">
                        <SelectParameters>
                            <asp:SessionParameter Name="userid" SessionField="userid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            
        </asp:Panel>

        <asp:UpdatePanel runat="server" ID="UP1">
            <ContentTemplate>
                <asp:Panel runat="server" ID="ApplyPanel" Width="500px" BorderWidth="2px" BorderColor="Black" BackColor="Teal" Height="600px">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-11">
                                <div class="float-right text-ali">
                                    <b>Leave Application</b>
                                </div>
                            </div>
                            <div class="col-sm-1">
                                <asp:ImageButton runat="server" ID="but1" ImageUrl="~/Images/close.png" Width ="15px" Height="15px" BackColor="Teal" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="table-ali">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label runat="server" Text="Start Date" ForeColor="Lime"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="DateApplied"></asp:TextBox>
                                                <asp:RequiredFieldValidator CssClass="req" runat="server" ControlToValidate="DateApplied" ErrorMessage="This Field Cannot be empty"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label runat="server" Text="No. of Days" ForeColor="Lime"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox runat="server" ID="NoOfDays"></asp:TextBox>
                                                <asp:CustomValidator CssClass="req" runat="server" ControlToValidate="NoOfDays" ErrorMessage="Should be a Whole Number" OnServerValidate="Unnamed_ServerValidate"></asp:CustomValidator>  
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label runat="server" Text="Type of Leave" ForeColor="Lime"></asp:Label>
                                            </td>
                                            <td>
                                               <asp:DropDownList runat="server" ID="ddl">
                                                    <asp:ListItem Selected="False">CL</asp:ListItem>
                                                   <asp:ListItem Selected="False">PL</asp:ListItem>
                                                   <asp:ListItem Selected="False">SL</asp:ListItem>
                                               </asp:DropDownList>
                                                <asp:RequiredFieldValidator CssClass="req" runat="server" ControlToValidate="ddl" ErrorMessage="Cannot Be Empty"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Button runat="server" ID="submit" Text="Apply" OnClick="submit_Click" CausesValidation="true" />
                            </div>
                        </div>
                    </div>
                    
                    </asp:Panel>
            </ContentTemplate>
            
            
        </asp:UpdatePanel>
    
    </div>
   
    <asp:Button CssClass="textbtn" runat="server" ID="report" Text="Attendance Report" OnClick="report_Click" />
            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" OkControlID="close1" runat="server" TargetControlID="report" PopupControlID="panel"></ajaxToolkit:ModalPopupExtender>
</asp:Content>

