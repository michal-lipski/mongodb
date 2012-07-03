mongods =node.mongodb.mongods
this_mongod = "logger"

mongods.each do |mongo|
  if mongo["mongod"] == this_mongod
    node.mongodb.mongods.delete(mongo)
  end
end
node.mongodb.mongods.push({
                              "mongod" => this_mongod,
                              "port" => "27030",
                              "replication_set" => "logger",
                              "run_bcakups" => "false",
                              "rest" => "false",
                              "monit" => "true"}
)