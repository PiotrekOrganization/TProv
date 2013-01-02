// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
//= require tinymce

$(document).ready( function() {
	$('.timer-countdown').coundownTimer()
})


$.fn.coundownTimer = function() 
{
	var timer = $(this[0])
	var time = parseInt(timer.html())
	makeTime()

	setInterval(function() 
	{
		time -= 1
	    makeTime()
  	}, 1000);

	function makeTime()
	{

		if( time > (3600 * 24))
		{
			return printTime('powyżej 24 h')
		}

		parsed = new Date(time*1000)

		hours = parsed.getUTCHours()
		if( hours > 0)
		{
			return printTime(hours + ' h')
		}

		minutes = parsed.getUTCMinutes()
		if( minutes > 0)
		{
			return printTime(minutes + ' min')

		}

		seconds = parsed.getUTCSeconds()
		if( seconds > 0 ) 
		{
			return printTime(hours + ' min')
		}
		
		return printTime('czas minął')

	}

	function printTime(time)
	{
		$(timer).html(time)
	}

}