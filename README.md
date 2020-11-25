# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* データベース設計

  ## Usersテーブル

  | Column             | Type   | Options                   |
  | ------------------ | ------ | ------------------------- |
  | name               | string | null: false               |
  | email              | string | null: false ,unique: true |
  | encrypted_password | string | null: false               |

  ### association
    has_many comments
    has_many user_business
    has_many user_schedules

  ## Commentsテーブル
  | Column   | Type       | Options                        |
  | -------- | ---------- | ------------------------------ |
  | message  | text       | null: false                    |
  | user     | references | null: false, foreign_key: true |
  | business | references | null: false, foreign_key: true |

  ### association
    belongs_to user
    belongs_to business

  ## Sitesテーブル
  | Column   | Type   | Options     |
  | -------- | ------ | ----------- |
  | name     | string | null: false |
  | customer | string | null: false |

  ### association
    has_many businesses
    has_many markers
    has_many neighbors

  ## Markersテーブル

  | Column   | Type       | Options                        |
  | -------- | ---------- | ------------------------------ |
  | name     | string     | null: false                    |
  | name_cad | string     | null: false                    |
  | type_id  | integer    |                                |
  | exist_id | integer    |                                |
  | site     | references | null: false, foreign_key: true |

  ### associate
    belongs_to site

  ## Neighborsテーブル

  | Column       | Type       | Options                        |
  | ------------ | ---------- | ------------------------------ |
  | lot_number   | string     | null: false                    |
  | name         | string     | null: false                    |
  | address      | string     | null: false                    |
  | address_now  | string     |                                |
  | phone_number | string     |                                |
  | witness      | boolean    |                                |
  | witness_day  | date       |                                |
  | status_id    | integer    |                                |
  | memo         | text       |                                |
  | site         | references | null: false, foreign_key: true |

  ### associate
    belongs_to site

  ## businessesテーブル

  | Column              | Type       | Options                        |
  | ------------------- | ---------- | ------------------------------ |
  | business_content_id | integer    | null: false                    |
  | start               | date       | null: false                    |
  | end                 | boolean    |                                |
  | person              | references | null: false, foreign_key: true |
  | site                | references | null: false, foreign_key: true |


  ### associate
    belongs_to site
    has_many user_businesses
    has_many schedules

  ## user_businessesテーブル

  | Column   | Type       | Options                        |
  | -------- | ---------- | ------------------------------ |
  | person   | references | null: false, foreign_key: true |
  | business | references | null: false, foreign_key: true |


  ### associate
    belongs_to person
    belongs_to business


  ## schedulesテーブル

  | Column | Type       | Options                        |
  | ------ | ---------- | ------------------------------ |
  | name   | string     | null: false                    |
  | start  | date       | null: false                    |
  | end    | date       | null: false                    |
  | person | references | null: false, foreign_key: true |
  | site   | references | null: false, foreign_key: true |


  ### associate
    belongs_to business
    has_many user_schedules

    ## user_schedulesテーブル

  | Column     | Type       | Options                        |
  | ---------- | ---------- | ------------------------------ |
  | user       | references | null: false, foreign_key: true |
  | schedule   | references | null: false, foreign_key: true |


  ### associate
    belongs_to schedule
    belongs_to user


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
