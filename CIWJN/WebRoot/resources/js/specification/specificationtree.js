$(function(){
	$.extend($.fn.tree.methods, {
	    getLevel:function(jq,target){
	        var l = $(target).parentsUntil("ul.tree","ul");
	        return l.length+1;
	    }
	});
	insftrameworkTree();
})
function insftrameworkTree(){
	 $("#speTree").tree({  
         url:'insframework/getMachine',//请求路径
         onLoadSuccess:function(node,data){  
              var tree = $(this);  
              if(data){  
                  $(data).each(function(index,d) {  
                      if (this.state=='closed') {  
                          tree.tree('expandAll');  
                      }  
                  });  
              }  
         }
     });
}