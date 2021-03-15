SELECT * FROM  ccl
INNER JOIN role_cmds ON role_cmds.role_id  = ccl.role_id 
INNER JOIN role_names ON role_names.ID = role_cmds.role_id 
WHERE  ccl.senders_group_id = :senders_group_id AND
       ccl.senders_edge_node_id = :senders_edge_node_id AND
       ccl.senders_device_id = :senders_device_id AND
       
       ccl.receivers_group_id = :receivers_group_id AND
       ccl.receivers_edge_node_id = :receivers_edge_node_id AND
       ccl.receivers_device_id = :receivers_device_id AND
       command = :command_name