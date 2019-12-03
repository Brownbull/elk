var cursor = db.infra.find()
while (cursor.hasNext()) {
var doc = cursor.next();
db.infra.update({_id : doc._id}, {$set : {tsdate : new Date(doc.tsdate)}})
}