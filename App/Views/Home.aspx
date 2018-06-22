<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Views_Home" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
                <div>
            <asp:Menu ID="Menu1" runat="server" StaticSubMenuIndent="16px">
                <Items>
                    <asp:MenuItem Text="Home" Value="Home" NavigateUrl="~/Views/Home.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Register" Value="Register" NavigateUrl="~/Views/Register.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Login" Value="Login" NavigateUrl="~/Views/Login.aspx"></asp:MenuItem>
                </Items>
            </asp:Menu>
                    </div>
        <asp:Label runat="server" ID="lblmsg"></asp:Label>
                </div>
</asp:Content>

