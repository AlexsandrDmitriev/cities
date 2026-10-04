<?php

require_once __DIR__ . '/../../../inc/classes/Common.php';

class ModCitiesController extends Common
{

    protected $module = 'cities';
    protected $path = 'core2/mod/';

    public function __construct()
    {
        parent::__construct();
    }

    public function action_index()
    {
        $this->setupSkin();

        $this->dataCities->getAll();
        $js_loc = $this->getModuleLoc('cities');

        ob_start();
        ?>
        <!DOCTYPE html>
        <html lang="ru">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Справочник городов</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css" rel="stylesheet">
            <style>
                table.dataTable th.dt-not-orderable {
                    cursor: default;
                    background-image: none !important;
                }
                #citiesTable_filter label {
                    display: block;
                    width: 100%;
                }
            </style>
        </head>
        <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 d-flex justify-content-between align-items-center mt-3 mb-2">
                    <h2 class="mb-0">Справочник городов</h2>
                    <a href="index.php?module=cities&action=logout" class="btn btn-outline-danger">Выйти</a>
                </div>
            </div>
        </div>
        <div class="container mt-4">
            <?= \Core2\Alert::get() ?>
            <table id="citiesTable" class="table table-striped">
                <thead><tr>
                    <th>ID</th>
                    <th>Название</th>
                    <th>Страна</th>
                    <th>Население</th>
                    <th>Действия</th>
                </tr></thead>
                <tbody></tbody>
            </table>
            <a href="index.php?module=cities&action=add" class="btn btn-primary mb-3">Добавить город</a>
        </div>
        <script src="js/jquery/lib/jquery-1.12.4.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
        <script src="js/bootstrap.modal.min.js"></script>
        <script src="<?= DOC_PATH . $js_loc ?>/assets/js/cities.index.js"></script>
        </body>
        </html>
        <?php
        return ob_get_clean();
    }

    public function action_add()
    {
        $this->setupSkin();

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            header('Content-Type: application/json');
            $name    = $this->getInput('name');
            $country = $this->getInput('country');
            $population = $this->getInput('population');

            if (empty($name)) {
                return json_encode(['error' => 'Введите название города']);
            }

            if (empty($population) || (int)$population <= 0) {
                return json_encode(['error' => 'Население должно быть больше 0']);
            }

            $this->dataCities->insert([
                'name'        => $name,
                'country'     => $country ?? 'Беларусь',
                'population'  => (int)$population,
                'is_active_sw' => 'Y',
            ]);

            return json_encode(['success' => true]);
        }

        $js_loc = $this->getModuleLoc('cities');

        ob_start();
        ?>
        <!DOCTYPE html>
        <html lang="ru">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Добавить город</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        </head>
        <body>
        <div class="container mt-4">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h2>Добавить город</h2>
                <a href="index.php?module=cities&action=logout" class="btn btn-outline-danger">Выйти</a>
            </div>
            <form method="post" class="city-form">
                <div class="form-group">
                    <label>Название города</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Страна</label>
                    <input type="text" name="country" class="form-control" value="Беларусь">
                </div>
                <div class="form-group">
                    <label>Население</label>
                    <input type="number" name="population" class="form-control" min="1" value="0">
                </div>
                <button type="submit" id="submitBtn" class="btn btn-primary" disabled>Добавить</button>
                <a href="index.php?module=cities&action=index" class="btn btn-secondary">Назад</a>
            </form>
        </div>
        <script src="js/jquery/lib/jquery-1.12.4.min.js"></script>
        <script src="js/bootstrap.modal.min.js"></script>
        <script src="<?= DOC_PATH . $js_loc ?>/assets/js/cities.index.js"></script>
        </body>
        </html>
        <?php
        return ob_get_clean();
    }

    public function action_edit()
    {
        $id = (int) $this->getInput('id');

        if (empty($id)) {
            \Core2\Alert::memory()->danger('ID города не указан', 'Ошибка');
            return $this->action_index();
        }

        $city = $this->dataCities->find($id)->current();

        if (empty($city)) {
            \Core2\Alert::memory()->danger('Город не найден', 'Ошибка');
            return $this->action_index();
        }

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            header('Content-Type: application/json');
            $name    = $this->getInput('name');
            $country = $this->getInput('country');
            $population = $this->getInput('population');

            if (empty($name)) {
                return json_encode(['error' => 'Введите название города']);
            }

            if (empty($population) || (int)$population <= 0) {
                return json_encode(['error' => 'Население должно быть больше 0']);
            }

            $this->dataCities->updateCity($id, [
                'name'        => $name,
                'country'     => $country ?? 'Беларусь',
                'population'  => (int)$population,
            ]);

            return json_encode(['success' => true]);
        }

        $this->setupSkin();
        $js_loc = $this->getModuleLoc('cities');

        ob_start();
        ?>
        <!DOCTYPE html>
        <html lang="ru">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Редактировать город</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        </head>
        <body>
        <div class="container mt-4">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h2>Редактировать город</h2>
                <a href="index.php?module=cities&action=logout" class="btn btn-outline-danger">Выйти</a>
            </div>
            <form method="post" class="city-form">
                <input type="hidden" name="id" value="<?= $city->id ?>">
                <div class="form-group">
                    <label>Название города</label>
                    <input type="text" name="name" class="form-control" value="<?= $city->name ?>" required>
                </div>
                <div class="form-group">
                    <label>Страна</label>
                    <input type="text" name="country" class="form-control" value="<?= $city->country ?>">
                </div>
                <div class="form-group">
                    <label>Население</label>
                    <input type="number" name="population" class="form-control" min="1" value="<?= $city->population ?>">
                </div>
                <button type="submit" id="submitBtn" class="btn btn-primary" disabled>Сохранить</button>
                <a href="index.php?module=cities&action=index" class="btn btn-secondary">Назад</a>
            </form>
        </div>
        <script src="js/jquery/lib/jquery-1.12.4.min.js"></script>
        <script src="js/bootstrap.modal.min.js"></script>
        <script src="<?= DOC_PATH . $js_loc ?>/assets/js/cities.index.js"></script>
        </body>
        </html>
        <?php
        return ob_get_clean();
    }

    public function action_logout()
    {
        $this->closeSession();
        header('Location: index.php');
        return '';
    }

    public function action_listData()
    {
        header('Content-Type: application/json');
        $cities = $this->dataCities->getAll();
        $data = [];

        foreach ($cities as $city) {
            $data[] = [
                'id' => (int)$city->id,
                'name' => $city->name,
                'country' => $city->country,
                'population' => (int)$city->population,
            ];
        }

        return json_encode(['data' => $data]);
    }

    public function action_delete()
    {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            throw new Exception('Некорректный метод запроса');
        }

        header('Content-Type: application/json');
        $id = (int) $this->getInput('id');

        if (empty($id)) {
            return json_encode(['error' => 'ID не указан']);
        }

        $this->dataCities->deleteCity($id);

        return json_encode(['success' => true]);
    }

    public function action_update()
    {
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            throw new Exception('Некорректный метод запроса');
        }

        header('Content-Type: application/json');
        $id = (int) $this->getInput('id');

        if (empty($id)) {
            return json_encode(['error' => 'ID не указан']);
        }

        $name    = $this->getInput('name');
        $country = $this->getInput('country');
        $population = $this->getInput('population');

        if (empty($name)) {
            return json_encode(['error' => 'Введите название города']);
        }

        if (empty($population) || (int)$population <= 0) {
            return json_encode(['error' => 'Население должно быть больше 0']);
        }

        $this->dataCities->updateCity($id, [
            'name'        => $name,
            'country'     => $country ?? 'Беларусь',
            'population'  => (int)$population,
        ]);

        return json_encode(['success' => true]);
    }
}