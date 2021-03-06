﻿<%@ Page Title="Member Home" Language="C#" MasterPageFile="~/member/member.Master" AutoEventWireup="true" CodeBehind="member-home.aspx.cs" Inherits="webEducationTree.member.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentNavbar" runat="server">
    <li class="active"><a href="member-home.aspx"><span class="glyphicon glyphicon-home"></span>Home</a></li>
    <li class="dropdown "><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
        aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-cog"></span>Hi!!
        <span id="member_name" runat="server">Admin</span>
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="member-profile.aspx"><span class="glyphicon glyphicon-user"></span>Profile</a></li>
            <li><a href="../logout.aspx"><span class="glyphicon glyphicon-off"></span>Sign out</a></li>
        </ul>
    </li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">
    <div style="padding: 10px;"></div>
    <div id="error" runat="server" class="alert alert-danger alert-dismissable">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Error!</strong> <span id="error_message" runat="server">College name deleted successfully.</span>
    </div>
    <div id="success" runat="server" class="alert alert-success alert-dismissable">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Success</strong><span id="success_message" runat="server">College name deleted successfully.</span>
    </div>
    <form id="SearchDetails" runat="server">
        <div class="col-md-4">
            <div class="panel panel-primary">
                <div class="panel-heading" style="text-align: center; font-size: 25px;">
                    Search Details

                </div>
                <div class="panel-body">

                    <div class="form-group">
                        <label for="email">School / College Type :</label>
                        <asp:DropDownList ID="drdCollegeType" class="form-control " runat="server" ValidationGroup="AddSchool" AutoPostBack="True" OnSelectedIndexChanged="drdCollegeType_SelectedIndexChanged">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>S.S.C.</asp:ListItem>
                            <asp:ListItem>H.S.C.</asp:ListItem>
                            <asp:ListItem>Diploma</asp:ListItem>
                            <asp:ListItem>U.G.</asp:ListItem>
                            <asp:ListItem>P.G.</asp:ListItem>
                            <asp:ListItem>Doctorate</asp:ListItem>
                        </asp:DropDownList>

                    </div>
                    <div class="form-group">
                        <label for="pwd">College Name :</label>
                        <asp:DropDownList ID="drdCollegeName" class="form-control " runat="server" ValidationGroup="AddSchool"></asp:DropDownList>

                    </div>
                    <div class="form-group">
                        <label for="pwd">Passing Year :</label>
                        <asp:TextBox ID="txtYearPassing" class="form-control " runat="server" ValidationGroup="AddSchool"></asp:TextBox>

                    </div>
                    <asp:Button ID="btnSearch" class="btn btn-default" runat="server" Text="Search" OnClick="btnSearch_Click" />
                </div>
            </div>
        </div>

        <div class="panel panel-primary col-md-offset-4">
            <div class="panel-heading" style="text-align: center; font-size: 25px;">
                Search Result

            </div>
            <div class="panel-body">
                <asp:DataList ID="dataGeneral" runat="server" class="col-md-12" OnItemCommand="dataGeneral_ItemCommand">
                    <ItemTemplate>
                        <table class="table table-bordered ">
                            <tr>
                                <th class="col-md-4">Member Name :</th>
                                <td><%# Eval("member_name") %></td>
                            </tr>

                            <tr>
                                <th class="col-md-4">Email :</th>
                                <td><%# Eval("member_email") %></td>
                            </tr>
                            <tr>
                                <th class="col-md-4">Mobile :</th>
                                <td><%# Eval("member_mobile") %></td>
                            </tr>
                            <tr>
                                <th class="col-md-4">Education :</th>
                                <td><%# Eval("education_type") %></td>
                            </tr>

                            <tr>
                                <td colspan="2">
                                    <asp:Button ID="Button1" CommandName="view" CommandArgument='<%# Eval("member_id") %>' runat="server" Text="View" CssClass="btn btn-info" /></td>
                            </tr>
                        </table>
                        <br />
                    </ItemTemplate>
                </asp:DataList>


            </div>
        </div>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScripts" runat="server">
</asp:Content>
