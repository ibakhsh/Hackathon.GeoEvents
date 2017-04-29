
_.templateSettings = {
      evaluate : /\{\[([\s\S]+?)\]\}/g,
      interpolate : /\{\{([\s\S]+?)\}\}/g
};



_.mixin({
  toJson: function(string) {
    var result = string;
    try {
        result = JSON.parse(result);
    } catch (e) {
    }
    return result;
  },
  findAttribute: function(elementId,attribute){
    var element = document.getElementById(elementId);
    var result = undefined;
    if(element !== undefined){
        for (var i = 0; i < element.attributes.length; i++){
            // Store reference to current attr
            var attr = element.attributes[i];
            // If attribute nodeName starts with 'attribute'
            if(attr.nodeName.startsWith(attribute)){
                var keyVal = attr.nodeValue;
                if(keyVal.toString().length <1){
                    result= true;
                } else {
                    result= keyVal.toString();
                }
            }
          //console.log(attr.nodeName+i+" Done.");
        }
    }
    return result;
    },
    whereLike:function(data,search){
        var dataA = data;

        //if(!_.isArray(dataA)) dataA = [dataA];

        
        var result = _.filter(dataA, function (obj) {
            return _.values(obj).some(function (el) {
                //return el.indexOf(searchStr) > -1;
                return el.match(search) !== null;
            });
        });
        return result;
    },
    likeFrom:function(searchText,data){
        var dataA = data;

        if(!_.isArray(dataA)) dataA = [dataA];
        
        var searchStr=searchText;

        var searchStr1 = searchStr;
        searchStr1 = searchStr1.replace(/٪/g,"%");
        searchStr1 = searchStr1.replace(/٠/g,"0");
        searchStr1 = searchStr1.replace(/١/g,"1");
        searchStr1 = searchStr1.replace(/٢/g,"2");
        searchStr1 = searchStr1.replace(/٣/g,"3");
        searchStr1 = searchStr1.replace(/٤/g,"4");
        searchStr1 = searchStr1.replace(/٥/g,"5");
        searchStr1 = searchStr1.replace(/٦/g,"6");
        searchStr1 = searchStr1.replace(/٧/g,"7");
        searchStr1 = searchStr1.replace(/٨/g,"8");
        searchStr1 = searchStr1.replace(/٩/g,"9");
        
        searchStr1 = searchStr1.replace(/%/g,".*");
        searchStr1 = searchStr1.replace(/_/g,".");
        //console.log("search text:"+searchStr1);
        var search = new RegExp(searchStr1, 'g');
        
        return this.whereLike(dataA,search);

    },
    inArray:function(obj,array){
        _.each(array,function(row){
           if(_(obj).isEqual(row)) return true; 
        });
        return false;
    },
    fetchRange:function(list,fromIndex,fetchLength,callback){
        var s = fromIndex;
        var l = fetchLength;
        
        var newList = [];

        for(var i=s;i<s+l & i<list.length;i++){
          newList.push(list[i]);
        }
        if(callback === undefined) {
            return newList;
        } else {
            callback(newList);
        }
    },
    arrayOf: function(mainObj,att){
        var newArray = [];
        _(mainObj).each(function(row){
          if(row[att] !== undefined) newArray.push(row[att]);
        });
        return newArray;
    }
});





var Song = Backbone.Model.extend({
  defaults: {
    name: "Not specified",
    artist: "Not specified"
  },
  initialize: function(){
      console.log("Music is the answer");
  }
});

var Album = Backbone.Collection.extend({
  model: Song,
  initialize: function(){
      console.log("Music is the answer");
  },
  render: function() { 
        var template = _.template($("#event_template").html());
        var action = "";
        var params = {};
        //this.$el.append(template(this.lovmodel.attributes));
  },events: {
           "click .inputLovBtn": "inputLovBtnClick",
          /* "click .lov_hyperlink": "selectOneRow",
           "click .command_hyper_link": "getMoreRows",
           "click .keySearch": "searchRows",
           "keyup .keySearchInput": "searchRows",
           "keyup .keySearchInput ":"resetSearch",
           "click .lov_Clear":"clearSelection"*/
           },
});

var song1 = new Song({ name: "How Bizarre", artist: "OMC" });
var song2 = new Song({ name: "Sexual Healing", artist: "Marvin Gaye" });
var song3 = new Song({ name: "Talk It Over In Bed", artist: "OMC" });

var myAlbum = new Album([ song1, song2, song3]);
