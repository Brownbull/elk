var crs = db.infra.find()
while (crs.hasNext()) {
var dc = crs.next();
db.infra.update({_id : dc._id}, {$set : {tsdate : new Date(dc.tsdate)}})
}


