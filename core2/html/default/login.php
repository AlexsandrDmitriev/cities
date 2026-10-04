<div class="login-form">
    <!-- BEGIN logo -->
    {logo}
    <!-- END logo -->

    <h2>{system_name}</h2>

    <!-- BEGIN danger -->
    <div class="alert alert-danger">{danger}</div>
    <!-- END danger -->

    <form method="POST" action="index.php" id="loginForm">
        <div class="mb-3">
            <label class="form-label" for="login">Логин</label>
            <input class="form-control" type="text" id="login" name="login" required />
        </div>
        <div class="mb-3">
            <label class="form-label" for="password">Пароль</label>
            <input class="form-control" type="password" id="password" name="password" required />
        </div>
        <button type="submit" class="btn btn-primary w-100">Войти</button>
    </form>

    <script>
    document.getElementById('loginForm').addEventListener('submit', function(e) {
        e.preventDefault();
        var form = e.target;

        fetch(form.action, {
            method: 'POST',
            body: new FormData(form)
        })
        .then(function(r) { return r.json(); })
        .then(function(data) {
            if (data.status === 'success') {
                window.location.href = data.return_url || 'index.php?module=cities';
            } else {
                alert(data.error_message || 'Ошибка входа');
            }
        })
        .catch(function(err) { alert('Ошибка: ' + err.message); });
    });
    </script>

    <!-- BEGIN social -->
    <div class="social-auth">
        <!-- BEGIN social_item -->
        <a href="index.php?module=oauth&action=connect&provider={provider}" class="btn btn-outline-secondary">
            {provider_title}
        </a>
        <!-- END social_item -->
    </div>
    <!-- END social -->

    <!-- BEGIN ext_actions -->
    <div class="ext-actions">
        <!-- BEGIN registration -->
        <a href="index.php?module=auth&action=reg">Регистрация</a>
        <!-- END registration -->
        <!-- BEGIN restore -->
        <a href="index.php?module=auth&action=restore">Забыли пароль?</a>
        <!-- END restore -->
    </div>
    <!-- END ext_actions -->
</div>
