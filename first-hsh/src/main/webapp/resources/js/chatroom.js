var CreateProxy = function(wsUri) {
	var websocket = null;
	var elements = null;
	
	var showMsgPanel = function() {
			elements.loginPanel.style.display = "none";
			elements.msgPanel.style.display = "block";
			elements.txtMsg.focus();
	};
			
	var hideMsgPanel = function() {
			elements.loginPanel.style.display = "block";
			elements.msgPanel.style.display = "none";
	};
	
	var displayMessage = function(msg) {
		if (elements.msgContainer.childNodes.length == 100) {
			elements.msgContainer.removeChild(elements.msgContainer.childNodes[0]);
		}
		
		var div = document.createElement('div');
		div.className = 'msgrow';
		div.innerHTML = msg;
		console.log(div);
		elements.msgContainer.appendChild(div);
		
		elements.msgContainer.scrollTop = elements.msgContainer.scrollHeight;
	};
	
	var clearMessage = function() {
		elements.msgContainer.innerHTML = '';
	};
	
	return {
		enterRoom: function(email) {
			
			var name = email;
			if (name == '') { return; }
			
			
			// Initiate the socket and set up the events
			if (websocket == null) {
		    	websocket = new WebSocket(wsUri);
		    	
		    	websocket.onopen = function() {
		    		var message = { messageType: 'LOGIN', message: name };
		    		websocket.send(JSON.stringify(message));
		        };
		        websocket.onmessage = function(e) {
		        	displayMessage(e.data);
		        	showMsgPanel();
		        };
		        websocket.onerror = function(e) {};
		        websocket.onclose = function(e) {
		        	websocket = null;
		        	clearMessage();
		        	hideMsgPanel();
		        	window.close();
		        };
			}
		},
		sendMessage: function() {
			elements.txtMsg.focus();

			if (websocket != null && websocket.readyState == 1) {
				var input = elements.txtMsg.value;
				if (input == '\n') { elements.txtMsg.value = ''; return; }
				
				elements.txtMsg.value = '';
				
				//msga.replace(/<br\s?\/?>/g,"\n"); 엔터 줄바꿈으로 치환하는 곳 Jquery로 할경우 이상하게 Value 가 null이 됨
				//아마도 $(document).read 이것과 관련이 있을듯 하다.
				var message = { messageType: 'MESSAGE', message: input };
				
				// Send a message through the web-socket
				websocket.send(JSON.stringify(message));
			}
		},
		login_keyup: function(e) { if (e.keyCode == 13) { this.login(); } },
		sendMessage_keyup: function(e) { 
			if (e.keyCode == 13) { 
		        if(e.shiftKey){
		        	 e.preventDefault();
		        }
		        else
				{ 
		        	this.sendMessage(); 
		        } 
			}
		},
		logout: function() {
			if (websocket != null && websocket.readyState == 1) { websocket.close();}
		},
		initiate: function(e) {
			elements = e;
		}
	}
};