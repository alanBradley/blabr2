// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

#logo {
	font-size: 26px;
	font-weight: 700;
	text-transform: uppercase;
	letter-spacing: -1px;
	padding: 15px 0;
	a {
		color: #2F363E;
	}
}

#main_content {
	#content {
		float: none;
	}
	padding-bottom: 100px;
	.link {
		padding: 2em 1em;
		border-bottom: 1px solid #e9e9e9;
		.title {

			a {
				color: #FF4500;
			}
		}
	}
	.comments_title {
		margin-top: 2em;
	}
	#comments {
		.comment {
			padding: 1em 0;
			border-top: 1px solid #E9E9E9;
			.lead {
				margin-bottom: 0;
			}
		}
	}
}