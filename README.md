# Super-star-stat
This is **Super Star Stat**

<mark>2015-06-02 Wiser edited</mark>

Goals:(ordered by priority and schedule)

1. A demo manages a sqlite DB with basic CRUD operations. (CRUD=Create,Read,Update,Delete)
2. A demo creates a basic stats-recording user interface. (shot attempt,shot made,assist,rebound,steal,block)
3. A demo integrates above functions to keep stats data in DB.
4. next step.......


<mark>2015-06-09 Wiser edited</mark>

1. "Sqlite Test" project does CRUD operation on DB named 'SqliteDB.sqlite' 
2. SqliteDB.sqlite is stored at cache directory of app 
(NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];)

<mark>2015-06-12 Wiser edited</mark>

1. Create data model "StatsModel" , used to access DB.
2. Create DB class "DBAgent".
3. StatsModel is saved as shareInstance ,singleton class.

<mark>2015-06-23 Wiser edited</mark>

1. Reform the DB data structure for SuperStarStats table table.(same as spec)
2. Create a data model function to add an assist & update table for primary key game id.(id is one and only unique)

<mark>2015-06-24 Wiser edited</mark>

1. loadDataFromDB load DB data to NSMutableDictionary dataDic.
2. incAssist function uses dataDic to increse itself and update DB.

<mark>2015-06-25 Wiser edited</mark>

1. getStats get statistics from dataDic by high level key value and recalculate    from values in dataDic.
   example: point = 2pt made+3pt made+free throw made
2. Statistics show on the bottom with date,player name,point,rebound,assist.
3. Assist botton increase assist value in DB and dataDic respectively.

Final Goal: 

(Please let Stan Hsu fills up this)

......

