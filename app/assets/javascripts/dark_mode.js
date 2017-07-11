
function turn_on_dark_mode(){
  $('.section:not(.section-notifications):not(.section-tabs):not(.section-download):not(.section-examples)').each(function(){
    $(this).fadeOut('fast',function(){
      $(this).attr('data-background-color','black');
      $(this).fadeIn('fast');
    });
  });

  $('.card, .modal-content, footer').each(function(){
    $(this).fadeOut('fast',function(){
      $(this).attr('data-background-color','black-hr2');
      $(this).fadeIn('fast');
    });
  });

  $('pre').each(function(){
    $(this).attr('data-background-color','black');
  });


  $('.header').each(function(){
    $(this).fadeOut('fast',function(){
      $(this).addClass('make_it_dark');
      $(this).fadeIn('fast');
    });
  });

  switch_black = $('.navbar .collapse .navbar-nav .nav-link.dark_light_switcher p.hidden');
  switch_white = $('.navbar .collapse .navbar-nav .nav-link.dark_light_switcher p.visible');
  switch_white.removeClass('visible').addClass('hidden');
  switch_black.removeClass('hidden').addClass('visible');

  $('.section.section-navbars > .container .navbar.bg-primary, .section.section-navbars > .container .navbar.bg-info').each(function(){
    $(this).addClass('bg-white');
  });

  $('.btn-primary,.btn-default,.btn-link').each(function(){
    $(this).addClass('btn-neutral');
  });

  $('button[data-toggle="popover"], button[data-toggle="tooltip"]').each(function(){
    $(this).removeClass('btn-default');
    $(this).addClass('btn-neutral');
  });

  $('.nav.nav-pills').each(function(){
    $(this).addClass('nav-pills-neutral');

    if($('.nav.nav-pills.nav-pills-primary').length != 0){
      $(this).removeClass('nav-pills-primary');
    }
  });

  $('.pagination').each(function(){
    $(this).addClass('pagination-neutral');
  });

  $('.progress-container').each(function(){
    $(this).addClass('progress-neutral');

    if($('.progress-container.progress-neutral').length != 0){
      $(this).removeClass('progress-primary');
    }
  });

  $('.badge').each(function(){
    $(this).addClass('badge-neutral');
  });

  $('.slider').each(function(){
    $(this).addClass('slider-neutral');

    if($('.slider.slider-neutral').length != 0){
      $(this).removeClass('slider-primary')
           .removeClass('slider-default');
    }
  });

  $('.blockquote').each(function(){
    $(this).addClass('blockquote-white');

    if($('.blockuote.blockquote-white').length != 0){
      $(this).removeClass('blockquote-primary');
    }
  });

  backgroundBlack = true;
}

function turn_off_dark_mode(){

  $('.section:not(.section-notifications):not(.section-tabs):not(.section-download):not(.section-examples)').each(function(){
    $(this).fadeOut('fast',function(){
      $(this).removeAttr('data-background-color','black');
      $(this).fadeIn('fast');
    });
  });

  $('.card').each(function(){
    $(this).fadeOut('fast',function(){
      $(this).removeAttr('data-background-color','black-hr2');
      $(this).fadeIn('fast');
    });
  });

  $('pre').each(function(){
    $(this).removeAttr('data-background-color','black');
  });

  $('.header').each(function(){
    $(this).fadeOut('fast',function(){
      $(this).removeClass('make_it_dark');
      $(this).fadeIn('fast');
    });
  });

  switch_white.removeClass('hidden').addClass('visible');
  switch_black.removeClass('visible').addClass('hidden');

  $('.btn-primary,.btn-default,.btn-link').each(function(){
    $(this).removeClass('btn-neutral');
  });

  $('.section.section-navbars > .container .navbar.bg-primary, .section.section-navbars > .container .navbar.bg-info').each(function(){
    $(this).removeClass('bg-white');
  });

  $('button[data-toggle="popover"], button[data-toggle="tooltip"]').each(function(){
    $(this).removeClass('btn-neutral');
    $(this).addClass('btn-default');
  });

  $('.nav.nav-pills').each(function(){
    $(this).removeClass('nav-pills-neutral');

    if($('.nav.nav-pills.nav-pills-neutral').length == 0){
      $(this).addClass('nav-pills-primary');
    }
  });

  $('.pagination').each(function(){
    $(this).removeClass('pagination-neutral');
  });

  $('.progress-container').each(function(){
    $(this).removeClass('progress-neutral');

    if($('.progress-container.progress-neutral').length == 0){
      $(this).addClass('progress-primary');
    }
  });

  $('.badge').each(function(){
    $(this).removeClass('badge-neutral');
  });

  $('.slider').each(function(){
    $(this).removeClass('slider-neutral');

    if($('.slider.slider-neutral').length == 0){
      $(this).addClass('slider-primary');
    }
  });

  $('.blockquote').each(function(){
    $(this).removeClass('blockquote-white');

    if($('.blockuote.blockquote-white').length == 0){
      $(this).addClass('blockquote-primary');
    }
  });

  backgroundBlack = false;
}

$(document).ready(function(){

  // Activate bootstrapSwitch
  $('.bootstrap-switch').each(function(){
    $this = $(this);
    data_on_label = $this.data('on-label') || '';
    data_off_label = $this.data('off-label') || '';

    $this.bootstrapSwitch({
      onText: data_on_label,
      offText: data_off_label
    });
  });

  // turn on dark mode if it was stored
  if ($.cookie("dark_mode") == 'true'){
    $('.bootstrap-switch').click();
    turn_on_dark_mode();
  }

  // turn on/off dark mode and store value
  $('.switch.switch-background input').on("switchChange.bootstrapSwitch",function(){
    $input = $(this);
    if(!$input.is(':checked')){
      $.cookie("dark_mode", true);
      turn_on_dark_mode();
    } else {
      $.removeCookie("dark_mode");
      turn_off_dark_mode();
    }
  });

});