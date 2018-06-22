<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Views_Register" EnableSessionState="True" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 94px;
            height: 60px;
        }
        .auto-style2 {
            width: 146px;
            height: 60px;
        }
        .auto-style3 {
            height: 31px;
        }
        .auto-style4 {
            width: 146px;
            height: 31px;
        }
        .auto-style5 {
            height: 36px;
        }
        .auto-style6 {
            /*margin-left: 0px;*/
        }
        .auto-style7 {
            height: 30px;
        }
        .auto-style8 {
            height: 26px;
        }
        .auto-style9 {
            height: 60px;
        }
        .auto-style10{
            height:31px;
            margin-left: 20px;
        }
        .auto-style11 {
            margin-left: 20;
        }
        .req{
            color: red;
        }
        .auto-style12 {
            height: 45px;
        }
        .sty{
            margin-left: 500px;
        }
        .auto-style13 {
            height: 60px;
            width: 251px;
        }
        .auto-style14 {
            width: 251px;
        }
        .auto-style15 {
            height: 36px;
            width: 251px;
        }
        .auto-style16 {
            height: 30px;
            width: 251px;
        }
        .auto-style17 {
            height: 26px;
            width: 251px;
        }
        .auto-style18 {
            height: 45px;
            width: 251px;
        }
    </style>
    <script type="text/javascript">
        /*function Checkit(object sender ,ServerValidateArgs e,) {
            var String name;
            name = $(#uname).GetValue().ToString();
        }*/
    </script>
    <asp:MultiView ID="MultiView1" runat="server">
    <asp:View runat="server" ID="view1">
    <h2 class="text-center">REGISTER</h2>
    <div>
                    <table>
                      <tr>
                          
                          <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                              </td>
                          <td class="auto-style13">
                              <asp:TextBox ID="name" runat="server" OnTextChanged="name_TextChanged"></asp:TextBox>
                              <asp:RequiredFieldValidator runat="server" ControlToValidate="name" ErrorMessage="Can not be empty" CssClass="req"></asp:RequiredFieldValidator>
                          </td>
                          <td class="auto-style9">
                              <asp:Label runat="server" ID="Label8" Text="Username"></asp:Label>
                          </td>
                          <td class="auto-style9">
                              <asp:TextBox ID="uname" runat="server" CssClass="auto-style6"></asp:TextBox>
                              <asp:RequiredFieldValidator CssClass="req" runat="server" ControlToValidate="uname" ErrorMessage="Can not be empty"></asp:RequiredFieldValidator>
                              <asp:CustomValidator CssClass="req" runat="server" ControlToValidate="uname" ErrorMessage="Username has to be more than 6 characters" onservervalidate="Sizecheck" ClientValidationFunction="Checkit" ></asp:CustomValidator>
                          </td>
                          <td class="auto-style9">

                          </td>
                          </tr>
                        <tr>
                           
                            <td>
                                <asp:Label ID="label9" runat="server" Text="Password"></asp:Label>
                            </td>
                            <td class="auto-style14">
                                <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator CssClass="req" runat="server" ControlToValidate="password" ErrorMessage="Can not be empty"></asp:RequiredFieldValidator>
                                <asp:CustomValidator CssClass="req" runat="server" ControlToValidate="password" ErrorMessage="Password doesnt meet criteria" onservervalidate="PassCheck"></asp:CustomValidator>
                            </td>
                            <td class="auto-style4">
                                <asp:Label ID="Label2" runat="server" Text="Gender"></asp:Label>
                                </td>
                                <td class="auto-style10">
                                <asp:DropDownList runat="server" ID="gender" CssClass="auto-style11">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                    <asp:ListItem>Others</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator CssClass="req" runat="server" ControlToValidate="gender" ErrorMessage="Must Chose one"></asp:RequiredFieldValidator>
                                    </td>
                        </tr>
                        <tr>
                           
                            <td class="auto-style5">
                                <asp:Label runat="server" ID="Label3" Text="State"></asp:Label>
                            </td>
                            <td class="auto-style15">
                                <asp:UpdatePanel runat="server" ID="updatecity" UpdateMode="Always">
                                    <ContentTemplate>
                                <asp:DropDownList runat="server" AutoPostBack="true" ID="TextBox2" CssClass="auto-style6" DataSourceID="SqlDataSource1" DataTextField="statename" DataValueField="statename" OnSelectedIndexChanged="TextBox2_SelectedIndexChanged1"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT DISTINCT [statename] FROM [States]"></asp:SqlDataSource>
                                
                            </td>
                            <td>
                                <asp:Label runat="server" ID="Label5" Text="City"></asp:Label>
                            </td>
                            <td>
                                     
                                         <asp:DropDownList runat="server" ID="city" CssClass="auto-style6" DataSourceID="SqlDataSource3" DataTextField="City" DataValueField="City"  ></asp:DropDownList>
                                         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT [City] FROM [Cities] WHERE ([statename] = @statename)">
                                             <SelectParameters>
                                                 <asp:ControlParameter ControlID="TextBox2" Name="statename" PropertyName="SelectedValue" Type="String" />
                                             </SelectParameters>
                                         </asp:SqlDataSource>
                                     </ContentTemplate>
                                     <Triggers>
                                         <asp:AsyncPostBackTrigger ControlID="TextBox2" EventName="SelectedIndexChanged" />
                                     </Triggers>
                                 </asp:UpdatePanel>
                                
                            </td>
                        </tr>
                        <tr>
                           
                            <td class="auto-style7">
                                <asp:Label runat="server" ID="Label4" Text="Address 1"></asp:Label>
                            </td>
                            <td class="auto-style16">
                                
                                <asp:TextBox runat="server" ID="Add1"></asp:TextBox>
                            </td>
                            <td class="auto-style7">
                                <asp:Label runat="server" ID="Label6" Text="Address 2"></asp:Label>
                            </td>
                            <td class="auto-style7">
                                
                               <asp:TextBox runat="server" ID="TextBox1"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            
                            <td class="auto-style8">
                                <asp:Label runat="server" ID="Label7" Text="PIN"></asp:Label>
                            </td>
                            <td class="auto-style17">
                                <asp:TextBox runat="server" ID="pin"></asp:TextBox>
                                <asp:RegularExpressionValidator CssClass="req" runat="server" ControlToValidate="pin" ValidationExpression="^[0-9]{6}$" ErrorMessage="PIN must be a 6 digit number"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="Label12" Text="Mobile Number"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="mobile"></asp:TextBox>
                                <asp:RequiredFieldValidator CssClass="req" runat="server" ControlToValidate="mobile" ErrorMessage="Can not be empty"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator CssClass="req" runat="server" ControlToValidate="mobile" ValidationExpression="^[0-9]{10}" ErrorMessage="Invalid Mobile Number"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style12">
                                <asp:Label runat="server" ID="Label13" Text="Telephone No."></asp:Label>
                            </td>
                            <td class="auto-style18">
                                <asp:TextBox runat="server" ID="telephone"></asp:TextBox>
                            </td>
                                <td class="auto-style12">
                                <asp:Label ID="Label11" runat="server" Text="Email ID"></asp:Label>
                            </td>
                            <td class="auto-style12">
                                <asp:TextBox ID="email" TextMode="Email" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator CssClass="req" runat="server" ControlToValidate="email" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" ErrorMessage="Email ID is Invalid"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator CssClass="req" runat="server" ControlToValidate="email" ErrorMessage="Can not be empty"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                          
                            <td>
                                <asp:Label runat="server" ID="Label15" Text="Date of Birth"></asp:Label>
                            </td>
                            <td class="auto-style14">
                                <asp:TextBox runat="server" ID="dob"></asp:TextBox>
                                <asp:RangeValidator CssClass="req" runat="server" ControlToValidate="dob" Type="Date" MinimumValue="1/1/1905" MaximumValue="31/12/9999" ErrorMessage="Please Enter a Valid Dob"></asp:RangeValidator>
                            </td>
                            <td>
                                <asp:Label runat="server" Text="Profile Photo"></asp:Label>
                            </td>
                            <td>
                                <asp:FileUpload ID="prof" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Choose a Security Question
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID= "security" DataSourceID="ConnectionString1" DataTextField="SecurityQuestion" DataValueField="SecurityQuestion" AppendDataBoundItems="true" OnSelectedIndexChanged="Unnamed14_SelectedIndexChanged">
                                    <asp:ListItem Selected="True" Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="ConnectionString1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" SelectCommand="SELECT DISTINCT [SecurityQuestion] FROM [SecurityQuestionMaster]"></asp:SqlDataSource>
                            </td>
                            <td>

                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                </asp:UpdatePanel>

                            </td>
                        </tr>

                    </table>
                <table>
                    <tr>
                    
                    <td class="text-center">
                    
                        <asp:Button ID="Register" CssClass="sty" runat="server" Text="Register" CausesValidation="true" OnClick="Register_onClick"/>
                    </td>
                        <td></td>
                        </tr>
                </table>
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                </div>
        </asp:View>
        <asp:View runat="server" ID="view2">
            <table>
                <tr>
                    <td>
            <asp:Label runat="server" Text="Enter Verification Code"></asp:Label>
                        </td>
                    <td>
                        <asp:TextBox runat="server" ID="code"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="code" ErrorMessage="Please Enter Verification Code"></asp:RequiredFieldValidator>
                    </td>
                    </tr>
                <tr>
                    <td>
                        <asp:Button runat="server" Text="Verify" ID="verify" OnClick="verify_Click" />
                    </td>
                </tr>
                </table>
            <asp:Label runat="server" ID="lblinfo"></asp:Label>
        </asp:View>
    </asp:MultiView>
</asp:Content>

