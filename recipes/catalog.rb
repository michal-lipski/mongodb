mongods =node.mongodb.mongods
this_mongod = "catalog"

mongods.each do |mongo|
  if mongo["mongod"] == this_mongod
    node.mongodb.mongods.delete(mongo)
  end
end
node.mongodb.mongods.push({
                              "mongod" => this_mongod,
                              "port" => "27031",
                              "replication_set" => "logger",
                              "run_bcakups" => "false",
                              "rest" => "false",
                              "monit" => "true",
                              "additional_settings" =>{
                                  "noprealloc" => "true",
                                  "smallfiles" =>"true"
                              }}
)