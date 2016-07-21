/*
 * jQuery dropdown: A simple dropdown plugin
 *
 * Inspired by Bootstrap: http://twitter.github.com/bootstrap/javascript.html#dropdowns
 *
 * Copyright 2013 Cory LaViska for A Beautiful Site, LLC. (http://abeautifulsite.net/)
 *
 * Dual licensed under the MIT / GPL Version 2 licenses
 *
*/
if(jQuery) (function($) {
	
	$.extend($.fn, {
		dropdown: function(method, data) {
			
			switch( method ) {
				case 'hide':
					hide();
					return $(this);
				case 'attach':
					return $(this).attr('data-dropdown', data);
				case 'detach':
					hide();
					return $(this).removeAttr('data-dropdown');
				case 'disable':
					return $(this).addClass('dropdown-disabled');
				case 'enable':
					hide();
					return $(this).removeClass('dropdown-disabled');
			}
			
		}
	});
	
	function show(event) {
		
		var trigger = $(this),
			dropdown = $(trigger.attr('data-dropdown')),
			isOpen = trigger.hasClass('dropdown-open');
		
		// In some cases we don't want to show it
		if( trigger !== event.target && $(event.target).hasClass('dropdown-ignore') ) return;
		
		event.preventDefault();
		event.stopPropagation();
		hide();
		
		if( isOpen || trigger.hasClass('dropdown-disabled') ) return;
		
		// Show it
		$( ".dropdownli" ).addClass( "active" );
		trigger.addClass('dropdown-open');
		dropdown
			.data('dropdown-trigger', trigger)
			.show();
			
			
		// Position it
		position();
		
		// Trigger the show callback
		dropdown
			.trigger('show', {
				dropdown: dropdown,
				trigger: trigger
			});
		
	}
	
	
	function show1(event) {
		
		var trigger = $(this),
			dropdown1 = $(trigger.attr('data-dropdown1')),
			isOpen = trigger.hasClass('dropdown-open');
		
		// In some cases we don't want to show it
		if( trigger !== event.target && $(event.target).hasClass('dropdown-ignore') ) return;
		
		event.preventDefault();
		event.stopPropagation();
		hide();
		
		if( isOpen || trigger.hasClass('dropdown-disabled') ) return;
		
		// Show it
		trigger.addClass('dropdown-open');
		dropdown1
			.data('dropdown-trigger', trigger)
			.show();
			
			
		// Position it
		position1();
		
		// Trigger the show callback
		dropdown1
			.trigger('show', {
				dropdown1: dropdown1,
				trigger: trigger
			});
		
	}
	
	
	function hide(event) {
		
		// In some cases we don't hide them
		var targetGroup = event ? $(event.target).parents().addBack() : null;
		$( ".dropdownli" ).removeClass( "active" );
		// Are we clicking anywhere in a dropdown?
		if( targetGroup && targetGroup.is('.dropdown') ) {
			// Is it a dropdown menu?
			if( targetGroup.is('.dropdown-menu') ) {
				// Did we click on an option? If so close it.
				if( !targetGroup.is('A') ) return;
			} else {
				// Nope, it's a panel. Leave it open.
				return;
			}
		}
		
		// Hide any dropdown that may be showing
		$(document).find('.dropdown:visible').each( function() {
			var dropdown = $(this);
			dropdown
				.hide()
				.removeData('dropdown-trigger')
				.trigger('hide', { dropdown: dropdown });
		});
		
		$(document).find('.dropdown1:visible').each( function() {
			var dropdown = $(this);
			dropdown
				.hide()
				.removeData('dropdown-trigger')
				.trigger('hide', { dropdown: dropdown });
		});
		
		// Remove all dropdown-open classes
		$(document).find('.dropdown-open').removeClass('dropdown-open');
		
	}
	
	
	
	function hide1(event) {
		
		// In some cases we don't hide them
		var targetGroup = event ? $(event.target).parents().addBack() : null;
		
		// Are we clicking anywhere in a dropdown?
		if( targetGroup && targetGroup.is('.dropdown1') ) {
			// Is it a dropdown menu?
			if( targetGroup.is('.dropdown-menu') ) {
				// Did we click on an option? If so close it.
				if( !targetGroup.is('A') ) return;
			} else {
				// Nope, it's a panel. Leave it open.
				return;
			}
		}
		
		// Hide any dropdown that may be showing
		$(document).find('.dropdown1:visible').each( function() {
			var dropdown1 = $(this);
			dropdown1
				.hide()
				.removeData('dropdown-trigger')
				.trigger('hide', { dropdown1: dropdown1 });
		});
		
		$(document).find('.dropdown1:visible').each( function() {
			var dropdown1 = $(this);
			dropdown1
				.hide()
				.removeData('dropdown-trigger')
				.trigger('hide', { dropdown1: dropdown1 });
		});
		
		// Remove all dropdown-open classes
		$(document).find('.dropdown-open').removeClass('dropdown-open');
		
	}
	
	function position1() {
		
		var dropdown1 = $('.dropdown1:visible').eq(0),
			trigger = dropdown1.data('dropdown-trigger'),
			hOffset = trigger ? parseInt(trigger.attr('data-horizontal-offset') || 0, 10) : null,
			vOffset = trigger ? parseInt(trigger.attr('data-vertical-offset') || 0, 10) : null;
		

		
		if( dropdown1.length === 0 || !trigger ) return;
		
		// Position the dropdown
		dropdown1
			.css({
				left: 0,
				top: 27
			});
			
	
		
	}
	
	function position() {
		
		var dropdown = $('.dropdown:visible').eq(0),
			trigger = dropdown.data('dropdown-trigger'),
			hOffset = trigger ? parseInt(trigger.attr('data-horizontal-offset') || 0, 10) : null,
			vOffset = trigger ? parseInt(trigger.attr('data-vertical-offset') || 0, 10) : null;
		

		
		if( dropdown.length === 0 || !trigger ) return;
		
		// Position the dropdown
		dropdown
			.css({
				left: 0,
				top: 27
			});
			
	
		
	}

	$(document).on('click.dropdown', '[data-dropdown]', show);
	$(document).on('click.dropdown', hide);
	$(document).on('click.dropdown1', '[data-dropdown1]', show1);
	$(document).on('click.dropdown1', hide1);
	$(window).on('resize', position);
	$(window).on('resize', position1);


})(jQuery);