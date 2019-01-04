const db = require('../util/shopdatabase');


module.exports = class costomer {
  constructor(cid, cname, address, phone) {
    this.cid = cid;
    this.cname = cname;
    this.address = address;
    this.phone = phone;
  }

  static add(req, res) {
    return db.execute(
      'INSERT INTO costomer (cname, phone, address) VALUES (?, ?, ?)',
      [req.body.cname, req.body.phone, req.body.address]
    );
  }

  static fetchAll() {
    return db.execute("select * from costomer");
  }

  static getCount() {
    return db.execute('SELECT COUNT(*) as count FROM costomer');
  }
}