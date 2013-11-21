package com.f.utils
{
	import flash.utils.getTimer;

	public class UniCodeUtil
	{
		public function UniCodeUtil()
		{
		}
		
		public static function getUniCodeStr(str:String):String
		{
			var uniCodeArray:Array = str.split("");
			var returnArray:Array = [];
			for(var i:int = 0;i<uniCodeArray.length;i++)
			{
				var strCode:String = uniCodeArray[i];
				if(strCode==""&&strCode==" "){continue;}
				var uniCode:String = strCode.charCodeAt().toString(16);
				if(returnArray.indexOf("U+"+uniCode)<0)
				{
					returnArray.push("U+"+uniCode);
				}
			}
			return returnArray.join();
		}
		
		private static function removeDuplicate(arr:Array):Array
		{
			for( var i:int = 0; i < arr.length - 1; i++ ) {
				
				for( var j:int = i + 1; j < arr.length; j++ ) {
					if( arr[i] == arr[j] ) {
						arr.splice( j, 1 );
						j -= 1;
					}
				}
			}
			return arr;
		}
	}
}