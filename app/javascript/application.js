import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('turbo:load', function() {
    $('.dropdown-toggle').on('click', function(event) {
        event.preventDefault();

        const dropdownMenu = $(this).next('.dropdown-menu');

        if (dropdownMenu.is(':visible')) {
            dropdownMenu.animate({
                height: '0',
                opacity: '0'
            }, 100, function() {
                dropdownMenu.css('display', 'none');
            });
        } else {
            $('.dropdown-menu').each(function() {
                if ($(this).is(':visible')) {
                    $(this).animate({
                        height: '0',
                        opacity: '0'
                    }, 100, function() {
                        $(this).css('display', 'none');
                    });
                }
            });

            dropdownMenu.css({
                display: 'block',
                height: 'auto',
                opacity: '1'
            });

            const fullHeight = dropdownMenu.prop('scrollHeight');
            dropdownMenu.css('height', '0');
            dropdownMenu.animate({
                height: fullHeight,
                opacity: '1'
            }, 100);
        }
    });

    $(document).on('click', function(event) {
        if (!$(event.target).closest('.dropdown').length) {
            $('.dropdown-menu').animate({
                height: '0',
                opacity: '0'
            }, 100, function() {
                $(this).css('display', 'none'); 
            });
        }
    });
});
