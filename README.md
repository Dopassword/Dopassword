# Dopassword
Original App Design Project - README Template
===

# Dopassword 

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
A simple, yet effective way of managing different passwords. A user can login, and see all their passwords for any account they enter into the app.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Security/Utility
- **Mobile:** No website access, mobile only experience
- **Story:** Allows users to safely store different passwords for different websites and applications, while only needing to remember one password.
- **Market:** Anyone with a lot of passwords can use this app to stay organized, while maintaining security.
- **Habit:** Users can utilize this app whenever accessing one of their accounts, or if they are making a new account and would like to store a password.
- **Scope:** The application is extremely narrow focused, primarily serving the purpose of storing data such as account names and their corresponding passwords. 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [X] User can register a new account with the password manager
- [X] User can login
- [X] User can add a new account
- [X] User can add a corresponding password
- [X] User can name an account
- [X] User can remove an account from the password manager
- [X] User can update password
- [X] User can view all accounts in a list

**Optional Nice-to-have Stories**

- [] User can generate a new password
- [] Two-factor authentication
- [] User can search for an account
- [] User can copy password to clipboard
- [X] Add logos for applications

### 2. Screen Archetypes

* Login
   * User can login
* Register
   * User can register a new account with the            password manager
* Creation 
   * User can add a new account
   * User can add a corresponding password
* Profile
   * User can view all accounts in a list
* Detail
   * User can name an account
   * User can remove an account from the password        manager
   * User can update password

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Profile
* Creation

**Flow Navigation** (Screen to Screen)

* Login
   * Stream
* Register - User signs up or logs into an account
   * Stream
* Stream - User can scroll through a list of their accounts
* Creation
   * Stream
* Profile
   * Stream
   * Detail

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>
![image](https://user-images.githubusercontent.com/77711850/111411140-4625d400-8697-11eb-8a11-d90e9e8e35c2.png)

MODELS

| Login Object |        |                           |
|--------------|--------|---------------------------|
| Property     | Type   | Description               |
| userId       | String | unique id for the user    |
| userPassword | String | unique password to log in |

| Password Object |          |                                     |
|-----------------|----------|-------------------------------------|
| Property        | Type     | Description                         |
| image           | File     | image of logo for application       |
| caption         | String   | name of the application             |
| createdAt       | DateTime | date when password was added        |
| updatedAt       | DateTime | date when password is updated       |
| appId           | String   | id to login to an application       |
| appPassword     | String   | password to login to an application |

NETWORKING

| Login Screen          |                                           |
|-----------------------|-------------------------------------------|
| (Create/PUT)          | Create a new Dopassword account           |

    let query = PFQuery(className:"Posts")
        query.includeKeys(["username", "password", "password.username"])
        
        query.limit = 10
        
        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.tableView.reloadData() //add connection later
            }
        }
        
 (Read/GET)            | Logging to an existing Dopassword account 
                       |                                           
 Profile View          |                                           
 (Read/GET)            | Scrolling list of exsiting applications   
 (Read/GET)            | Copy password to clipboard                
                       |                                           
 Account Detail View   |                                           
 (Update/PUT)          | Update password                           
 (Create/PUT)          | Allow the user to make a custom name      
 (Delete)              | Delete the account                        
 (Update/PUT)          | Update logo                               
                       |                                           
 Account Creation View |                                           
 (Create/PUT)          | Create a new username                     
 (Create/PUT)          | Create a new password                     
 (Create/PUT)          | Associate logo with account               

## Video Walkthrough

Here's a walkthrough of progress after week one:

<img src='http://g.recordit.co/UBlI4Sdn0r.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
<img src='http://g.recordit.co/ydyh7OLtWg.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

Here's a walkthrough of progress after week two:

<img src='http://g.recordit.co/lCUB9F3m20.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

Here's a walkthrough of progress after week three:

<img src='http://g.recordit.co/Dp6yfXLuHN.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' /> 
