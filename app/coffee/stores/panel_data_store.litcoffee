# /*
#  * Copyright (c) 2014, Facebook, Inc.
#  * All rights reserved.
#  *
#  * This source code is licensed under the BSD-style license found in the
#  * LICENSE file in the root directory of this source tree. An additional grant
#  * of patent rights can be found in the PATENTS file in the same directory.
#  *

#  * TodoStore
#  */

    # Dispatcher = require('../dispatcher/Dispatcher');
    EventEmitter = require('events').EventEmitter;
    assign = require('object-assign');

    _data = {

      panel_preview: {
        "h"   :138.44843049327352,
        "w"   :110,
        "rows":[[1]]
      }

      panel_layout: {
        "panel_aspect"  :[1],
        "n_panel_labels":[2],
        "nrow"          :[1],
        "ncol"          :[1],
        "cdName"        :["list_vs_time_ggplot"],
        "cdGroup"       :["fields"]
      }

      active_cognostics: {
        "cog":[
          {
            "groupName":["panelKey"],
            "data":[
              {
                "name":"panelKey",
                "desc":"panel key",
                "active":"active",
                "selectable":""
              }
            ]
          },
          {
            "groupName":["condVar"],
            "data":[
              {
                "name":"county",
                "desc":"conditioning variable",
                "active":"active",
                "selectable":"selectable"
              },
              {
                "name":"state",
                "desc":"conditioning variable",
                "active":"active",
                "selectable":"selectable"
              }
            ]
          },
          {
            "groupName":["common"],
            "data": [
              {
                "name":"slope",
                "desc":"list price slope",
                "active":"active",
                "selectable":"selectable"
              },
              {
                "name":"meanList",
                "desc":"mean",
                "active":"active",
                "selectable":"selectable"
              },
              {
                "name":"meanSold",
                "desc":"mean",
                "active":"active",
                "selectable":"selectable"
              },
              {
                "name":"nObs",
                "desc":"number of non-NA list prices",
                "active":"active",
                "selectable":"selectable"
              },
              {
                "name":"zillowHref",
                "desc":"zillow link",
                "active":"",
                "selectable":"selectable"
              }
            ]
          }
        ],
        "cdName":["list_vs_time_ggplot"],
        "cdGroup":["fields"]
      }


      panel_function: {
        "code":[
          "panelFn <-\nstructure(function(x) {\n  x %>%\n    select(time, medListPriceSqft, medSoldPriceSqft) %>%\n    gather(key = \"variable\", value = \"value\", medListPriceSqft, medSoldPriceSqft, -time) %>%\n    ggplot(aes(x = time, y = value, color = variable)) + \n      geom_smooth() + \n      geom_point() + \n      ylim(yRanges) + \n      labs(y = \"Price / Sq. Ft.\")\n}, class = c(\"function\", \"ggplotFn\"))"
        ],
        "cdName":["list_vs_time_ggplot"],
        "cdGroup":["fields"]
      }

      panel_labels: {
        "cog":[
          {
            "groupName":["panelKey"],
            "data":[
              {
                "name":"panelKey",
                "desc":"panel key",
                "active":"",
                "selectable":""
              }
            ]
          },
          {
            "groupName":["condVar"],
            "data":[
              {
                "name":"county",
                "desc":"conditioning variable",
                "active":"active",
                "selectable":"selectable"
              },
              {
                "name":"state",
                "desc":"conditioning variable",
                "active":"active",
                "selectable":"selectable"
              }
            ]
          },
          {
            "groupName":["common"],
            "data": [
              {
                "name":"slope",
                "desc":"list price slope",
                "active":"",
                "selectable":"selectable"
              },
              {
                "name":"meanList",
                "desc":"mean",
                "active":"",
                "selectable":"selectable"
              },
              {
                "name":"meanSold",
                "desc":"mean",
                "active":"",
                "selectable":"selectable"
              },
              {
                "name":"nObs",
                "desc":"number of non-NA list prices",
                "active":"",
                "selectable":"selectable"
              },
              {
                "name":"zillowHref",
                "desc":"zillow link",
                "active":"",
                "selectable":"selectable"
              }
            ]
          }
        ],
        "cdName":["list_vs_time_ggplot"],
        "cdGroup":["fields"]
      }

      related_displays: [
        {
          "group":["fields"],
          "name":["list_vs_time_ggplot"],
          "desc":["List and sold priceover time w/ggplot2"],
          "n":[2854],
          "panelFnType":["ggplotFn"],
          "preRender":[false],
          "dataClass":["kvMemory"],
          "cogClass":["dfCogConn"],
          "height":[500],
          "width":[500],
          "updated":["2015-02-24 00:09:02"],
          "keySig":["3c0323ad34e3384ebc3526fc47e0d6ee"],
          "thumb":["<img src =\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAYAAAA5ZDbSAAAD8GlDQ…1GeF1bxzn31byX1X/zKN5TfCfSVlcref1EB1X1T8z9/8BkyrT7wVc+CQAAAAASUVORK5CYII=\" style=\"max-height: 60px; max-width: 80px\">"]
        },{
          "group":["fields"],
          "name":["list_vs_time_ex1"],
          "desc":["Example 1"],
          "n":[2854],
          "panelFnType":["ggplotFn"],
          "preRender":[false],
          "dataClass":["kvMemory"],
          "cogClass":["dfCogConn"],
          "height":[500],
          "width":[500],
          "updated":["2015-02-24 00:09:49"],
          "keySig":["3c0323ad34e3384ebc3526fc47e0d6ee"],
          "thumb":["<img src =\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAYAAAA5ZDbSAAAD8GlDQ…1GeF1bxzn31byX1X/zKN5TfCfSVlcref1EB1X1T8z9/8BkyrT7wVc+CQAAAAASUVORK5CYII=\" style=\"max-height: 60px; max-width: 80px\">"]
        },{
          "group":["fields"],
          "name":["list_vs_time_ex2"],
          "desc":["Example 2"],
          "n":[2854],
          "panelFnType":["ggplotFn"],
          "preRender":[false],
          "dataClass":["kvMemory"],
          "cogClass":["dfCogConn"],
          "height":[500],
          "width":[500],
          "updated":["2015-02-24 00:10:09"],
          "keySig":["3c0323ad34e3384ebc3526fc47e0d6ee"],
          "thumb":["<img src =\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAYAAAA5ZDbSAAAD8GlDQ…1GeF1bxzn31byX1X/zKN5TfCfSVlcref1EB1X1T8z9/8BkyrT7wVc+CQAAAAASUVORK5CYII=\" style=\"max-height: 60px; max-width: 80px\">"]
        }
      ]

      table_sort_filter: {
        "data": [
          ["f32c268a31cbf28539c8cf072c779603","Abbeville County","SC","-0.0002323686"," 72.76927","     NaN","66","<a href=\"http://www.zillow.com/homes/Abbeville-County-SC_rb/\" target=\"_blank\">link</a>"],
          ["6d0aed04a9541b62f5aefbcde71cb6ca","Acadia Parish","LA"," 0.0019518441"," 68.11082","     NaN","66","<a href=\"http://www.zillow.com/homes/Acadia-Parish-LA_rb/\" target=\"_blank\">link</a>"],
          ["129ae32fa0564a4ac140e61c65c4594f","Accomack County","VA","-0.0092717711","123.79215","     NaN","66","<a href=\"http://www.zillow.com/homes/Accomack-County-VA_rb/\" target=\"_blank\">link</a>"],
          ["020214de1fcd7776783b59d6899efd0e","Ada County","ID","-0.0030197554","100.83173","     NaN","66","<a href=\"http://www.zillow.com/homes/Ada-County-ID_rb/\" target=\"_blank\">link</a>"],
          ["bd0be9bf64cbfd4b93c39727dbdc860e","Adair County","IA","-0.0308381951"," 65.79008","     NaN","64","<a href=\"http://www.zillow.com/homes/Adair-County-IA_rb/\" target=\"_blank\">link</a>"],
          ["7375657b1f0631ce0f4586566aeec31b","Adair County","KY"," 0.0034399585"," 68.54389","     NaN","61","<a href=\"http://www.zillow.com/homes/Adair-County-KY_rb/\" target=\"_blank\">link</a>"],
          ["c9289e3bc260dee53fcf61108a3f6305","Adair County","MO"," 0.0009860560"," 69.03997","     NaN","66","<a href=\"http://www.zillow.com/homes/Adair-County-MO_rb/\" target=\"_blank\">link</a>"],
          ["cf26b5baf7477d55cf5a8b5b564cdf9f","Adair County","OK","-0.0048414082"," 69.12551","     NaN","66","<a href=\"http://www.zillow.com/homes/Adair-County-OK_rb/\" target=\"_blank\">link</a>"],
          ["68f7eb7646aa81e47442ee4fec8e1cc6","Adams County","CO"," 0.0219767578","113.26757","121.6475","66","<a href=\"http://www.zillow.com/homes/Adams-County-CO_rb/\" target=\"_blank\">link</a>"],
          ["dd257b77bde1844c3101659b3156152a","Adams County","ID","-0.0362570575","112.44364","     NaN","66","<a href=\"http://www.zillow.com/homes/Adams-County-ID_rb/\" target=\"_blank\">link</a>"
          ]
        ],
        "filter": [
          {
            "i": [1],
            "name": ["panelKey"],
            "levels": [""],
            "disabled": ["disabled"]
          },
          {
            "i": [2],
            "name": ["county"],
            "levels": [""],
            "disabled": ["disabled"]
          },
          {
            "i": [3],
            "name": ["state"],
            "levels": ["AL","AR","AZ","CA","CO","CT","DC","DE","FL","GA","IA","ID","IL","IN","KS","KY","LA","MA","MD","ME","MI","MN","MO","MS","MT","NC","ND","NE","NH","NJ","NM","NV","NY","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VA","VT","WA","WI","WV","WY"],
            "disabled": [""]
          },
          {
            "i": [4],
            "name": ["slope"],
            "numeric": [true]
          },
          {
            "i": [5],
            "name": ["meanList"],
            "numeric": [true]
          },
          {
            "i": [6],
            "name": ["meanSold"],
            "numeric": [true]
          },
          {
            "i": [7],
            "name": ["nObs"],
            "numeric": [true]
          },
          {
            "i": [8],
            "name": ["zillowHref"],
            "levels": [""],
            "disabled": ["disabled"]
          }
        ],
        "plotDat": [
          {
            "name": ["panelKey"]
          },
          {
            "name": ["county"],
            "id": [1]
          },
          {
            "name": ["state"],
            "type": ["character"],
            "data": [
              {"label": "DC","ydat": 1,"xdat": 1},
              {"label": "DE","ydat": 3,"xdat": 2},
              {"label": "RI","ydat": 5,"xdat": 3},
              {"label": "CT","ydat": 8,"xdat": 4},
              {"label": "NH","ydat": 10,"xdat": 5},
              {"label": "MA","ydat": 14,"xdat": 6},
              {"label": "VT","ydat": 14,"xdat": 7},
              {"label": "AZ","ydat": 15,"xdat": 8},
              {"label": "NV","ydat": 15,"xdat": 9},
              {"label": "ME","ydat": 16,"xdat": 10},
              {"label": "NJ","ydat": 21,"xdat": 11},
              {"label": "ND","ydat": 23,"xdat": 12},
              {"label": "WY","ydat": 23,"xdat": 13},
              {"label": "MD","ydat": 24,"xdat": 14},
              {"label": "UT","ydat": 27,"xdat": 15},
              {"label": "NM","ydat": 30,"xdat": 16},
              {"label": "SD","ydat": 35,"xdat": 17},
              {"label": "OR","ydat": 36,"xdat": 18},
              {"label": "WA","ydat": 39,"xdat": 19},
              {"label": "MT","ydat": 42,"xdat": 20},
              {"label": "ID","ydat": 43,"xdat": 21},
              {"label": "SC","ydat": 46,"xdat": 22},
              {"label": "NE","ydat": 50,"xdat": 23},
              {"label": "WV","ydat": 55,"xdat": 24},
              {"label": "CA","ydat": 58,"xdat": 25},
              {"label": "LA","ydat": 60,"xdat": 26},
              {"label": "CO","ydat": 61,"xdat": 27},
              {"label": "NY","ydat": 62,"xdat": 28},
              {"label": "AL","ydat": 64,"xdat": 29},
              {"label": "FL","ydat": 67,"xdat": 30},
              {"label": "PA","ydat": 67,"xdat": 31},
              {"label": "AR","ydat": 71,"xdat": 32},
              {"label": "OK","ydat": 72,"xdat": 33},
              {"label": "WI","ydat": 72,"xdat": 34},
              {"label": "MS","ydat": 73,"xdat": 35},
              {"label": "KS","ydat": 75,"xdat": 36},
              {"label": "MI","ydat": 83,"xdat": 37},
              {"label": "MN","ydat": 83,"xdat": 38},
              {"label": "OH","ydat": 88,"xdat": 39},
              {"label": "IN","ydat": 92,"xdat": 40},
              {"label": "TN","ydat": 95,"xdat": 41},
              {"label": "IA","ydat": 96,"xdat": 42},
              {"label": "IL","ydat": 99,"xdat": 43},
              {"label": "NC","ydat": 100,"xdat": 44},
              {"label": "KY","ydat": 111,"xdat": 45},
              {"label": "MO","ydat": 112,"xdat": 46},
              {"label": "VA","ydat": 133,"xdat": 47},
              {"label": "GA","ydat": 157,"xdat": 48},
              {"label": "TX","ydat": 208,"xdat": 49},
              {"label": "","ydat": 0,"xdat": 50}
            ],
            "plotType": ["bar"],
            "id": [1]
          },
          {
            "name": ["slope"],
            "type": ["numeric"],
            "data": [
              {"xdat": -0.4,"ydat": 1,"label": "(-0.4,-0.35]"},
              {"xdat": -0.35,"ydat": 0,"label": "(-0.35,-0.3]"},
              {"xdat": -0.3,"ydat": 0,"label": "(-0.3,-0.25]"},
              {"xdat": -0.25,"ydat": 0,"label": "(-0.25,-0.2]"},
              {"xdat": -0.2,"ydat": 0,"label": "(-0.2,-0.15]"},
              {"xdat": -0.15,"ydat": 2,"label": "(-0.15,-0.1]"},
              {"xdat": -0.1,"ydat": 18,"label": "(-0.1,-0.05]"},
              {"xdat": -0.05,"ydat": 1699,"label": "(-0.05,0]"},
              {"xdat": 0,"ydat": 1115,"label": "(0,0.05]"},
              {"xdat": 0.05,"ydat": 15,"label": "(0.05,0.1]"},
              {"xdat": 0.1,"ydat": 1,"label": "(0.1,0.15]"},
              {"xdat": 0.15,"ydat": 1,"label": "(0.15,0.2]"},
              {"xdat": 0.2,"ydat": 1,"label": "(0.2,0.25]"},
              {"xdat": 0.25,"ydat": 0,"label": "(0.25,0.3]"}
            ],
            "plotType": ["hist"],
            "id": [1]
          },
          {
            "name": ["meanList"],
            "type": ["numeric"],
            "data": [
              {"xdat": 0,"ydat": 2019,"label": "(0,100]"},
              {"xdat": 100,"ydat": 756,"label": "(100,200]"},
              {"xdat": 200,"ydat": 50,"label": "(200,300]"},
              {"xdat": 300,"ydat": 20,"label": "(300,400]"},
              {"xdat": 400,"ydat": 3,"label": "(400,500]"},
              {"xdat": 500,"ydat": 2,"label": "(500,600]"},
              {"xdat": 600,"ydat": 1,"label": "(600,700]"},
              {"xdat": 700,"ydat": 1,"label": "(700,800]"},
              {"xdat": 800,"ydat": 0,"label": "(800,900]"},
              {"xdat": 900,"ydat": 1,"label": "(900,1000]"},
              {"xdat": 1000,"ydat": 0,"label": "(1000,1100]"},
              {"xdat": 1100,"ydat": 1,"label": "(1100,1200]"},
              {"xdat": 1200,"ydat": 0,"label": "(1200,1300]"
              }
            ],
            "plotType": ["hist"],
            "id": [1]
          },
          {
            "name": ["meanSold"],
            "type": ["numeric"],
            "data": [
              {"xdat": 0,"ydat": 866,"label": "(0,100]"},
              {"xdat": 100,"ydat": 371,"label": "(100,200]"},
              {"xdat": 200,"ydat": 44,"label": "(200,300]"},
              {"xdat": 300,"ydat": 8,"label": "(300,400]"},
              {"xdat": 400,"ydat": 5,"label": "(400,500]"},
              {"xdat": 500,"ydat": 1,"label": "(500,600]"},
              {"xdat": 600,"ydat": 2,"label": "(600,700]"},
              {"xdat": 700,"ydat": 0,"label": "(700,800]"},
              {"xdat": 800,"ydat": 0,"label": "(800,900]"},
              {"xdat": 900,"ydat": 0,"label": "(900,1000]"},
              {"xdat": 1000,"ydat": 1,"label": "(1000,1100]"},
              {"xdat": 1100,"ydat": 0,"label": "(1100,1200]"}
            ],
            "plotType": ["hist"],
            "id": [1]
          },
          {
            "name": ["nObs"],
            "type": ["numeric"],
            "data": [
              {"xdat": 0,"ydat": 15,"label": "(0,5]"},
              {"xdat": 5,"ydat": 23,"label": "(5,10]"},
              {"xdat": 10,"ydat": 24,"label": "(10,15]"},
              {"xdat": 15,"ydat": 36,"label": "(15,20]"},
              {"xdat": 20,"ydat": 38,"label": "(20,25]"},
              {"xdat": 25,"ydat": 27,"label": "(25,30]"},
              {"xdat": 30,"ydat": 25,"label": "(30,35]"},
              {"xdat": 35,"ydat": 28,"label": "(35,40]"},
              {"xdat": 40,"ydat": 41,"label": "(40,45]"},
              {"xdat": 45,"ydat": 30,"label": "(45,50]"},
              {"xdat": 50,"ydat": 52,"label": "(50,55]"},
              {"xdat": 55,"ydat": 66,"label": "(55,60]"},
              {"xdat": 60,"ydat": 115,"label": "(60,65]"},
              {"xdat": 65,"ydat": 2334,"label": "(65,70]"},
              {"xdat": 70,"ydat": 0,"label": "(70,75]"}
            ],
            "plotType": ["hist"],
            "id": [1]
          },
          {
            "name": ["zillowHref"]
          }
        ],
        "cogInfo": [
          {
            "name": "panelKey",
            "desc": "panel key",
            "type": "key",
            "group": "panelKey",
            "defLabel": false,
            "defActive": true,
            "filterable": false,
            "index": 0,
            "active": ""
          },
          {
            "name": "county",
            "desc": "conditioning variable",
            "type": "factor",
            "group": "condVar",
            "defLabel": true,
            "defActive": true,
            "filterable": true,
            "index": 1,
            "active": "active"
          },
          {
            "name": "state",
            "desc": "conditioning variable",
            "type": "factor",
            "group": "condVar",
            "defLabel": true,
            "defActive": true,
            "filterable": true,
            "index": 2,
            "active": "active"
          },
          {
            "name": "slope",
            "desc": "list price slope",
            "type": "numeric",
            "group": "common",
            "defLabel": false,
            "defActive": true,
            "filterable": true,
            "index": 3,
            "active": "active"
          },
          {
            "name": "meanList",
            "desc": "mean",
            "type": "numeric",
            "group": "common",
            "defLabel": false,
            "defActive": true,
            "filterable": true,
            "index": 4,
            "active": "active"
          },
          {
            "name": "meanSold",
            "desc": "mean",
            "type": "numeric",
            "group": "common",
            "defLabel": false,
            "defActive": true,
            "filterable": true,
            "index": 5,
            "active": "active"
          },
          {
            "name": "nObs",
            "desc": "number of non-NA list prices",
            "type": "numeric",
            "group": "common",
            "defLabel": false,
            "defActive": true,
            "filterable": true,
            "index": 6,
            "active": "active"
          },
          {
            "name": "zillowHref",
            "desc": "zillow link",
            "type": "href",
            "group": "common",
            "defLabel": false,
            "defActive": false,
            "filterable": false,
            "index": 7,
            "active": ""
          }
        ],
        "cdName": ["list_vs_time_ggplot"],
        "cdGroup": ["fields"],
        "cogTableInfo": ["Showing entries 1 - 8 of 2854"],
        "curPage": ["1"],
        "nPages": [357]
      }

      table_sort_filter_table_data: {
        data: [
          ["90569263d2ec8a65ac8b53d1e5461a07", "New York County", "NY", " 0.24381422", "1, 113.3065", "1, 089.4203", "66", "<a href=\"http://www.zillow.com/homes/New-York-County-NY_rb/\" target=\"_blank\">link</a>"],
          ["7f6b19db4e4126a143f12eee9635ae16", "Pitkin County", "CO", "-0.13069888", "  974.0950", "  633.3455", "66", "<a href=\"http://www.zillow.com/homes/Pitkin-County-CO_rb/\" target=\"_blank\">link</a>"],
          ["6f510e513a04969d53a7ec54ac3800ee", "San Francisco County", "CA", " 0.06055234", "  621.4392", "  613.6258", "66", "<a href=\"http://www.zillow.com/homes/San-Francisco-County-CA_rb/\" target=\"_blank\">link</a>"],
          ["e39c8b5695552db12685f22ba2c51c37", "Nantucket County", "MA", " 0.03471048", "  782.9074", "  580.0859", "66", "<a href=\"http://www.zillow.com/homes/Nantucket-County-MA_rb/\" target=\"_blank\">link</a>"],
          ["18d708d9e9038b690d464b608084c816", "San Mateo County", "CA", " 0.03888976", "  477.7878", "  468.0975", "66", "<a href=\"http://www.zillow.com/homes/San-Mateo-County-CA_rb/\" target=\"_blank\">link</a>"],
          ["dc588e53b71b095228ccbeb5bf30eae4", "Kings County", "NY", " 0.02800599", "  394.7913", "  439.2974", "66", "<a href=\"http://www.zillow.com/homes/Kings-County-NY_rb/\" target=\"_blank\">link</a>"],
          ["bef7faf7f10ad51d590eeb881fbe4da1", "District of Columbia", "DC", " 0.08214633", "  369.0546", "  422.4744", "66", "<a href=\"http://www.zillow.com/homes/District-of-Columbia-DC_rb/\" target=\"_blank\">link</a>"],
          ["2b644dde95e6fc316f64886e8a1fb98f", "Arlington County", "VA", " 0.05094490", "  392.5216", "  405.0898", "66", "<a href=\"http://www.zillow.com/homes/Arlington-County-VA_rb/\" target=\"_blank\">link</a>"],
          ["e7921035989220e2e936de96e015376a", "Marin County", "CA", " 0.01548178", "  459.8318", "  404.5228", "66", "<a href=\"http://www.zillow.com/homes/Marin-County-CA_rb/\" target=\"_blank\">link</a>"],
          ["07548a2b21a185c6549830409769b69b", "Santa Clara County", "CA", " 0.02597571", "  372.2678", "  370.3444", "66", "<a href=\"http://www.zillow.com/homes/Santa-Clara-County-CA_rb/\" target=\"_blank\">link</a>"]
        ]
      }

      univariateFilter:  {
        "cogs": [
          {
            "name": "slope",
            "desc": "list price slope",
            "type": "numeric",
            "group": "common",
            "defLabel": false,
            "defActive": true,
            "filterable": true
          },
          {
            "name": "meanList",
            "desc": "mean",
            "type": "numeric",
            "group": "common",
            "defLabel": false,
            "defActive": true,
            "filterable": true
          },
          {
            "name": "meanSold",
            "desc": "mean",
            "type": "numeric",
            "group": "common",
            "defLabel": false,
            "defActive": true,
            "filterable": true
          },
          {
            "name": "nObs",
            "desc": "number of non-NA list prices",
            "type": "numeric",
            "group": "common",
            "defLabel": false,
            "defActive": true,
            "filterable": true
          }
        ],
        "cdName": [
          "list_vs_time_ggplot"
        ],
        "cdGroup": [
          "fields"
        ]
      }
    }



    NavStore = assign {}, EventEmitter.prototype, {

      get_single_item_by_id: (id) ->
        return _data[id] or null

      # /**
      #  * Get the entire collection of view options
      #  * @return {array}
      #  */
      get_all: ->
        return _data

    }


    module.exports = NavStore;
