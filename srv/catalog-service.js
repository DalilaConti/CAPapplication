module.exports = (srv) => {

    const {Products} = cds.entities ('my.App')
  
    // Reduce stock of ordered products
    srv.before ('CREATE', 'Orders', async (req) => {
      const order = req.data
      if (!order.Amount || order.Amount <= 0)  return req.error (400, 'Order at least 1 product')
      const tx = cds.transaction(req)
      const affectedRows = await tx.run (
        UPDATE (Products)
          .set   ({ stock: {'-=': order.Amount}})
          .where ({ stock: {'>=': order.Amount},/*and*/ ID: order.ID})
      )
      if (affectedRows === 0)  req.error (409, "Sold out, sorry")
    })
  
    // Add some discount for overstocked products
    srv.after ('READ', 'Products', each => {
      if (each.Stock > 15)  each.Name += '  11% discount!'
    })
  
  }