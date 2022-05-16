{"changed":true,"filter":false,"title":"main.tf","tooltip":"/Docker-volume/main.tf","value":"\nterraform {\n  required_providers {\n    docker = {\n      source  = \"kreuzwerker/docker\"\n      version = \"~>2.16.0\"\n    }\n  }\n}\n\nprovider \"docker\" {}\n\n#attaching volume to docker container\nresource \"null_resource\" \"docker_volume\" {\n  provisioner = \"local-exec\" {\n   command = \"mkdir nodered_volume/ && sudo chown -R 1000:1000 nodered_volume/\"\n    }\n}\n\n\n#pulling image form  dockerhub\nresource \"docker_image\" \"nodered_image\" {\n  name = \"nodered/node-red:latest\"\n}\n\n#count is the number of container that will deploy using  the same image\nresource \"docker_container\" \"nodered_container\" {\n  count = var.count_of_conntainer\n  name  = join(\"-\", [\"nodered\", random_string.random-generator[count.index].result])\n  image = docker_image.nodered_image.latest\n  ports {\n    internal  = 1880\n    external = var.external_port\n  }\n}\n\nresource \"random_string\" \"random-generator\" {\n  count = var.count_of_ramdom\n  length = 4\n  special = false\n  upper  = false\n}","undoManager":{"mark":2,"position":72,"stack":[[{"start":{"row":0,"column":0},"end":{"row":21,"column":1},"action":"insert","lines":["#pulling image form  dockerhub","resource \"docker_image\" \"nodered_image\" {","  name = \"nodered/node-red:latest\"","}","","#count is the number of container that will deploy using  the same image","resource \"docker_container\" \"nodered_container\" {","  count = var.count_of_conntainer","  name  = join(\"-\", [\"nodered\", random_string.random-generator[count.index].result])","  image = docker_image.nodered_image.latest","  ports {","    internal  = 1880","    external = var.external_port","  }","}","","resource \"random_string\" \"random-generator\" {","  count = var.count_of_ramdom","  length = 4","  special = false","  upper  = false","}"],"id":1}],[{"start":{"row":0,"column":0},"end":{"row":21,"column":1},"action":"remove","lines":["#pulling image form  dockerhub","resource \"docker_image\" \"nodered_image\" {","  name = \"nodered/node-red:latest\"","}","","#count is the number of container that will deploy using  the same image","resource \"docker_container\" \"nodered_container\" {","  count = var.count_of_conntainer","  name  = join(\"-\", [\"nodered\", random_string.random-generator[count.index].result])","  image = docker_image.nodered_image.latest","  ports {","    internal  = 1880","    external = var.external_port","  }","}","","resource \"random_string\" \"random-generator\" {","  count = var.count_of_ramdom","  length = 4","  special = false","  upper  = false","}"],"id":2}],[{"start":{"row":0,"column":0},"end":{"row":34,"column":1},"action":"insert","lines":["","terraform {","  required_providers {","    docker = {","      source  = \"kreuzwerker/docker\"","      version = \"~>2.16.0\"","    }","  }","}","","provider \"docker\" {}","","","#pulling image form  dockerhub","resource \"docker_image\" \"nodered_image\" {","  name = \"nodered/node-red:latest\"","}","","#count is the number of container that will deploy using  the same image","resource \"docker_container\" \"nodered_container\" {","  count = var.count_of_conntainer","  name  = join(\"-\", [\"nodered\", random_string.random-generator[count.index].result])","  image = docker_image.nodered_image.latest","  ports {","    internal  = 1880","    external = var.external_port","  }","}","","resource \"random_string\" \"random-generator\" {","  count = var.count_of_ramdom","  length = 4","  special = false","  upper  = false","}"],"id":3}],[{"start":{"row":10,"column":20},"end":{"row":11,"column":0},"action":"insert","lines":["",""],"id":4},{"start":{"row":11,"column":0},"end":{"row":12,"column":0},"action":"insert","lines":["",""]},{"start":{"row":12,"column":0},"end":{"row":12,"column":1},"action":"insert","lines":["r"]},{"start":{"row":12,"column":1},"end":{"row":12,"column":2},"action":"insert","lines":["e"]}],[{"start":{"row":12,"column":2},"end":{"row":12,"column":3},"action":"insert","lines":["s"],"id":5},{"start":{"row":12,"column":3},"end":{"row":12,"column":4},"action":"insert","lines":["o"]},{"start":{"row":12,"column":4},"end":{"row":12,"column":5},"action":"insert","lines":["u"]},{"start":{"row":12,"column":5},"end":{"row":12,"column":6},"action":"insert","lines":["r"]},{"start":{"row":12,"column":6},"end":{"row":12,"column":7},"action":"insert","lines":["c"]},{"start":{"row":12,"column":7},"end":{"row":12,"column":8},"action":"insert","lines":["e"]}],[{"start":{"row":12,"column":8},"end":{"row":12,"column":9},"action":"insert","lines":[" "],"id":6}],[{"start":{"row":12,"column":9},"end":{"row":12,"column":11},"action":"insert","lines":["\"\""],"id":7}],[{"start":{"row":12,"column":10},"end":{"row":12,"column":11},"action":"insert","lines":["n"],"id":8},{"start":{"row":12,"column":11},"end":{"row":12,"column":12},"action":"insert","lines":["u"]},{"start":{"row":12,"column":12},"end":{"row":12,"column":13},"action":"insert","lines":["l"]},{"start":{"row":12,"column":13},"end":{"row":12,"column":14},"action":"insert","lines":["l"]}],[{"start":{"row":12,"column":14},"end":{"row":12,"column":15},"action":"insert","lines":["_"],"id":9},{"start":{"row":12,"column":15},"end":{"row":12,"column":16},"action":"insert","lines":["r"]},{"start":{"row":12,"column":16},"end":{"row":12,"column":17},"action":"insert","lines":["e"]},{"start":{"row":12,"column":17},"end":{"row":12,"column":18},"action":"insert","lines":["s"]},{"start":{"row":12,"column":18},"end":{"row":12,"column":19},"action":"insert","lines":["o"]},{"start":{"row":12,"column":19},"end":{"row":12,"column":20},"action":"insert","lines":["u"]},{"start":{"row":12,"column":20},"end":{"row":12,"column":21},"action":"insert","lines":["r"]},{"start":{"row":12,"column":21},"end":{"row":12,"column":22},"action":"insert","lines":["c"]},{"start":{"row":12,"column":22},"end":{"row":12,"column":23},"action":"insert","lines":["e"]}],[{"start":{"row":12,"column":24},"end":{"row":12,"column":25},"action":"insert","lines":[" "],"id":10}],[{"start":{"row":12,"column":25},"end":{"row":12,"column":27},"action":"insert","lines":["\"\""],"id":11}],[{"start":{"row":12,"column":26},"end":{"row":12,"column":27},"action":"insert","lines":["d"],"id":12},{"start":{"row":12,"column":27},"end":{"row":12,"column":28},"action":"insert","lines":["o"]},{"start":{"row":12,"column":28},"end":{"row":12,"column":29},"action":"insert","lines":["c"]},{"start":{"row":12,"column":29},"end":{"row":12,"column":30},"action":"insert","lines":["k"]},{"start":{"row":12,"column":30},"end":{"row":12,"column":31},"action":"insert","lines":["e"]},{"start":{"row":12,"column":31},"end":{"row":12,"column":32},"action":"insert","lines":["r"]},{"start":{"row":12,"column":32},"end":{"row":12,"column":33},"action":"insert","lines":["_"]}],[{"start":{"row":12,"column":33},"end":{"row":12,"column":34},"action":"insert","lines":["v"],"id":13},{"start":{"row":12,"column":34},"end":{"row":12,"column":35},"action":"insert","lines":["o"]},{"start":{"row":12,"column":35},"end":{"row":12,"column":36},"action":"insert","lines":["l"]},{"start":{"row":12,"column":36},"end":{"row":12,"column":37},"action":"insert","lines":["u"]},{"start":{"row":12,"column":37},"end":{"row":12,"column":38},"action":"insert","lines":["m"]},{"start":{"row":12,"column":38},"end":{"row":12,"column":39},"action":"insert","lines":["e"]}],[{"start":{"row":12,"column":40},"end":{"row":13,"column":0},"action":"insert","lines":["",""],"id":14}],[{"start":{"row":12,"column":40},"end":{"row":13,"column":0},"action":"remove","lines":["",""],"id":15}],[{"start":{"row":12,"column":40},"end":{"row":12,"column":41},"action":"insert","lines":[" "],"id":16}],[{"start":{"row":12,"column":40},"end":{"row":12,"column":41},"action":"remove","lines":[" "],"id":17}],[{"start":{"row":12,"column":40},"end":{"row":12,"column":41},"action":"insert","lines":["{"],"id":18},{"start":{"row":12,"column":41},"end":{"row":12,"column":42},"action":"insert","lines":["}"]}],[{"start":{"row":12,"column":41},"end":{"row":14,"column":0},"action":"insert","lines":["","    ",""],"id":19}],[{"start":{"row":12,"column":40},"end":{"row":13,"column":0},"action":"insert","lines":["",""],"id":20}],[{"start":{"row":12,"column":40},"end":{"row":13,"column":0},"action":"remove","lines":["",""],"id":21}],[{"start":{"row":12,"column":40},"end":{"row":12,"column":41},"action":"insert","lines":[" "],"id":22}],[{"start":{"row":12,"column":42},"end":{"row":13,"column":0},"action":"insert","lines":["",""],"id":23}],[{"start":{"row":13,"column":0},"end":{"row":13,"column":1},"action":"insert","lines":[" "],"id":24},{"start":{"row":13,"column":1},"end":{"row":13,"column":2},"action":"insert","lines":[" "]},{"start":{"row":13,"column":2},"end":{"row":13,"column":3},"action":"insert","lines":[" "]},{"start":{"row":13,"column":3},"end":{"row":13,"column":4},"action":"insert","lines":[" "]},{"start":{"row":13,"column":4},"end":{"row":13,"column":5},"action":"insert","lines":[" "]}],[{"start":{"row":13,"column":4},"end":{"row":13,"column":5},"action":"remove","lines":[" "],"id":25},{"start":{"row":13,"column":0},"end":{"row":13,"column":4},"action":"remove","lines":["    "]},{"start":{"row":12,"column":42},"end":{"row":13,"column":0},"action":"remove","lines":["",""]}],[{"start":{"row":12,"column":42},"end":{"row":13,"column":0},"action":"insert","lines":["",""],"id":26},{"start":{"row":13,"column":0},"end":{"row":13,"column":1},"action":"insert","lines":[" "]},{"start":{"row":13,"column":1},"end":{"row":13,"column":2},"action":"insert","lines":[" "]}],[{"start":{"row":13,"column":2},"end":{"row":13,"column":3},"action":"insert","lines":["p"],"id":27},{"start":{"row":13,"column":3},"end":{"row":13,"column":4},"action":"insert","lines":["r"]},{"start":{"row":13,"column":4},"end":{"row":13,"column":5},"action":"insert","lines":["i"]}],[{"start":{"row":13,"column":4},"end":{"row":13,"column":5},"action":"remove","lines":["i"],"id":28}],[{"start":{"row":13,"column":4},"end":{"row":13,"column":5},"action":"insert","lines":["o"],"id":29}],[{"start":{"row":13,"column":5},"end":{"row":13,"column":6},"action":"insert","lines":["v"],"id":30},{"start":{"row":13,"column":6},"end":{"row":13,"column":7},"action":"insert","lines":["i"]},{"start":{"row":13,"column":7},"end":{"row":13,"column":8},"action":"insert","lines":["s"]},{"start":{"row":13,"column":8},"end":{"row":13,"column":9},"action":"insert","lines":["i"]},{"start":{"row":13,"column":9},"end":{"row":13,"column":10},"action":"insert","lines":["o"]},{"start":{"row":13,"column":10},"end":{"row":13,"column":11},"action":"insert","lines":["n"]},{"start":{"row":13,"column":11},"end":{"row":13,"column":12},"action":"insert","lines":["e"]},{"start":{"row":13,"column":12},"end":{"row":13,"column":13},"action":"insert","lines":["d"]}],[{"start":{"row":13,"column":12},"end":{"row":13,"column":13},"action":"remove","lines":["d"],"id":31}],[{"start":{"row":13,"column":12},"end":{"row":13,"column":13},"action":"insert","lines":["r"],"id":32}],[{"start":{"row":13,"column":13},"end":{"row":13,"column":14},"action":"insert","lines":[" "],"id":33},{"start":{"row":13,"column":14},"end":{"row":13,"column":15},"action":"insert","lines":["="]}],[{"start":{"row":13,"column":15},"end":{"row":13,"column":16},"action":"insert","lines":[" "],"id":34}],[{"start":{"row":13,"column":16},"end":{"row":13,"column":18},"action":"insert","lines":["\"\""],"id":35}],[{"start":{"row":13,"column":17},"end":{"row":13,"column":18},"action":"insert","lines":["l"],"id":36},{"start":{"row":13,"column":18},"end":{"row":13,"column":19},"action":"insert","lines":["o"]},{"start":{"row":13,"column":19},"end":{"row":13,"column":20},"action":"insert","lines":["c"]},{"start":{"row":13,"column":20},"end":{"row":13,"column":21},"action":"insert","lines":["a"]},{"start":{"row":13,"column":21},"end":{"row":13,"column":22},"action":"insert","lines":["l"]},{"start":{"row":13,"column":22},"end":{"row":13,"column":23},"action":"insert","lines":["-"]},{"start":{"row":13,"column":23},"end":{"row":13,"column":24},"action":"insert","lines":["e"]},{"start":{"row":13,"column":24},"end":{"row":13,"column":25},"action":"insert","lines":["x"]}],[{"start":{"row":13,"column":25},"end":{"row":13,"column":26},"action":"insert","lines":["e"],"id":37},{"start":{"row":13,"column":26},"end":{"row":13,"column":27},"action":"insert","lines":["c"]}],[{"start":{"row":13,"column":28},"end":{"row":14,"column":0},"action":"insert","lines":["",""],"id":38},{"start":{"row":14,"column":0},"end":{"row":14,"column":2},"action":"insert","lines":["  "]},{"start":{"row":14,"column":2},"end":{"row":14,"column":3},"action":"insert","lines":[" "]},{"start":{"row":14,"column":3},"end":{"row":14,"column":4},"action":"insert","lines":["c"]}],[{"start":{"row":14,"column":4},"end":{"row":14,"column":5},"action":"insert","lines":["o"],"id":39},{"start":{"row":14,"column":5},"end":{"row":14,"column":6},"action":"insert","lines":["m"]},{"start":{"row":14,"column":6},"end":{"row":14,"column":7},"action":"insert","lines":["m"]},{"start":{"row":14,"column":7},"end":{"row":14,"column":8},"action":"insert","lines":["a"]},{"start":{"row":14,"column":8},"end":{"row":14,"column":9},"action":"insert","lines":["n"]},{"start":{"row":14,"column":9},"end":{"row":14,"column":10},"action":"insert","lines":["d"]}],[{"start":{"row":14,"column":10},"end":{"row":14,"column":11},"action":"insert","lines":[" "],"id":40},{"start":{"row":14,"column":11},"end":{"row":14,"column":12},"action":"insert","lines":["="]}],[{"start":{"row":14,"column":12},"end":{"row":14,"column":13},"action":"insert","lines":[" "],"id":41}],[{"start":{"row":14,"column":13},"end":{"row":14,"column":14},"action":"insert","lines":["m"],"id":42},{"start":{"row":14,"column":14},"end":{"row":14,"column":15},"action":"insert","lines":["k"]},{"start":{"row":14,"column":15},"end":{"row":14,"column":16},"action":"insert","lines":["d"]},{"start":{"row":14,"column":16},"end":{"row":14,"column":17},"action":"insert","lines":["i"]},{"start":{"row":14,"column":17},"end":{"row":14,"column":18},"action":"insert","lines":["r"]}],[{"start":{"row":14,"column":18},"end":{"row":14,"column":19},"action":"insert","lines":[" "],"id":43},{"start":{"row":14,"column":19},"end":{"row":14,"column":20},"action":"insert","lines":["n"]},{"start":{"row":14,"column":20},"end":{"row":14,"column":21},"action":"insert","lines":["o"]},{"start":{"row":14,"column":21},"end":{"row":14,"column":22},"action":"insert","lines":["d"]},{"start":{"row":14,"column":22},"end":{"row":14,"column":23},"action":"insert","lines":["e"]}],[{"start":{"row":14,"column":23},"end":{"row":14,"column":24},"action":"insert","lines":["r"],"id":44},{"start":{"row":14,"column":24},"end":{"row":14,"column":25},"action":"insert","lines":["e"]},{"start":{"row":14,"column":25},"end":{"row":14,"column":26},"action":"insert","lines":["d"]},{"start":{"row":14,"column":26},"end":{"row":14,"column":27},"action":"insert","lines":["_"]},{"start":{"row":14,"column":27},"end":{"row":14,"column":28},"action":"insert","lines":["v"]},{"start":{"row":14,"column":28},"end":{"row":14,"column":29},"action":"insert","lines":["o"]},{"start":{"row":14,"column":29},"end":{"row":14,"column":30},"action":"insert","lines":["l"]},{"start":{"row":14,"column":30},"end":{"row":14,"column":31},"action":"insert","lines":["u"]}],[{"start":{"row":14,"column":31},"end":{"row":14,"column":32},"action":"insert","lines":["m"],"id":45},{"start":{"row":14,"column":32},"end":{"row":14,"column":33},"action":"insert","lines":["e"]}],[{"start":{"row":14,"column":13},"end":{"row":14,"column":14},"action":"insert","lines":["\""],"id":46}],[{"start":{"row":14,"column":33},"end":{"row":14,"column":34},"action":"remove","lines":["e"],"id":47}],[{"start":{"row":14,"column":33},"end":{"row":14,"column":34},"action":"insert","lines":["e"],"id":48},{"start":{"row":14,"column":34},"end":{"row":14,"column":35},"action":"insert","lines":["/"]}],[{"start":{"row":14,"column":35},"end":{"row":14,"column":36},"action":"insert","lines":[" "],"id":49},{"start":{"row":14,"column":36},"end":{"row":14,"column":37},"action":"insert","lines":["&"]},{"start":{"row":14,"column":37},"end":{"row":14,"column":38},"action":"insert","lines":["&"]}],[{"start":{"row":14,"column":38},"end":{"row":14,"column":39},"action":"insert","lines":[" "],"id":50},{"start":{"row":14,"column":39},"end":{"row":14,"column":40},"action":"insert","lines":["s"]},{"start":{"row":14,"column":40},"end":{"row":14,"column":41},"action":"insert","lines":["u"]},{"start":{"row":14,"column":41},"end":{"row":14,"column":42},"action":"insert","lines":["d"]},{"start":{"row":14,"column":42},"end":{"row":14,"column":43},"action":"insert","lines":["i"]}],[{"start":{"row":14,"column":42},"end":{"row":14,"column":43},"action":"remove","lines":["i"],"id":51}],[{"start":{"row":14,"column":42},"end":{"row":14,"column":43},"action":"insert","lines":["0"],"id":52}],[{"start":{"row":14,"column":42},"end":{"row":14,"column":43},"action":"remove","lines":["0"],"id":53}],[{"start":{"row":14,"column":42},"end":{"row":14,"column":43},"action":"insert","lines":["o"],"id":54}],[{"start":{"row":14,"column":43},"end":{"row":14,"column":44},"action":"insert","lines":[" "],"id":55},{"start":{"row":14,"column":44},"end":{"row":14,"column":45},"action":"insert","lines":["c"]},{"start":{"row":14,"column":45},"end":{"row":14,"column":46},"action":"insert","lines":["h"]},{"start":{"row":14,"column":46},"end":{"row":14,"column":47},"action":"insert","lines":["o"]},{"start":{"row":14,"column":47},"end":{"row":14,"column":48},"action":"insert","lines":["w"]},{"start":{"row":14,"column":48},"end":{"row":14,"column":49},"action":"insert","lines":["n"]}],[{"start":{"row":14,"column":49},"end":{"row":14,"column":50},"action":"insert","lines":[" "],"id":56},{"start":{"row":14,"column":50},"end":{"row":14,"column":51},"action":"insert","lines":["-"]},{"start":{"row":14,"column":51},"end":{"row":14,"column":52},"action":"insert","lines":["="]},{"start":{"row":14,"column":52},"end":{"row":14,"column":53},"action":"insert","lines":["R"]}],[{"start":{"row":14,"column":52},"end":{"row":14,"column":53},"action":"remove","lines":["R"],"id":57},{"start":{"row":14,"column":51},"end":{"row":14,"column":52},"action":"remove","lines":["="]}],[{"start":{"row":14,"column":51},"end":{"row":14,"column":52},"action":"insert","lines":["R"],"id":58}],[{"start":{"row":14,"column":52},"end":{"row":14,"column":53},"action":"insert","lines":[" "],"id":59},{"start":{"row":14,"column":53},"end":{"row":14,"column":54},"action":"insert","lines":["1"]},{"start":{"row":14,"column":54},"end":{"row":14,"column":55},"action":"insert","lines":["0"]},{"start":{"row":14,"column":55},"end":{"row":14,"column":56},"action":"insert","lines":["0"]},{"start":{"row":14,"column":56},"end":{"row":14,"column":57},"action":"insert","lines":["0"]}],[{"start":{"row":14,"column":57},"end":{"row":14,"column":58},"action":"insert","lines":[":"],"id":60},{"start":{"row":14,"column":58},"end":{"row":14,"column":59},"action":"insert","lines":["1"]},{"start":{"row":14,"column":59},"end":{"row":14,"column":60},"action":"insert","lines":["0"]},{"start":{"row":14,"column":60},"end":{"row":14,"column":61},"action":"insert","lines":["0"]},{"start":{"row":14,"column":61},"end":{"row":14,"column":62},"action":"insert","lines":["0"]}],[{"start":{"row":14,"column":62},"end":{"row":14,"column":63},"action":"insert","lines":[" "],"id":61},{"start":{"row":14,"column":63},"end":{"row":14,"column":64},"action":"insert","lines":["n"]},{"start":{"row":14,"column":64},"end":{"row":14,"column":65},"action":"insert","lines":["o"]},{"start":{"row":14,"column":65},"end":{"row":14,"column":66},"action":"insert","lines":["d"]},{"start":{"row":14,"column":66},"end":{"row":14,"column":67},"action":"insert","lines":["e"]}],[{"start":{"row":14,"column":63},"end":{"row":14,"column":67},"action":"remove","lines":["node"],"id":62},{"start":{"row":14,"column":63},"end":{"row":14,"column":77},"action":"insert","lines":["nodered_volume"]}],[{"start":{"row":14,"column":77},"end":{"row":14,"column":78},"action":"insert","lines":["/"],"id":63},{"start":{"row":14,"column":78},"end":{"row":14,"column":79},"action":"insert","lines":["\""]}],[{"start":{"row":13,"column":27},"end":{"row":13,"column":28},"action":"remove","lines":["\""],"id":64},{"start":{"row":13,"column":27},"end":{"row":13,"column":28},"action":"insert","lines":[" "]},{"start":{"row":13,"column":28},"end":{"row":13,"column":29},"action":"insert","lines":["{"]}],[{"start":{"row":15,"column":4},"end":{"row":15,"column":5},"action":"insert","lines":["}"],"id":65}],[{"start":{"row":13,"column":27},"end":{"row":13,"column":28},"action":"insert","lines":["\""],"id":66}],[{"start":{"row":11,"column":0},"end":{"row":12,"column":0},"action":"insert","lines":["",""],"id":67},{"start":{"row":12,"column":0},"end":{"row":12,"column":1},"action":"insert","lines":["#"]},{"start":{"row":12,"column":1},"end":{"row":12,"column":2},"action":"insert","lines":["a"]},{"start":{"row":12,"column":2},"end":{"row":12,"column":3},"action":"insert","lines":["t"]},{"start":{"row":12,"column":3},"end":{"row":12,"column":4},"action":"insert","lines":["t"]},{"start":{"row":12,"column":4},"end":{"row":12,"column":5},"action":"insert","lines":["a"]},{"start":{"row":12,"column":5},"end":{"row":12,"column":6},"action":"insert","lines":["c"]}],[{"start":{"row":12,"column":6},"end":{"row":12,"column":7},"action":"insert","lines":["h"],"id":68},{"start":{"row":12,"column":7},"end":{"row":12,"column":8},"action":"insert","lines":["i"]},{"start":{"row":12,"column":8},"end":{"row":12,"column":9},"action":"insert","lines":["n"]},{"start":{"row":12,"column":9},"end":{"row":12,"column":10},"action":"insert","lines":["g"]}],[{"start":{"row":12,"column":10},"end":{"row":12,"column":11},"action":"insert","lines":[" "],"id":69},{"start":{"row":12,"column":11},"end":{"row":12,"column":12},"action":"insert","lines":["v"]},{"start":{"row":12,"column":12},"end":{"row":12,"column":13},"action":"insert","lines":["o"]},{"start":{"row":12,"column":13},"end":{"row":12,"column":14},"action":"insert","lines":["l"]},{"start":{"row":12,"column":14},"end":{"row":12,"column":15},"action":"insert","lines":["u"]},{"start":{"row":12,"column":15},"end":{"row":12,"column":16},"action":"insert","lines":["m"]},{"start":{"row":12,"column":16},"end":{"row":12,"column":17},"action":"insert","lines":["e"]}],[{"start":{"row":12,"column":17},"end":{"row":12,"column":18},"action":"insert","lines":[" "],"id":70},{"start":{"row":12,"column":18},"end":{"row":12,"column":19},"action":"insert","lines":["t"]},{"start":{"row":12,"column":19},"end":{"row":12,"column":20},"action":"insert","lines":["o"]}],[{"start":{"row":12,"column":20},"end":{"row":12,"column":21},"action":"insert","lines":[" "],"id":71},{"start":{"row":12,"column":21},"end":{"row":12,"column":22},"action":"insert","lines":["d"]},{"start":{"row":12,"column":22},"end":{"row":12,"column":23},"action":"insert","lines":["o"]},{"start":{"row":12,"column":23},"end":{"row":12,"column":24},"action":"insert","lines":["c"]},{"start":{"row":12,"column":24},"end":{"row":12,"column":25},"action":"insert","lines":["k"]},{"start":{"row":12,"column":25},"end":{"row":12,"column":26},"action":"insert","lines":["e"]},{"start":{"row":12,"column":26},"end":{"row":12,"column":27},"action":"insert","lines":["r"]}],[{"start":{"row":12,"column":27},"end":{"row":12,"column":28},"action":"insert","lines":[" "],"id":72},{"start":{"row":12,"column":28},"end":{"row":12,"column":29},"action":"insert","lines":["c"]},{"start":{"row":12,"column":29},"end":{"row":12,"column":30},"action":"insert","lines":["o"]}],[{"start":{"row":12,"column":28},"end":{"row":12,"column":30},"action":"remove","lines":["co"],"id":73},{"start":{"row":12,"column":28},"end":{"row":12,"column":37},"action":"insert","lines":["container"]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":12,"column":37},"end":{"row":12,"column":37},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1652684956696}