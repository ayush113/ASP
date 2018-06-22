<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Views_Login" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .req{
            color: red;
        }
        .ali{
            margin-left: 300px;
            margin-top: 10px;
        }
        .ali2{
            margin-left: 1000px;
        }
        .auto-style1 {
            margin-left: 1000px;
            width: 137px;
        }
        .auto-style2 {
            width: 137px;
        }
        .text{
            margin-left: 400px;
            margin-right:400px;
        }
        .marg
        {
            margin-left:250px;
            margin-right:400px;
            margin-top:50px;
        }
        .ali3{
            margin-left:350px;
            margin-top:20px;
            margin-bottom:30px;
        }
        .mar
        {
            margin-left:280px;
        }
        .move
        {
            margin-left:250px;
        }
        .text-ali
        {
            text-align:center;
            margin-left:300px;
            margin-right:400px;
            margin-top:20px;
        }
        .cont-ali
        {
            margin-top: 40px;
            margin-left:150px;
        }
        .pos
        {
            margin-top: 10px;
            margin-bottom:10px;
        }
        .but-ali
        {
            margin-top:10px;
            margin-left:200px;
        }
        
        .cont
        {
            border:groove;
            border-color:lime;
            background-image:url("../Images/log.jpg");
            background-size:cover;
            
        }
    </style>
    <asp:MultiView runat="server" ID="multiview" >
        <asp:View runat="server" ID="view0">
            <div class="container-fluid ">
                <div class="row text-ali">
                   <h6>Enter details below -- First Login</h6> 
                </div>
                <div class="container cont-ali">
                    <div class="row">
                    <div class="col-sm-4">
                        <asp:Label runat="server" Text="Password"></asp:Label>
                    </div>
                    <div class="col-sm-8">
                        <asp:TextBox runat="server" ID="pwd" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
                    <div class="row pos">
                        <div class="col-sm-4">
                            Security Question:
                        </div>
                        <div class="col-sm-8">
                            <asp:Label runat="server" ID="quef"></asp:Label>
                        </div>
                    </div>
                <div class="row">
                    <div class="col-sm-4">
                        Answer to Security Question
                    </div>
                    <div class="col-sm-8">
                        <asp:TextBox runat="server" ID="ans"></asp:TextBox>
                    </div>
                </div>
                    <div class="row but-ali">
                        <asp:Button runat="server" ID="First" Text="Submit" OnClick="First_Click"/>
                    </div>
                </div>
                

            </div>
        </asp:View>
        <asp:View runat="server" ID="view1">
            <div class="container">
                <div class="jumbotron text-center">
                <div>
                    <h2 class="text">LOGIN</h2>
                </div>
                
                <div class="container text-center">
                            <div class="row">
                                <div class="col-sm-6">
                                    <asp:Label runat="server" Text="Username"></asp:Label>
                            
                                </div>
                                <div class="col-sm-6">
                                    <asp:TextBox runat="server" ID="uname"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator CssClass="req" runat="server" ControlToValidate="uname" ErrorMessage="Username Cannot be empty"></asp:RequiredFieldValidator>
                               </div>
                                
                          <div class="row">
                              <div class="col-sm-6">
                                  <asp:Label runat="server" Text="Password"></asp:Label>
                              </div>
                              <div class="col-sm-6">
                                  <asp:TextBox runat="server" ID="password" TextMode="Password"></asp:TextBox>
                              </div>
                                <asp:RequiredFieldValidator CssClass="req" runat="server" ControlToValidate="password" ErrorMessage="Password can not be empty"></asp:RequiredFieldValidator>
                          </div>
                        <div class="row">
                            <div class="col-sm-6">
                                 <a href="../Views/Login.aspx?view=2">Forgot Password ?</a>
                            </div>
                                <div class="col-sm-6">
                                    <asp:Button ID="login" runat="server" Text="Login" OnClick="login_Click"/>
                                </div>
                                 
                        </div>
                    
                            
                                
                              
                             
                    <asp:Label runat="server" ID="lblmsg"></asp:Label>
                    </div>
                </div> 
            </div>           
        </asp:View>
        <asp:View runat="server" ID="view2">
            <div class="container-fluid">
                <div class="row marg">
                    <div class="col-sm-4">
                        <asp:Label runat="server" Text="Username"></asp:Label>
                    </div>
                    <div class="col-sm-8">
                        <asp:TextBox runat="server" ID="name"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="val" Display="Dynamic" CssClass="req" runat="server" ControlToValidate="name" ErrorMessage="No username has been provided"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row marg">
                        <div class="col-sm-4">
                            <asp:Label runat="server" Text="Email ID"></asp:Label>
                        </div>
                        <div class="col-sm-8">
                            <asp:TextBox runat="server" ID="mail"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="val" Display="Dynamic" CssClass="req"  runat="server" ControlToValidate="mail" ErrorMessage="No email ID has been provided"></asp:RequiredFieldValidator>
                            
                        </div>
                    </div>
            </div>
            <div class="row ali3">
                <asp:Button ValidationGroup="val" runat="server" ID="submit" Text="Submit" CausesValidation="true" OnClick="submit_Click" />
                
            </div>
            <div class="row move">
                <div class="col-sm-4">
                    <a href="../Views/Login.aspx?view=2">Email Password Reset</a>
                </div>
                <div class="col-sm-3">
                    <a href="../Views/Login.aspx?view=3">Answer a security Question</a>
                </div>
            </div>
            <asp:Label CssClass="req mar" ID="Label1" runat="server" Text=""></asp:Label>

        </asp:View>
        <asp:View runat="server" ID="view3">
            <div class="row marg" runat="server" id="add" visible="false">
                <div class="col-sm-4">
                    Security Question:
                </div>
                <div class="col-sm-8">
                <asp:Label runat="server" ID="que"></asp:Label>
                </div>
            </div>
            <div class="row marg">
                    <div class="col-sm-4">
                        <asp:Label runat="server" Text="Username" ID="lab1"></asp:Label>
                    </div>
                    <div class="col-sm-8">
                        <asp:TextBox runat="server" ID="name1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rew" ValidationGroup="val" Display="Dynamic" CssClass="req" runat="server" ControlToValidate="name1" ErrorMessage="No username has been provided"></asp:RequiredFieldValidator>
                    </div>
                </div>
            <div class="row">
                <asp:Button runat="server" ValidationGroup="val" ID="cont" Text="Continue" OnClick="cont_Click" CausesValidation="true" />
                <asp:Button runat="server" ValidationGroup="val" ID="sub" Text="Submit" Visible="false" OnClick="sub_Click1" CausesValidation="true"/>
            </div>
            <div class ="row">
                <asp:Label CssClass="req" runat="server" ID="msg"></asp:Label>
            </div>
                
        </asp:View>
    </asp:MultiView>
    
</asp:Content>

