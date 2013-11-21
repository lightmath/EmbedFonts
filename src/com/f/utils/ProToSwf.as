package com.f.utils 
{
	import flash.display.Loader;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import org.flexlite.domUtils.FileUtil;

	public class ProToSwf
	{
		private var _data:String;
		/**
		 * 转码后的uniCode字符串 
		 */		
		private var _uniCodeStr:String;
		private var _saveCodeStr:String;
		
		public function ProToSwf()
		{
		}
		
		private var _language:String="";
		private var _filePath:String="";
		public function startDealFontLibrary(sFontLib:String, sData:String="", language:String=""):void
		{
			if(sData == "")return;
			
			_language = language;
			sData += "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ+-*/!@#$%^&*()";
			_uniCodeStr = UniCodeUtil.getUniCodeStr(sData);
			reCompile(sFontLib);
		}
		
		private function reCompile(sFilePath:String):void
		{
			var _codeStr:String = FileUtil.openAsString(sFilePath);
			var fontName:String = "FZSEJW.TTF";
			if(_language=="cn")
			{
				fontName = "FZSEJW.TTF";
			}
			else if(_language=="tw")
			{
				fontName = "TWPOP2.TTF";
			}
			var arr:Array = sFilePath.split("\\");
			arr.pop();
			arr.push(fontName);
			var sChang:String = arr.join('/');
			_codeStr = _codeStr.replace("FZSEJW.TTF",sChang);
			var codeArr:Array = _codeStr.split("unicodeRange");
			_saveCodeStr = codeArr[0]+"unicodeRange="+'"'+_uniCodeStr+'"'+",mimeType"+String(codeArr[1]).split("mimeType")[1];
			saveFontLibrary(sFilePath);
		}
		
		private function saveFontLibrary(sFilePath:String):void
		{
			var arr:Array = sFilePath.split('\\');
			var sFileName:String = arr[arr.length-1];
			arr.pop();
			arr.push(_language, sFileName);
			sFileName = arr.join('\\');
			FileUtil.save(sFileName, _saveCodeStr);
		}
		
	}
}