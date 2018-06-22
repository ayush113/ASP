<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Page.aspx.cs" Inherits="Views_Page" EnableSessionState="True" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .ali{
            margin-top:50px;
        }
        .entry{
            margin-top:50px;
            margin-left:400px;
            margin-right:200px;
            margin-bottom:50px;
        }
        .req{
            color:red;
        }
        .ali2
        {
            margin-left:10px;
        }
        .marg
        {
            margin-left:1140px;
        }
        .modal-content
        {
            display:none;
        }
        .fix
        {
            margin-left:80px;
            margin-top: 20px;
        }
        .top
        {
            margin-top: 10px;
        }
        
    </style>
    
    <div class="container ali float-left">
        <div class="container">
            <asp:Button runat="server"  CssClass="btn-primary" ID="approve" Text="Approve Leaves"/>
            <ajaxToolkit:ModalPopupExtender runat="server" ID="modal2" PopupControlID="Approval" TargetControlID="approve" ></ajaxToolkit:ModalPopupExtender>
        </div>
        <div class="marg">
            <asp:ImageButton runat="server" ID="plus" ImageUrl="~/Images/plus.png" Height="25px" Width="25px" OnClick="plus_Click" />
        </div>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [userid], [name], [username], [gender], [address1], [address2], [city], [state], [pin], [mobile], [email], [telephone], [dob] FROM [Users] WHERE ([IsDeleted] = @IsDeleted)" OnSelecting="SqlDataSource1_Selecting" >
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="IsDeleted" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="userid" style="height: 114px">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFFFFF;color: #284775;">
                    <td>
                        <asp:Label ID="useridLabel" runat="server" Text='<%# Eval("userid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                    </td>
                    <td>
                        <asp:Label ID="genderLabel" runat="server" Text='<%# Eval("gender") %>' />
                    </td>
                    <td>
                        <asp:Label ID="address1Label" runat="server" Text='<%# Eval("address1") %>' />
                    </td>
                    <td>
                        <asp:Label ID="address2Label" runat="server" Text='<%# Eval("address2") %>' />
                    </td>
                    <td>
                        <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
                    </td>
                    <td>
                        <asp:Label ID="stateLabel" runat="server" Text='<%# Eval("state") %>' />
                    </td>
                    <td>
                        <asp:Label ID="pinLabel" runat="server" Text='<%# Eval("pin") %>' />
                    </td>
                    <td>
                        <asp:Label ID="mobileLabel" runat="server" Text='<%# Eval("mobile") %>' />
                    </td>
                    <td>
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="telephoneLabel" runat="server" Text='<%# Eval("telephone") %>' />
                    </td>
                    <td>
                       <asp:Label ID="dobLabel" runat="server" Text='<%# Eval("dob") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #999999;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="useridLabel1" runat="server" Text='<%# Eval("userid") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="genderTextBox" runat="server" Text='<%# Bind("gender") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="address1TextBox" runat="server" Text='<%# Bind("address1") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="address2TextBox" runat="server" Text='<%# Bind("address2") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="stateTextBox" runat="server" Text='<%# Bind("state") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="pinTextBox" runat="server" Text='<%# Bind("pin") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="mobileTextBox" runat="server" Text='<%# Bind("mobile") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="telephoneTextBox" runat="server" Text='<%# Bind("telephone") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="dobTextBox" runat="server" Text='<%# Bind("dob") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="genderTextBox" runat="server" Text='<%# Bind("gender") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="address1TextBox" runat="server" Text='<%# Bind("address1") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="address2TextBox" runat="server" Text='<%# Bind("address2") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="stateTextBox" runat="server" Text='<%# Bind("state") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="pinTextBox" runat="server" Text='<%# Bind("pin") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="mobileTextBox" runat="server" Text='<%# Bind("mobile") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="telephoneTextBox" runat="server" Text='<%# Bind("telephone") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="dobTextBox" runat="server" Text='<%# Bind("dob") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #E0FFFF;color: #333333;">
                    <td>
                        <asp:Label ID="useridLabel" runat="server" Text='<%# Eval("userid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                    </td>
                    <td>
                        <asp:Label ID="genderLabel" runat="server" Text='<%# Eval("gender") %>' />
                    </td>
                    <td>
                        <asp:Label ID="address1Label" runat="server" Text='<%# Eval("address1") %>' />
                    </td>
                    <td>
                        <asp:Label ID="address2Label" runat="server" Text='<%# Eval("address2") %>' />
                    </td>
                    <td>
                        <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
                    </td>
                    <td>
                        <asp:Label ID="stateLabel" runat="server" Text='<%# Eval("state") %>' />
                    </td>
                    <td>
                        <asp:Label ID="pinLabel" runat="server" Text='<%# Eval("pin") %>' />
                    </td>
                    <td>
                        <asp:Label ID="mobileLabel" runat="server" Text='<%# Eval("mobile") %>' />
                    </td>
                    <td>
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="telephoneLabel" runat="server" Text='<%# Eval("telephone") %>' />
                    </td>
                    <td>
                        <asp:Label ID="dobLabel" runat="server" Text='<%# Eval("dob") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                    <th runat="server">userid</th>
                                    <th runat="server">name</th>
                                    <th runat="server">username</th>
                                    <th runat="server">gender</th>
                                    <th runat="server">address1</th>
                                    <th runat="server">address2</th>
                                    <th runat="server">city</th>
                                    <th runat="server">state</th>
                                    <th runat="server">pin</th>
                                    <th runat="server">mobile</th>
                                    <th runat="server">email</th>
                                    <th runat="server">telephone</th>
                                    <th runat="server">dob</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                    <td>
                        <asp:Label ID="useridLabel" runat="server" Text='<%# Eval("userid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                    </td>
                    <td>
                        <asp:Label ID="genderLabel" runat="server" Text='<%# Eval("gender") %>' />
                    </td>
                    <td>
                        <asp:Label ID="address1Label" runat="server" Text='<%# Eval("address1") %>' />
                    </td>
                    <td>
                        <asp:Label ID="address2Label" runat="server" Text='<%# Eval("address2") %>' />
                    </td>
                    <td>
                        <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
                    </td>
                    <td>
                        <asp:Label ID="stateLabel" runat="server" Text='<%# Eval("state") %>' />
                    </td>
                    <td>
                        <asp:Label ID="pinLabel" runat="server" Text='<%# Eval("pin") %>' />
                    </td>
                    <td>
                        <asp:Label ID="mobileLabel" runat="server" Text='<%# Eval("mobile") %>' />
                    </td>
                    <td>
                        <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="telephoneLabel" runat="server" Text='<%# Eval("telephone") %>' />
                    </td>
                    <td>
                        <asp:Label ID="dobLabel" runat="server" Text='<%# Eval("dob") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
           
                <div runat="server" class="container entry" id="entry">
            <div class="row">
                <asp:Label runat="server" Text="Enter User ID"></asp:Label>
            <asp:TextBox runat="server" CssClass="ali2" ID="uid" ClientIDMode="Predictable" Width="75px"></asp:TextBox>
            <asp:ImageButton runat="server" CssClass="ali2" ID="edit" ImageUrl="~/Images/edit.svg" Height="25px" Width="25px" ToolTip="Edit Details" OnClick="edit_Click"/>
                <ajaxToolkit:ModalPopupExtender ID="Moda1" runat="server" PopupControlID="EditPane" TargetControlID="edit" OkControlID="close">
                    <Animations>
                                    <OnShown><Fadein Duration="0.75"></Fadein></OnShown>
                                    <OnHiding><FadeOut Duration="0.25"/></OnHiding>
                                </Animations>
                </ajaxToolkit:ModalPopupExtender>
            <asp:ImageButton runat="server" CssClass="ali2" ID="delete" ImageUrl="~/Images/view.png" Height="25px" Width="25px" ToolTip="View Details" OnClick="view_Click" />
            <asp:ImageButton runat="server" CssClass="ali2" ID="view"  ImageUrl="~/Images/delete.jpg" Height="25px" Width="25px" ToolTip="Delete Details" OnClick="delete_Click"/>
            </div>
            <div class="row">
                <asp:Label runat="server" ID="lblmsg"></asp:Label>
            </div>
            
        </div>
    <asp:Panel runat="server" ID="EditPane" Width="500px" Height="500px" BorderWidth="4px" BorderColor="Black" BackColor="WhiteSmoke">
        <div class="container">
            <div class ="row top">
                <div class="col-sm-10">
                    <div>
                        Edit Details for User
                    </div>
                </div>
                <div class="col-sm-2">
                    <asp:Button runat="server" ID="close" CssClass="btn-danger" Text="Close" />
                </div>
                <div class="row top">
                    
                    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataEdit">
                        <EditItemTemplate>
                            username:
                            <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                            <br />
                            name:
                            <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                            <br />
                            gender:
                            <asp:TextBox ID="genderTextBox" runat="server" Text='<%# Bind("gender") %>' />
                            <br />
                            address1:
                            <asp:TextBox ID="address1TextBox" runat="server" Text='<%# Bind("address1") %>' />
                            <br />
                            address2:
                            <asp:TextBox ID="address2TextBox" runat="server" Text='<%# Bind("address2") %>' />
                            <br />
                            city:
                            <asp:TextBox ID="cityTextBox" runat="server" Text='<%# Bind("city") %>' />
                            <br />
                            state:
                            <asp:TextBox ID="stateTextBox" runat="server" Text='<%# Bind("state") %>' />
                            <br />
                            pin:
                            <asp:TextBox ID="pinTextBox" runat="server" Text='<%# Bind("pin") %>' />
                            <br />
                            mobile:
                            <asp:TextBox ID="mobileTextBox" runat="server" Text='<%# Bind("mobile") %>' />
                            <br />
                            telephone:
                            <asp:TextBox ID="telephoneTextBox" runat="server" Text='<%# Bind("telephone") %>' />
                            <br />
                            dob:
                            <asp:TextBox ID="dobTextBox" runat="server" Text='<%# Bind("dob") %>' />
                            <br />
                            email:
                            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                            <br />
                            IsLocked:
                            <asp:CheckBox ID="IsLockedCheckBox" runat="server" Checked='<%# Bind("IsLocked") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataEdit" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [username], [name], [gender], [address1], [address2], [city], [state], [pin], [mobile], [telephone], [dob], [email], [IsLocked] FROM [Users] WHERE ([userid] = @userid)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="uid" Name="userid" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                </div>
            </div>
            
        </div>
    </asp:Panel>

    <asp:Panel runat="server" ID="Approval" Width="500px" Height="500px" BorderWidth="4px" BorderColor="Black" BackColor="WhiteSmoke">
        <div class="container">
            <div class="row fix">
                <asp:GridView runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="Id" DataSourceID="SqlLeave" GridLines="None">

                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="userid" HeaderText="userid" SortExpression="userid" />
                        <asp:BoundField DataField="DateApplied" HeaderText="DateApplied" SortExpression="DateApplied" />
                        <asp:BoundField DataField="NoOfDays" HeaderText="NoOfDays" SortExpression="NoOfDays" />
                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                    </Columns>
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#594B9C" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#33276A" />

                </asp:GridView>
                <asp:SqlDataSource ID="SqlLeave" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [Id], [userid], [DateApplied], [NoOfDays], [Type] FROM [LeaveTracker] WHERE ([ApprovedBy] = @ApprovedBy)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="ApprovedBy" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <div class="row fix">
                <div class="col-sm-4">
                    ID to Approve
                </div>
                <div class="col-sm-8">
                    <asp:TextBox runat="server" ID="id" ></asp:TextBox>
                </div>
            </div>
            <div class="row fix">
                <div>
                    <asp:Button runat="server" CssClass="btn-success"  ID="done" Text="Approve" CausesValidation="true" OnClick="done_Click" />
                    <asp:RequiredFieldValidator runat="server"  ControlToValidate="id" ErrorMessage="Can not be empty" CssClass="req"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
    </asp:Panel>

    </div>

    
    </asp:Content>

