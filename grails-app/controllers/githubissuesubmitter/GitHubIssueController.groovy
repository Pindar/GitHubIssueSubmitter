package githubissuesubmitter

import github.Issue
import grails.converters.JSON
import groovyx.net.http.*
import static groovyx.net.http.ContentType.JSON

class GitHubIssueController {

	String ISSUE_PATH = '/repos/Pindar/GitHubIssueSubmitter/issues'
	HTTPBuilder githubApi
	
    def index() { }

	def createIssue(String title, String message, String username, String password) {
		
		def issue = new Issue(title: title, body: message);
		def authHeaderValue = "Basic " + (username + ":" + password).encodeAsBase64()
		
		githubApi.request(Method.POST) {
			headers.'Authorization' = authHeaderValue
			uri.path = owner.ISSUE_PATH
			requestContentType = ContentType.JSON
			body = issue 
			
			response.success = { resp, json ->
				owner.owner.response.status = resp.statusLine.statusCode
				render json
			}
			
			response.failure = { resp, json ->
				owner.owner.response.status = resp.statusLine.statusCode
				render json
			}
		}

	}
}
