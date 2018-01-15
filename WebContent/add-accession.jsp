<%@ page import="edu.stanford.muse.util.Util" %>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@page language="java" %>
<%@page language="java" %>

<html>
<head>
	<title>Add accession</title>
	<link rel="icon" type="image/png" href="images/epadd-favicon.png">

	<link rel="stylesheet" href="bootstrap/dist/css/bootstrap.min.css">
	<link href="jqueryFileTree/jqueryFileTree.css" rel="stylesheet" type="text/css" media="screen" />

	<jsp:include page="css/css.jsp"/>

	<script src="js/jquery.js"></script>
	<script type="text/javascript" src="bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="jqueryFileTree/jqueryFileTree.js"></script>
	<script src="js/filepicker.js" type="text/javascript"></script>
    <script src="js/muse.js" type="text/javascript"></script>
	<script src="js/epadd.js" type="text/javascript"></script>

	<style>
		.btn-default { height: 37px; }
		label {  font-size: 14px; padding-bottom: 13px; font-weight: 400; color: #404040; } /* taken from form-group label in adv.search.scss */
		.one-line::after {  content:"";  display:block;  clear:both; }  /* clearfix needed, to take care of floats: http://stackoverflow.com/questions/211383/what-methods-of-clearfix-can-i-use */
		.picker-buttons { margin-top:40px; margin-left:-30px; } /* so that the browse button appears at the right edge of the input box */
		.form-group { margin-bottom: 25px;}
	</style>
</head>
<%
    String collectionID= request.getParameter("collectionID");
%>
<body>
    <jsp:include page="header.jspf"/>
    <jsp:include page="div_filepicker.jspf"/>
    <script>epadd.nav_mark_active('Add');</script>

	<section>
        <div class="panel" style="width:900px;margin-left:170px">

            <%
                if(!Util.nullOrEmpty(collectionID)){
            %>
            <div class="one-line">
                <div class="form-group col-sm-12">
                    <label for="collectionID">Collection Directory</label>
                    <input id="collectionID" class="dir form-control" type="text" name="collectionID" value="<%=collectionID%>" readonly/>
                </div>
            </div>
            <%
                }
            %>
            <div id="filepicker" >
                <div class="one-line" id="export-next">
                    <div class="form-group col-sm-10">
                        <label for="accessionFolder"><i class="fa fa-folder-o"></i> Accession folder</label>
                        <input id="accessionFolder" class="dir form-control" type="text" name="accessionFolder" value=""/>
                    </div>
                    <div class="form-group col-sm-2 picker-buttons">
                        <button class="btn-default browse-button">Browse</button>
                    </div>
                </div>
            </div>

            <div class="one-line">
                <div class="form-group col-sm-12">
                    <label for="accessionID">Accession ID</label>
                    <input id="accessionID" class="dir form-control" type="text" name="accessionID" value=""/>
                </div>
            </div>

            <div class="one-line">
                <div class="form-group col-sm-12">
                    <label for="accessionTitle">Accession Title</label>
                    <input id="accessionTitle" class="dir form-control" type="text" name="accessionTitle" value=""/>
                </div>
            </div>

            <div class="one-line">
                <div class="form-group col-sm-12">
                    <label for="accessionDate">Accession Date</label>
                    <input id="accessionDate" class="dir form-control" type="text" name="accessionDate" value=""/>
                </div>
            </div>

            <div class="one-line">
                <div class="form-group col-sm-12">
                    <label for="accessionScope">Scope and Content</label>
                    <textarea id="accessionScope" style="resize:vertical;height:100px;" class="dir form-control" name="accessionScope" value=""></textarea>
                </div>
            </div>

            <div class="one-line">
                <div class="form-group col-sm-12">
                    <label for="accessionRights">Rights and Conditions</label>
                    <textarea id="accessionRights" style="resize:vertical;height:100px;" class="dir form-control" type="text" name="accessionRights" value=""></textarea>
                </div>
            </div>

            <div class="one-line">
                <div class="form-group col-sm-12">
                    <label for="accessionNotes">Notes</label>
                    <textarea id="accessionNotes" style="resize:vertical;height:100px;" class="dir form-control" type="text" name="accessionNotes" value=""></textarea>
                </div>
            </div>
        </div>
        <div style="text-align: center;">
            <div id="spinner-div" style="text-align:center;display:none"><i class="fa fa-spin fa-spinner"></i></div>
            <button class="btn btn-cta" id="gobutton">Import accession <i class="icon-arrowbutton"></i> </button>
        </div>
    </section>
    <br/>

    <script>
        var fp = new FilePicker($('#filepicker'));
    </script>

    <script type="text/javascript">
        $('#gobutton').click(function(e) {
            // this currently just copies the archive into the accession.
            // it has to be extended to do a merge if the collection already exists
            epadd.import_accession(e, muse.collect_input_fields());
            // should not reach here, because load_archive redirect, but just in case...
            return false;
        });
    </script>

	<jsp:include page="footer.jsp"/>

</body>
</html>
