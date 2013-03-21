<html>
   <head>
      <meta name="layout" content="main"/>
      <r:require modules="bootstrap"/>
      <r:require modules="jquery"/>
      <r:require modules="form"/>
   </head>
<body>
<h1>Lorem ipsum ...</h1>

<a href="#createIssue" role="button" class="btn" data-toggle="modal">Do you have some trouble with this application?</a>

<div id="createIssue" class="modal hide fade">
  <form id="createIssueForm" method="POST" action="createIssue" class="form-horizontal">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	    <h3>Create an Issue</h3>
	  </div>
	  <div class="modal-body">
	    <div class="control-group">
		    <label class="control-label" for="title">Title</label>
		    <div class="controls">
			    <input type="text" name="title" id="title" placeholder="Title...">
		    </div>
	    </div>
	    
	    <div class="control-group">
		    <label class="control-label" for="message">Message</label>
		    <div class="controls">
			    <textarea rows="15" cols="50" name="message" id="message" placeholder="Message..."></textarea>
		    </div>		    
	    </div>
	    
	    <div class="control-group">
	    	<label class="control-label" for="username">GitHub username</label>
	    	<div class="controls">
	    		<input type="text" name="username">
	    	</div>
	    </div>
	    
	    <div class="control-group">
	    	<label class="control-label" for="password">GitHub password</label>
	    	<div class="controls">
		    	<input type="password" name="password" id="password">
	    	</div>
	    </div>
	    
	  </div>
	  <div class="modal-footer">
	    <a href="#" class="btn" data-toggle="modal" data-target="#createIssue">Cancel</a>
	    <input type="submit" class="btn btn-primary td-s-create" value="Create">
	  </div>
 </form>
</div>

<r:script disposition="defer">

$(function () {
	$('#createIssueForm').ajaxForm({
		success:function () {
			$('#createIssueForm').clearForm();
			alert("Thank you for your request!");
			$('#createIssue').modal('hide');
		},
		error: function () {
			alert("An error occurred");			
		} 
	});
	
	$('#createIssue').on('shown', function () {
		$('input:first').focus();
	});
});

</r:script>

</body>
</html>