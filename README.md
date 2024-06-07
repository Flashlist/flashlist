<img src="https://github.com/BenAuerDev/flashlist/assets/136239531/9cb4a36b-6c17-4d15-b125-3ee1d7a956ef" alt="Alt text" style="max-width: 1200px; max-height: 600px" />


# Flashlist
### Task management made simple

Flashlist is a crossplattform mobile app that allows you to manage and share shopping lists, tasks and todos. Providing realtime-updates through WebSockets for perfect sync.

## Clone Flashlist
To clone run: 

```bash
git clone https://github.com/BenAuerDev/flashlist.git
```

## Server Setup

Create `/flashlist/flashlist_server/config/passwords.yaml` with the development passwords set in `docker-compose.yaml`

```yaml
development:
  database: '6nGjb0OBhU9WqqZDzSAnwWotoiGiQS6C'
  redis: 'QC_mss_jkyaTZDiMhJvDJj0M6quWjOal'
```

Navigate to the server directory

```bash
cd flashlist/flashlist_server
```

Start up the Database by running
```bash
docker-compose up --build --detach
```

Run the server and apply the migrations to your (fresh) database:
```bash
dart bin/main.dart --apply-migrations
```

If your database already has all the changes you just run:
```bash
dart bin/main.dart
```





## Flutter Setup
then all you need to do is navigate to `flashlist_flutter` and run:

```bash
flutter run
```


