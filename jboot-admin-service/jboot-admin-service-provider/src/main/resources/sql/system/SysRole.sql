#sql("find")
  SELECT * FROM sys_role
  #for (x : cond)
    #(for.index == 0 ? "where" : "and") #(x.key) #para(x.value)
  #end
#end

#sql("findByUserName")
  SELECT
    b.*
  FROM
    sys_role b,
    sys_user d,
    sys_user_role e
  WHERE
    b.id = e.role_id
    AND d.id = e.user_id
    AND d.`name` = ?
#end