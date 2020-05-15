<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="ELibraryManagement.UserProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container-fluid">
        <div class="row">
            <div class="col-md-5 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/generaluser.png"/>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Your Profile</h4>
                                    <span>Account Status -</span>
                                    <span class="badge badge-pill badge-success"><asp:Label runat="server" ID="Lable1" Text="Active"></asp:Label></span>
                                    
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Full Name:</label>
                                    <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="Full Name" runat="server" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Date Of Birth:</label>
                                    <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="dd-mm-yyyy" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Contact Number:</label>
                                    <asp:TextBox ID="TextBox3" CssClass="form-control" placeholder="EX: 123456790 " runat="server" TextMode="Phone"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Email ID:</label>
                                    <asp:TextBox ID="TextBox4" CssClass="form-control" placeholder="abc@gmail.com" runat="server" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>State</label>
                                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="Select" Value="select"/>
                                        <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh"/>
                                        <asp:ListItem Text="Arunachal Pradesh" Value="Arunachal Pradesh"/>
                                        <asp:ListItem Text="Assam" Value="Assam"/>
                                        <asp:ListItem Text="Bihar" Value="Bihar"/>
                                        <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh"/>
                                        <asp:ListItem Text="Rajasthan" Value="Rajasthan"/>
                                        <asp:ListItem Text="Goa" Value="Goa"/>
                                        <asp:ListItem Text="Gujarat" Value="Gujarat"/>
                                        <asp:ListItem Text="Haryana" Value="Haryana"/>
                                        <asp:ListItem Text="Himachal Pradesh" Value="Himachal Pradesh"/>
                                        <asp:ListItem Text="Jammu and Kashmir" Value="Jammu and Kashmir"/>
                                        <asp:ListItem Text="Jharkhand" Value="Jharkhand"/>
                                        <asp:ListItem Text="Karnataka" Value="Karnataka"/>
                                        <asp:ListItem Text="Kerala" Value="Kerala"/>
                                        <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh"/>
                                        <asp:ListItem Text="Maharashtra" Value="Maharashtra"/>
                                        <asp:ListItem Text="Manipur" Value="Manipur"/>
                                        <asp:ListItem Text="Meghalaya" Value="Meghalaya"/>
                                        <asp:ListItem Text="Mizoram" Value="Mizoram"/>
                                        <asp:ListItem Text="Nagaland" Value="Nagaland"/>
                                        <asp:ListItem Text="Odisha" Value="Odisha"/>
                                        <asp:ListItem Text="Punjab" Value="Punjab"/>
                                        <asp:ListItem Text="Rajasthan" Value="Rajasthan"/>
                                        <asp:ListItem Text="Sikkim" Value="Sikkim"/>
                                        <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu"/>
                                        <asp:ListItem Text="Telangana" Value="Telangana"/>
                                        <asp:ListItem Text="Tripura" Value="Tripura"/>
                                        <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh"/>
                                        <asp:ListItem Text="Uttarakhand" Value="Uttarakhand"/>
                                        <asp:ListItem Text="West Bengal" Value="West Bengal"/>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>City:</label>
                                    <asp:TextBox ID="TextBox5" CssClass="form-control" placeholder="city" runat="server" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Pin Code:</label>
                                    <asp:TextBox ID="TextBox6" CssClass="form-control" placeholder="pincode" runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label>Address:</label>
                                    <asp:TextBox ID="TextBox7" CssClass="form-control" placeholder="EX: 123456790 " runat="server" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <center>
                            <span class="badge badge-pill badge-primary">Login Credential</span><br/><br/>
                            </center>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>User ID:</label>
                                <asp:TextBox ID="TextBox8" CssClass="form-control" placeholder="Login ID " runat="server" TextMode="SingleLine"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Old Password:</label>
                                <asp:TextBox ID="TextBox9" CssClass="form-control" placeholder="old password" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>New Password:</label>
                                <asp:TextBox ID="TextBox10" CssClass="form-control" placeholder="new password" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8 mx-auto">
                            <div class="form-group">
                                <asp:Button ID="Button1" CssClass="btn btn-success btn-block btn-lg" runat="server" Text="Update" />
                            </div>
                        </div>
                    </div>
                </div>
                <a href="HomePage.aspx"><< Back to Home</a><br/><br/>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/books1.png"/>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Your Issued Books</h4>
                                    <span class="badge badge-pill badge-primary"><asp:Label runat="server" ID="Label1" Text="Your book info"></asp:Label></span>
                                    
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:GridView ID="gridview" CssClass="table table-striped table-bordered" runat="server"></asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
