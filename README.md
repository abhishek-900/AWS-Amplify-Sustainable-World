# Sustainable World Flutter App - A Greener Tomorrow

![Untitled design](https://github.com/abhishek-900/AWS-Amplify-Sustainable-World/assets/45100807/aa4b8fb4-7582-4a36-bdc4-1f4b5d9132e0)


In today's world, where environmental concerns are on the rise, we need a solution that promotes responsible waste management and recycling. That's where "Sustainable World" comes in. It's a mobile app that connects people and NGOs, making it easy to recycle and dispose of items responsibly. With this app, we aim to create a greener and more sustainable planet by empowering individuals and organizations to take active steps toward environmental preservation. Let's work together to shape a cleaner, healthier future for all. Join us in making a difference and creating a better world for generations to come.

## Table of Contents
- [Installation](#installation)
- [Test Credentials](#test-credentials)
- [Disposers](#disposers)
  - [How to Post a Product](#how-to-post-a-product)
- [Recyclers](#recyclers)
  - [How to Purchase Products](#how-to-purchase-products)
  - [Order Tracking](#order-tracking)
- [App Features](#app-features)
- [Technology Used](#technology-used)
- [References](#references)

## Installation
Follow these steps to set up the Sustainable World app:

1. **Clone the Project:** Clone this repository to your local machine.

2. **Setup AWS Amplify:** Add your own `amplifyconfiguration.dart` file to configure AWS Amplify services for your app. [AWS Amplify](https://docs.amplify.aws/cli/start/install/)

3. **Stripe Payment Setup (Optional):** If you want to use Stripe payment integration, update the `.env` file with your Stripe credentials. If you don't wish to use Stripe, you can remove the references to Stripe from the project.

## Test Credentials
Use the following test credentials to access different roles in the app:

- **Disposer Role**
  - Email: abhishek.work08@gmail.com
  - Password: 12345678

- **Recycler Role**
  - Email: sarthakagrawal1296@gmail.com
  - Password: 12345678

## Disposers
As a Disposer, you are an essential part of the Sustainable World community. Disposers are individuals who seek responsible ways to manage waste, including organic leftovers, old clothing, leftover food, electronic devices, and more. By listing your items on the app, you can find sustainable solutions for recycling and repurposing.

### How to Post a Product?
1. **Categorize:** Choose the appropriate category for your product, such as clothes, plastic, flowers, metals, etc.
2. **Provide Details:** Fill in essential product information:
- **Title:** Give your product a clear and descriptive title.
- **Description:** Provide additional details about the product's condition, size, or any relevant information.
- **Quantity:** Specify the number of items you are posting.
- **Images:** Add multiple images to showcase your product.
3. **Tags:** Add relevant tags to help Recyclers find your product easily.
4. **Contribution Type:** Choose between "SELL" or "DONATE" based on your preference.
- If you choose "SELL," add the amount you want to sell the product for.
5. **Recipient Selection:**
- **For All Recyclers:** Choose to make the product available for all users of the app.
- **Selective NGOs:** Select a specific NGO as the recipient if you wish to support a particular cause.
6. **Pick Up Location:** Provide the location where the product can be picked up.

## Recyclers
Recyclers play a vital role in the Sustainable World ecosystem. They are Non-Governmental Organizations (NGOs) and recycling facilities that are passionate about recycling and repurposing materials.

### How to Purchase Products?
As a Recycler, you have the opportunity to buy products from the "Shop" page:

1. **Filter and Sort:** Use the filter to find products that are available for free.
2. **Secure Payment:** Make secure payments through Stripe for the products you wish to purchase.
3. **Offer Section:** Find products posted exclusively for you in the "Offer" section, tailored to your recycling needs.

### Order Tracking
In the "Order" section, you can track the status of your orders, ensuring a smooth and transparent purchasing experience.

## App Features
- ### Post Product
Users can easily post various items they no longer need, such as organic waste, clothing, electronics, etc., for recycling and repurposing.
- ### Track Order
Users can track the status of their posted products, ensuring a smooth and transparent recycling process.
- ### Waste Management Statistics
View detailed statistics and insights on waste management, showcasing the positive impact of responsible disposal efforts.
- ### Earn Stickers
Users can earn stickers as rewards for their sustainable actions, which they can proudly share on social media, promoting their commitment to a cleaner environment.
- ### Campaign Participation
Engage in "Nearly By Campaign" and contribute to local environmental initiatives, fostering a collective effort towards sustainability.
- ### Read Articles
Access the "Good Read" section to explore informative articles and eco-friendly tips for better waste management and sustainable living.
- ### Shop Products
Users can browse and shop a wide range of recycled and repurposed products listed by others, supporting the circular economy. With easy filtering and sorting options, users can find products that match their needs while contributing to a greener world.
- ### Secure Checkout
Make secure payments through Stripe integration, ensuring a safe and seamless purchasing experience.
- ### Exclusive Offers
Discover exclusive products posted by others, tailored to specific recycling needs and interests.
- ### Order Tracking
Keep track of the order status, from purchase to delivery, ensuring a smooth and transparent shopping experience.
- ### User Profiles
Personalized profiles for each user that track their contributions, purchases, and positive impact on the environment.
- ### Community Discussions
Engage in community discussions, where users can share ideas and tips for leading a greener lifestyle.
- ### Light and Dark Mode Support
The app supports both light and dark mode, allowing users to choose their preferred interface theme for an enhanced user experience.

## Technology Used
The Sustainable World app is built using the following technologies:
- **Frontend:** Flutter
- **Backend:** AWS Amplify (Authentication, GraphQL API, Storage)
- **Serverless Functions:** AWS Lambda Function
- **Payment Integration:** Stripe

## References
- [GitHub Repository](https://github.com/abhishek-900/AWS-Amplify-Sustainable-World)
- [Video Url](https://www.youtube.com/watch?v=nDG3PUwZe2A)
- [AWS Amplify Domain](https://eu-north-1.admin.amplifyapp.com/admin/d3ig1zmjoexlde/staging/home)
- [Hashnode Domain](https://makeitsimple.hashnode.dev/)
- **Team Members:** Abhishek Singh, Sarthak Agrawal, Anmol Jain, Deeshant Kotnala


