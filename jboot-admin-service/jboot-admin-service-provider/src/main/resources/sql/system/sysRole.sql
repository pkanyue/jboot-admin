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