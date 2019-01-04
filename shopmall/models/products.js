const db = require('../util/shopdatabase');


module.exports = class products {
  constructor(pid, pname,price,amount){
    this.pid = pid;
    this.pname = pname;
    this.price = price;
    this.amount = amount;
  }

  static add(req, res) {
    
    return db.execute(
      'INSERT INTO product (pid, pname, price, amount) VALUES (?, ?, ?, ?)',
      [req.body.pid, req.body.pname, req.body.price, req.body.amount]
    );
  }
  // READ
  static fetchAll(){
    return db.execute("select P.pid , P.pname , P.price , P.amount , S.sname from shopmall.product P left join shopmall.store S on P.sid = S.sid left join shopmall.factory F on P.fid = F.fid");
  }

  static getCount() {
    return db.execute('SELECT COUNT(*) as count FROM product');
  }
}