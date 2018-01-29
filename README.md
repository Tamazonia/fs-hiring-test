# 1. About
This product has been developed within the full-stack hiring test of Luvmotels : https://github.com/luvotels/fs-hiring-test/
The final product can be seen online on: https://tjluvotels.herokuapp.com/. There are three users with the following email | password | amount of motels
- user1@gmail.com |  123456 | 2 motels
- user2@gmail.com |  123456 | 1 motel
- user3@gmail.com |  123456 | 0 motel


# 2. Implemented Solution
## 2.1 Product
The developed product focus on the scope of the user login of a motel owner and the administration of bookings and revenues.

The following user stories have been implemented:
1) Login: As a Motel Owner I want to have access to the information of my motel and my rooms
2) Login: As Luvotels I want to make sure that a Motel Owner can only see his own information and has no simple way to access information of other Motels
3) Admin: As a Motel Owner, I want to know what bookings have passed
4) Admin: As a Motel Owner, I want to know what my net earnings per Motel
5) Admin: As a Motel Owner, I want to know what my net earnings per Room

## 2.2 Technical
The solution has been developed on rails 5.1.4.

### 2.2.1 Set up
To set up the solution, please run the following commands
```sh
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

### 2.2.2 Data/API
The data of the solution is depending on the Luvmotels API. The models (motel, room, booking) have been built around this API. In order to add a user component, an extra model for user has been created
The database gets populated by calling the API in the Seed. In order to make the references work, extra fields were included: api_motel_id, api_room_id, api_booking_id

### 2.2.3 Authentication and Authorization
In order to implement user story 1 and 2, devise and pundit is used

## 2.3 Testing
### 2.3.1 Automated Testing
While the initial set up has been done, automated tests still need to be written. The solution currently relies on Manual Testing as described below.

### 2.3.2 Manual Testing
The following describes the main test cases that need to be performed. To check the data, the table below "User Test Data" needs to be verified during the tests
#### A) Test Cases
| Test | Do | Expected Outcome |
| --- | --- |---|
| Login Authentication| Login with all three users| - User1 and 2: Their owned Motels (And on click room) have to appear; User3: A screen has to appear that there are no motels|
| Login Authorization| Login as user1 and user3 and try to change routes of index to access info of other user | Redirection to landing page and alert |
| Admin Revenue (Motels and Room) | Login as User 1 and User 2 and get to Motels and Rooms Overview |Check Correct Total Net Earning Data, double check for each Motel and room the totals, double check for each Motel and Room the Gross, Net and Commission Fee by calculating it |
| Admin Revenue (Bookings) | Login as User 1 and User 2 and get to Bookings |Check Total Booking amount, double check random bookings the totals, Gross, Net and Commission Fee by calculating it |



#### B) User Test Data
| User | Motels | Rooms | Total Bookings | Total Net Earnings |
| --- | --- |---|---|---|
| user1 | Beatles Motel, Nirvana Motels| Heart Shaped Room, Drain your Suite, Love Buzz Suite, Twist and Shout Room, All my loving Room |650|R$ 69,290.40|
| user2| Desserts Motel | Pudim Room, Cream Bomb Suite, Lollypop Room|500|R$ 55,149.44|
| user3| No motels| No rooms | No bookings|


# 3. Improvement Potential
Following topics are suggested to be improved regarding the current implemented solution
## 3.1 Product
- Use Paid at Data as Filter to show revenues per Months, weeks and days in order to analyze revenue flows and impact of different actions such as marketing campaigns etc
- Graphical display of the data in charts for analytical purposes

## 3.2 Technical
- API Call: Integrate data from API directly without using a "artificial" seed (including a layer between API and page)
- Implement Webhook to get data updated as soon it changes
- Automated Tests
- Bootstrap 4: Solution is currently running on Bootstrap 3 while Bootstrap 4 has been fully realeased. Bootstrap 4 offers further options and improvements especially on the responsiveness around grids
- SEO and Social Media: The current solution focus strongly on the resolving the tasks of the fs-challenge. There is a big room for improvement on Search Engine Optimization (Descriptions, H1 naming) and Social Media tools such as sharing on Whatsapp etc.


