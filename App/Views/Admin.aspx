<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Views_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-2">
                <asp:Image ID="Image1" runat="server" ImageUrl="/Images/logo.png" Height="100px" Width="100px" />
            </div>
            <div class="col-sm-8">CONTENT IN THE MIDDLE</div>
            <div class="col-sm-2">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [Profile] FROM [Users] WHERE ([username] = @username)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="" Name="username" SessionField="username" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>

