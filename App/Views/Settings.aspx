<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Settings.aspx.cs" Inherits="Views_Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .first{
            margin-left:10px;
        }
        .ali{
            margin-left: 550px;
            margin-top: 50px;
        }
        .one{
            margin-left:12.5px;
        }
        .three{
            margin-left:42px;
        }
        .gender{
            margin-left:29px;
        }
        .add{
            margin-left:17px;
        }
        .city{
            margin-left:56px;
        }
        .state{
            margin-left:47px;
        }
        .pin
        {
            margin-left:59px;
        }
        .mobile{
            margin-left:31px;
        }
        .telephone{
            margin-left:8.5px;
        }
        .email{
            margin-left:42px;
        }
        .dob{
            margin-left:54px;
        }
        .delete{
            margin-left:13px;
        }
        .image{
            margin-left:38px;
        }
        .create1{
            margin-left:3px;
        }
        .create2{
            margin-left:7px;
        }
    </style>
    <div class="row ali">

        <asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="userid" DataSourceID="ConnectionString1" GridLines="Both" AllowPaging="True" DefaultMode="Edit" OnPageIndexChanging="FormView1_PageIndexChanging">
            <EditItemTemplate>
                userid:
                <asp:Label ID="useridLabel1" runat="server" Text='<%# Eval("userid") %>' />
                <br />
                username:
                <asp:TextBox CssClass="first" ID="usernameTextBox" runat="server"  Text='<%# Bind("username") %>' />
                <br />
                password:
                <asp:TextBox CssClass="one" ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                <br />
                name:
                <asp:TextBox CssClass="three" ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
                <br />
                gender:
                <asp:TextBox CssClass="gender" ID="genderTextBox" runat="server" Text='<%# Bind("gender") %>' />
                <br />
                address1:
                <asp:TextBox CssClass="add" ID="address1TextBox" runat="server" Text='<%# Bind("address1") %>' />
                <br />
                address2:
                <asp:TextBox CssClass="add" ID="address2TextBox" runat="server" Text='<%# Bind("address2") %>' />
                <br />
                city:
                <asp:TextBox CssClass="city" ID="cityTextBox" runat="server" Text='<%# Bind("city") %>' />
                <br />
                state:
                <asp:TextBox CssClass="state" ID="stateTextBox" runat="server" Text='<%# Bind("state") %>' />
                <br />
                pin:
                <asp:TextBox CssClass="pin" ID="pinTextBox" runat="server" Text='<%# Bind("pin") %>' />
                <br />
                mobile:
                <asp:TextBox CssClass="mobile" ID="mobileTextBox" runat="server" Text='<%# Bind("mobile") %>' />
                <br />
                telephone:
                <asp:TextBox CssClass="telephone" ID="telephoneTextBox" runat="server" Text='<%# Bind("telephone") %>' />
                <br />
                email:
                <asp:TextBox CssClass="email" ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <br />
                dob:
                <asp:TextBox CssClass="dob" ID="dobTextBox" runat="server" Text='<%# Bind("dob") %>' />
                <br />
                IsDeleted:
                <asp:TextBox CssClass="delete" ID="IsDeletedTextBox" runat="server" Text='<%# Bind("IsDeleted") %>' />
                <br />
                CreatedOn:
                <asp:TextBox CssClass="create1" ID="CreatedOnTextBox" runat="server" Text='<%# Bind("CreatedOn") %>' />
                <br />
                CreatedBy:
                <asp:TextBox CssClass="create2" ID="CreatedByTextBox" runat="server" Text='<%# Bind("CreatedBy") %>' />
                <br />
                Image:
                <asp:TextBox CssClass="image" ID="ImageTextBox" runat="server" Text='<%# Bind("Image") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <InsertItemTemplate>
                username:
                <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                <br />
                password:
                <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
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
                email:
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <br />
                dob:
                <asp:TextBox ID="dobTextBox" runat="server" Text='<%# Bind("dob") %>' />
                <br />
                IsDeleted:
                <asp:TextBox ID="IsDeletedTextBox" runat="server" Text='<%# Bind("IsDeleted") %>' />
                <br />
                CreatedOn:
                <asp:TextBox ID="CreatedOnTextBox" runat="server" Text='<%# Bind("CreatedOn") %>' />
                <br />
                CreatedBy:
                <asp:TextBox ID="CreatedByTextBox" runat="server" Text='<%# Bind("CreatedBy") %>' />
                <br />
                Image:
                <asp:TextBox ID="ImageTextBox" runat="server" Text='<%# Bind("Image") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                userid:
                <asp:Label ID="useridLabel" runat="server" Text='<%# Eval("userid") %>' />
                <br />
                username:
                <asp:Label ID="usernameLabel" runat="server" Text='<%# Bind("username") %>' />
                <br />
                password:
                <asp:Label ID="passwordLabel" runat="server" Text='<%# Bind("password") %>' />
                <br />
                name:
                <asp:Label ID="nameLabel" runat="server" Text='<%# Bind("name") %>' />
                <br />
                gender:
                <asp:Label ID="genderLabel" runat="server" Text='<%# Bind("gender") %>' />
                <br />
                address1:
                <asp:Label ID="address1Label" runat="server" Text='<%# Bind("address1") %>' />
                <br />
                address2:
                <asp:Label ID="address2Label" runat="server" Text='<%# Bind("address2") %>' />
                <br />
                city:
                <asp:Label ID="cityLabel" runat="server" Text='<%# Bind("city") %>' />
                <br />
                state:
                <asp:Label ID="stateLabel" runat="server" Text='<%# Bind("state") %>' />
                <br />
                pin:
                <asp:Label ID="pinLabel" runat="server" Text='<%# Bind("pin") %>' />
                <br />
                mobile:
                <asp:Label ID="mobileLabel" runat="server" Text='<%# Bind("mobile") %>' />
                <br />
                telephone:
                <asp:Label ID="telephoneLabel" runat="server" Text='<%# Bind("telephone") %>' />
                <br />
                email:
                <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                <br />
                dob:
                <asp:Label ID="dobLabel" runat="server" Text='<%# Bind("dob") %>' />
                <br />
                IsDeleted:
                <asp:Label ID="IsDeletedLabel" runat="server" Text='<%# Bind("IsDeleted") %>' />
                <br />
                CreatedOn:
                <asp:Label ID="CreatedOnLabel" runat="server" Text='<%# Bind("CreatedOn") %>' />
                <br />
                CreatedBy:
                <asp:Label ID="CreatedByLabel" runat="server" Text='<%# Bind("CreatedBy") %>' />
                <br />
                Image:
                <asp:Label ID="ImageLabel" runat="server" Text='<%# Bind("Image") %>' />
                <br />
            </ItemTemplate>
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
        </asp:FormView>

        <asp:SqlDataSource ID="ConnectionString1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT * FROM [Users] WHERE ([userid] = @userid)" UpdateCommand="UPDATE [Users] SET [username] = @username,
            [password]=@password,[name]=@name,[gender]=@gender,[address1]=@address1,[address2]=@address2,[city]=@city,[state]=@state,[pin]=@pin,[mobile]=@mobile,[telephone]=@telephone,
            [email]=@email,[dob]=@dob,[IsDeleted]=@IsDeleted,[CreatedOn]=@CreatedOn,[CreatedBy]=@CreatedBy,[Image]=@Image" UpdateCommandType="Text">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="userid" SessionField="userid" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="username" Type="String"/>
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="gender" Type="String" />
                <asp:Parameter Name="address1" Type="String" />
                <asp:Parameter Name="address2" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name ="state" Type="String" />
                <asp:Parameter Name="pin" Type="String" />
                <asp:Parameter Name="mobile" Type="String" />
                <asp:Parameter Name="telephone" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="dob" Type="String" />
                <asp:Parameter Name="IsDeleted" Type="Int32" />
                <asp:Parameter Name="CreateOn" Type="DateTime" />
                <asp:Parameter Name="CreatedBy" Type="String" />
                <asp:Parameter Name="Image" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>


    </div>
    </asp:Content>

