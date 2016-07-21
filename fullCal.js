
	$(function() {
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next',
				center: 'title',
				right: 'today'
			},
			weekends: false,
			contentHeight: 450,
			editable: true,
			eventLimit: true, // allow "more" link when too many events

		});
		
	});