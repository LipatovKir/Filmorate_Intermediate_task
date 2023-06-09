# Filmorate_Intermediate_task
Промежуточное задание для взаимопроверки

# Ссылка в редакторе: https://dbdiagram.io/d/645aabc8dca9fb07c4ca8194 


![Filmorate](https://github.com/LipatovKir/Filmorate_Intermediate_task/assets/119127334/2aae54dc-09d3-4ce4-9810-662094224d93)

# Примеры запросов:
Получение списка фильмов 
SELECT *
FROM films;

Удаление фильма по id
DELETE 
FROM films 
WHERE film_id = 1;

Получение фильма по id
SELECT *
FROM films
WHERE film_id = 1;

Получение списка 10-ти лучших фильмов
SELECT *
FROM films
WHERE film_id IN
    (SELECT film_id
     FROM likes
     GROUP BY film_id
     ORDER BY COUNT(user_id) DESC
     LIMIT 10);

Получение списка пользователей
SELECT *
FROM users;

Удаление пользователя по id
DELETE 
FROM users
WHERE user_id = 1;

Получение пользователя по id
SELECT *
FROM users
WHERE user_id = 1;

Получение списка друзей для пользователя с id 1
SELECT *
FROM users
WHERE user_id IN
    (SELECT friend_id
     FROM friendship
     WHERE user_id = 1
       AND status = '1'
     UNION SELECT user_id
     FROM friendship
     WHERE friend_id = 1);
     
# Описание БД
Таблица users содержит данные об идентификаторе пользователя, его электронной почте, логине, имени и дате рождения.
Таблица films содержит идентификатор фильма, название и описание фильма, дата выхода, длительность и рейтинг Ассоциации кинокомпаний (MPA)
Таблица MPA содержит информацию с номером рейтинга, названием и описанием.
Содержит информацию о возрастном рейтинге MPAA.
Рейтинги могут быть такими:
G — у фильма нет возрастных ограничений,
PG — детям рекомендуется смотреть фильм с родителями,
PG-13 — детям до 13 лет просмотр не желателен,
R — лицам до 17 лет просматривать фильм можно только в присутствии взрослого,
NC-17 — лицам до 18 лет просмотр запрещён.
Таблица genre содержит информацию о жанрах кино.
Состоит из идентификатора жанра и его названия.
Таблица likes содержит информацию о лайках фильмов пользователями.
Состоит из идентификатора фильма и идентификатора пользователя, поставившего лайк.
Таблица friendship содержит информацию о друзьях пользователя.
При обработке запроса на добавление друга надо будет проверять существование дружбы в обратном порядке
Содержит идентификатор пользователя, идентификатор друга и статус дружбы.

