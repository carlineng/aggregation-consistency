CREATE TABLE u as
  SELECT * FROM (
    VALUES
      (1, 'Joe')
      , (2, 'Mary')
  ) 

  user (uid, name)
;

create table i as 
  SELECT * FROM (
    VALUES
      (1, 1, 20)
      , (2, null, 30)
      , (3, 5, 35)
    ) 

    item (iid, size, price);


create table p as 
  SELECT * FROM (
    VALUES
      (1, 'Paypal')
      , (2, 'Visa')
  ) 

  payment (pid, name)
  ;

create table a as
  SELECT * FROM (
    VALUES
      (1, 'Google', 500)
      , (2, 'Facebook', 600)
    ) 

    ad (aid, source, cost)
    ;

create table v as 
  SELECT * FROM (
    VALUES
      (1, 1)
      , (1, 2)
      , (2, 1)
  ) 

    ad_view (uid, aid)
;

create table h as 
  SELECT * FROM (
    VALUES
      (1, 1, 1)
      , (2, 1, 1)
      , (2, 2, null)
      , (2, 4, 2)
    ) 

    purchase_history (uid, iid, pid)
    ;


CREATE VIEW Denormalized_Ad_View AS SELECT *
FROM V JOIN U ON V . uid = U . uid
JOIN A on V . aid = A . aid ;

CREATE VIEW Denormalized_Purchase AS SELECT *
FROM H JOIN U ON H . uid = U . uid
JOIN I ON H . iid = I . iid
JOIN P ON H . pid = P . pid ;