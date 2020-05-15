<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminMemberManagement.aspx.cs" Inherits="ELibraryManagement.AdminMemberManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Member Details</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img width="100px" src="imgs/generaluser.png"/>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Member ID:</label>   
                                    <div class="input-group">
                                        <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Member ID" runat="server"></asp:TextBox>
                                        <asp:Button ID="Button6" CssClass="btn btn-info" runat="server" Text="GO" OnClick="Button6_Click1"/>
                                    </div>
                                </div>
                            </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Full Name:</label>
                                        <asp:TextBox ID="TextBox7" CssClass="form-control" placeholder="Full Name" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label>Account status:</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="TextBox2" CssClass="form-control mr-1" placeholder="Status" runat="server"></asp:TextBox>
                                        <asp:LinkButton ID="LinkButton1" CssClass="btn btn-success mr-1" runat="server" OnClick="LinkButton1_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton2" CssClass="btn btn-warning mr-1" runat="server" OnClick="LinkButton2_Click"><i class="fas fa-pause-circle"></i></asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton3" CssClass="btn btn-danger mr-1" runat="server" OnClick="LinkButton3_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>DOB:</label>
                                    <asp:TextBox ID="TextBox3" CssClass="form-control" placeholder="Date of Birth" runat="server" ReadOnly="True" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Contact NO:</label>
                                        <asp:TextBox ID="TextBox4" CssClass="form-control" placeholder="Contact No" runat="server" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                    </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label>Email ID:</label>
                                    <asp:TextBox ID="TextBox8" CssClass="form-control" placeholder="Email  ID" runat="server" TextMode="Email" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>

                            </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>State:</label>
                                    <asp:TextBox ID="TextBox9" CssClass="form-control" placeholder="State" runat="server" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>City:</label>
                                    <asp:TextBox ID="TextBox10" CssClass="form-control" placeholder="City" runat="server" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Pin Code:</label>
                                    <asp:TextBox ID="TextBox11" CssClass="form-control" placeholder="Pin Code" runat="server" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            
                            
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <label>Full Address:</label>
                                    <asp:TextBox ID="TextBox5" CssClass="form-control" placeholder="Address" runat="server" TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger btn-block btn-lg" Text="Delete User Permanentaly" OnClick="Button2_Click" />
                                <div class="form-group">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="HomePage.aspx"><< Back to Home</a><br />
                <br />
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Member List</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>
                        <div class="row">
                            <div class="col">
                                <asp:GridView ID="gridview" CssClass="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="ID" ReadOnly="True" SortExpression="member_id" />
                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="account_status" HeaderText="Account Status" SortExpression="account_status" />
                                        <asp:BoundField DataField="contact_no" HeaderText="Contact No" SortExpression="contact_no" />
                                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                        <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
