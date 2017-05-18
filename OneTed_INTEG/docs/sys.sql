Drop USER Oneted CASCADE;

CREATE USER Oneted IDENTIFIED BY Oneted;

Grant Connect, Resource to Oneted;
grant create view, create synonym to Oneted;

alter USER Oneted ACCOUNT unlock;
----------------------------------------