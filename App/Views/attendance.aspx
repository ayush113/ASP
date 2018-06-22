<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="attendance.aspx.cs" Inherits="Views_attendance" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .top
        {
            margin-top: 50px;
        }
        .req
        {
            color: red;
        }
    </style>
    <div class="container">
        <div class="row top">
            <div class="col-sm-2">
            </div>
            <div class="col-sm-1">
                Sign-In Time
            </div>
            <div class="col-sm-3">
                <asp:TextBox runat="server" ID="in"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="in" ErrorMessage="Can not be empty" CssClass="req"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="in" ValidationExpression="^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$" ErrorMessage="Enter time in HH:MM Format" CssClass="req"></asp:RegularExpressionValidator>
            </div>
            <div class="col-sm-1">
                Sign-Out Time
            </div>
            <div class="col-sm-3">
                <asp:TextBox runat="server" ID="out"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <asp:Button runat="server" ID="attend" Text="Log Register" CssClass="btn-info" OnClick="attend_Click"/>
                <asp:RegularExpressionValidator runat="server" ControlToValidate="out" ValidationExpression="^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$" ErrorMessage="Enter time in HH:MM Format" CssClass="req"></asp:RegularExpressionValidator>
            </div>
            <div class="col-sm-3"></div>
        </div>
        <div class="row">
            <asp:Button runat="server" ID="report" Text="Attendance Report" />
            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="report" PopupControlID="panel"></ajaxToolkit:ModalPopupExtender>
        </div>
    </div>
    <asp:Panel runat="server" ID="panel">
        
    </asp:Panel>
</asp:Content>

