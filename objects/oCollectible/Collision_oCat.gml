variable_struct_set(global.collectibles,variableName,1)
scrPlaySound(sfxCollect);
var _this = instance_create_layer(0,0,layer,oPickupBroadcast);

instance_destroy();