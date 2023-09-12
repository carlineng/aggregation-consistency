-- Query 1
SELECT SUM (cost) FROM Denormalized_Ad_View ;

-- Query 2
SELECT SUM (price) FROM Denormalized_Purchase ;

-- Query 3
SELECT A.source , SUM ( I.price )
FROM V FULL OUTER JOIN U ON V.uid = U.uid
FULL OUTER JOIN A on V.aid = A.aid
FULL OUTER JOIN H ON H.uid = U.uid
FULL OUTER JOIN I ON H.iid = I.iid
FULL OUTER JOIN P ON H.pid = P.pid
GROUP BY A.source ;