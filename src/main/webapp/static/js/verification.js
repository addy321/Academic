window.onload = function ()
{
	var oLock = document.getElementById("lock");
	var oBtn = oLock.getElementsByTagName("span")[0];
	var disX = 0;
	var maxL = oLock.clientWidth - oBtn.offsetWidth;//所要移动的宽度
	oBtn.onmousedown = function (e)
	{
		var e = e || window.event;
		disX = e.clientX - this.offsetLeft;
		
		document.onmousemove = function (e)
		{
			var e = e || window.event;
			var l = e.clientX - disX;
			
			l < 0 && (l = 0);
			l > maxL && (l = maxL);
			
			oBtn.style.left = l + "px"; 
			return false;
		};
		document.onmouseup = function ()
		{
			
			document.onmousemove = null;
			document.onmouseup = null;
			oBtn.releaseCapture && oBtn.releaseCapture();
			
			oBtn.offsetLeft > maxL / 2 ?
				startMove(maxL, function ()
				{
					oLock.style.background = "green";
					oLock.firstChild.style.color="#FFF"
					oLock.firstChild.textContent="OK"
				}) :
				startMove(0)
		};
		this.setCapture && this.setCapture();
		return false
	};
	function startMove (iTarget, onEnd)
	{
		clearInterval(oBtn.timer);
		oBtn.timer = setInterval(function ()
		{
			doMove(iTarget, onEnd)
		}, 30)
	}
	function doMove (iTarget, onEnd)
	{
		var iSpeed = (iTarget - oBtn.offsetLeft) / 5;
		iSpeed = iSpeed > 0 ? Math.ceil(iSpeed) : Math.floor(iSpeed);
		iTarget == oBtn.offsetLeft ? (clearInterval(oBtn.timer), onEnd && onEnd()) : oBtn.style.left = iSpeed + oBtn.offsetLeft + "px"
	}
};