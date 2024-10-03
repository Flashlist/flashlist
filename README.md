<img src="https://github.com/BenAuerDev/flashlist/assets/136239531/9cb4a36b-6c17-4d15-b125-3ee1d7a956ef" alt="Alt text" style="max-width: 1200px; max-height: 600px" />


# Flashlist
### Task management made simple

Flashlist is a crossplattform mobile app that allows you to manage and share shopping lists, tasks and todos. Providing realtime-updates through WebSockets for perfect sync.


## In case you haven't already install the following:

### Install Flutter and Dart. 
You can follow the instructions on the official Flutter website: [Flutter Installation Guide](https://docs.flutter.dev/get-started/install)

### Install Docker. 
You can follow the instructions on the official Docker website: [Docker Installation Guide](https://docs.docker.com/get-docker/)

### Install Serverpod CLI
Once you have Flutter and Docker installed and configured, open up a terminal and install Serverpod by running:
```bash
dart pub global activate serverpod_cli
```


## Clone Flashlist
To clone run: 

```bash
git clone https://github.com/Flashlist/flashlist.git
```

## Server Setup

Create `/flashlist/flashlist_server/config/passwords.yaml` with the development passwords set in `docker-compose.yaml`

```yaml
development:
  database: '6nGjb0OBhU9WqqZDzSAnwWotoiGiQS6C'
  redis: 'QC_mss_jkyaTZDiMhJvDJj0M6quWjOal'
```

To be able to easily create users on your local DB navigate to `/flashlist/flashlist_server/lib/server.dart`.
There you:
1. Uncomment the `print` and `return` statement.
2. Comment out the try-catch with the sendEmailFromFlashlist Function

```dart
  auth.AuthConfig.set(
    auth.AuthConfig(
      sendValidationEmail: (session, email, validationCode) async {
        //  Send the validation email to the user.
        // Return `true` if the email was successfully sent, otherwise `false`.

        //UNCOMMENT the two lines beneath
        // print(validationCode);
        // return true;

        // COMMENT OUT this try / catch
        try {
          return await sendEmailFromFlashlist(
            session.server.passwords['emailUsername']!,
            session.server.passwords['emailPassword']!,
            email,
            'Flashlist Email Validation',
            'Your validation code is: $validationCode',
          );
        } catch (e) {
          print(e);
          return false;
        }
      },
```

Navigate to the server directory in your shell

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





## Flutter
then all you need to do is navigate to `flashlist_flutter` and run:

```bash
flutter run
```


