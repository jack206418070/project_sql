const db = require('../util/shopdatabase');


module.exports = class store {
  constructor(sid, sname, saddress) {
    this.sid = sid;
    this.sname = sname;
    this.saddress = saddress;
  }

  static add(req, res) {

    return db.execute(
      'INSERT INTO store (sname, saddress) VALUES (?, ?)',
      [req.body.sname, req.body.saddress]
    );
  }
 
  static fetchAll() {
    return db.execute("select * from store");
  }

  static getCount() {
    return db.execute('SELECT COUNT(*) as count FROM store');
  }
}