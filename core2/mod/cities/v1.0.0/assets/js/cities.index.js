/* Cities Module JavaScript */
document.addEventListener('DOMContentLoaded', function() {

    // Initialize DataTable for cities list (only on index page)
    var citiesTable = null;
    if ($('#citiesTable').length) {
        citiesTable = $('#citiesTable').DataTable({
            ajax: {
                url: 'index.php?module=cities&action=listData',
                dataSrc: function(json) {
                    return json.data || json;
                }
            },
            columns: [
                {
                    data: null,
                    orderable: false,
                    searchable: false,
                    render: function(data, type, row, meta) {
                        return meta.row + meta.settings._iDisplayStart + 1;
                    }
                },
                { data: 'name', type: 'string' },
                { data: 'country', type: 'string' },
                { data: 'population', type: 'num' },
                {
                    data: null,
                    orderable: false,
                    searchable: false,
                    className: 'dt-not-orderable',
                    render: function(data, type, row) {
                        return '<a href="index.php?module=cities&action=edit&id=' + data.id + '" class="btn btn-sm btn-primary">Редактировать</a> ' +
                               '<a href="javascript:void(0)" class="btn btn-sm btn-danger delete-city" data-id="' + data.id + '">Удалить</a>';
                    }
                }
            ],
            lengthMenu: [[10, 25, 50, 100], [10, 25, 50, 100]],
            pageLength: 10,
            order: [[1, 'asc']],
            language: {
                search: "",
                searchPlaceholder: "Поиск...",
                lengthMenu: "Показать _MENU_ записей",
                info: "Показано с _START_ по _END_ из _TOTAL_ записей",
                infoEmpty: "Нет записей для отображения",
                infoFiltered: "(отфильтровано из _MAX_ записей)",
                loadingRecords: "Загрузка...",
                processing: "Обработка...",
                zeroRecords: "Записи не найдены",
                paginate: {
                    first: "В начало",
                    last: "В конец",
                    next: "Вперёд",
                    previous: "Назад"
                }
            },
            drawCallback: function() {
                var info = this.api().page.info();
                var paginate = $(this).closest('.dataTables_wrapper').find('.dataTables_paginate');
                paginate.toggle(info.pages > 1);
            },
            initComplete: function() {
                $('#citiesTable_filter input').attr('id', 'citiesTable_search');
            }
        });
    }

    // Handle city deletion (only when DataTable exists)
    $(document).on('click', '.delete-city', function() {
        var id = $(this).data('id');
        if (confirm('Вы уверены, что хотите удалить этот город?')) {
            $.ajax({
                url: 'index.php?module=cities&action=delete',
                method: 'POST',
                data: { id: id },
                dataType: 'json',
                success: function(response) {
                    if (response.success) {
                        if (citiesTable) citiesTable.ajax.reload();
                    } else {
                        alert('Ошибка при удалении: ' + (response.error || 'Неизвестная ошибка'));
                    }
                },
                error: function() {
                    alert('Ошибка при удалении: сервер не ответил');
                }
            });
        }
    });

    // Handle form submission (add/edit)
    $(document).on('submit', '.city-form', function(e) {
        e.preventDefault();
        var form = $(this);
        var id = form.find('input[name="id"]').val();
        var url = id ? 'index.php?module=cities&action=update' : 'index.php?module=cities&action=add';

        $.ajax({
            url: url,
            method: 'POST',
            data: form.serialize(),
            dataType: 'json',
            success: function(response) {
                if (response.success) {
                    window.location.href = 'index.php?module=cities&action=index';
                } else {
                    alert('Ошибка: ' + (response.error || 'Неизвестная ошибка'));
                }
            },
            error: function() {
                alert('Ошибка: сервер не ответил');
            }
        });
    });

    // Form validation: enable submit button only when required fields are filled
    var submitBtn = $('form.city-form button[type="submit"]');
    var nameInput = $('form.city-form input[name="name"]');
    var populationInput = $('form.city-form input[name="population"]');

    if (submitBtn.length) {
        submitBtn.prop('disabled', true);
    }

    function validateForm() {
        if (submitBtn.length) {
            var nameValid = nameInput.val().trim().length > 0;
            var popValid = parseInt(populationInput.val() || 0) > 0;
            submitBtn.prop('disabled', !(nameValid && popValid));
        }
    }

    if (nameInput.length) {
        nameInput.on('input', validateForm);
    }
    if (populationInput.length) {
        populationInput.on('input', validateForm);
    }
});
