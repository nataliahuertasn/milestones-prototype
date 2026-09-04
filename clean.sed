/<button id="tEmpty">Ver estado vacío<\/button>/d
s|      tR=document.getElementById('tReset'), tE=document.getElementById('tEmpty');|      tR=document.getElementById('tReset');|
s|toast('Data reset · every cell back to +')|toast('Data reset · no scopes, every cell back to +')|
/^tE.onclick=()=>{ showEmpty=!showEmpty; syncToggles(); go('proj'); };$/d
s|  // Los scopes de Milestones se muestran recogidos: sólo el consolidado, como un group de Excel.|  // Los scopes se muestran recogidos: sólo el consolidado, como un group de Excel.|
