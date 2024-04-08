extends Node3D
 
var webxr_interface

#################### 스크립트 5-3에서 추가 ####################
var right_selected_obj
var left_selected_obj
##########################################################


func _ready():
	webxr_interface = XRServer.find_interface("WebXR")

	# WebXR을 이용할 수 없으면 종료한다
	if not webxr_interface:
		return
	
	# "immersive-vr" 모드로 세션을 시작한다
	# _webxr_session_supported 메서드가 호출된다
	webxr_interface.is_session_supported("immersive-vr")

	# 세션 이벤트에 대한 콜백 함수를 등록한다
	webxr_interface.session_supported.connect(self._webxr_session_supported)
	webxr_interface.session_started.connect(self._webxr_session_started)
	webxr_interface.session_ended.connect(self._webxr_session_ended)
	webxr_interface.session_failed.connect(self._webxr_session_failed)
		
	# select 이벤트에 대한 콜백 함수를 등록한다
	webxr_interface.select.connect(self._webxr_on_select)
	webxr_interface.selectstart.connect(self._webxr_on_select_start)
	webxr_interface.selectend.connect(self._webxr_on_select_end)

	# squeeze 이벤트에 대한 콜백 함수를 등록한다
	webxr_interface.squeeze.connect(self._webxr_on_squeeze)
	webxr_interface.squeezestart.connect(self._webxr_on_squeeze_start)
	webxr_interface.squeezeend.connect(self._webxr_on_squeeze_end)

	$XROrigin3D/LeftController.button_pressed.connect(self._on_LeftController_button_pressed)
	$XROrigin3D/LeftController.button_released.connect(self._on_LeftController_button_release)
	$XROrigin3D/RightController.button_pressed.connect(self._on_RightController_button_pressed)
	$XROrigin3D/RightController.button_released.connect(self._on_RightController_button_release)


func _webxr_session_supported(session_mode: String, supported: bool):
	print("세션 지원: ", session_mode, supported)
	if session_mode != 'immersive-vr':
		return
		
	webxr_interface.session_mode = 'immersive-vr'
	webxr_interface.requested_reference_space_types = 'bounded-floor, local-floor, local'
	webxr_interface.required_features = 'local-floor'
	webxr_interface.optional_features = 'bounded-floor'
 
	if not webxr_interface.initialize():
		OS.alert("초기화 실패")
		return


func _webxr_session_started():
	get_viewport().arvr = true


func _webxr_session_ended():
	get_viewport().arvr = false


func _webxr_session_failed(message: String):
	OS.alert("_webxr_session_failed: " + message)


func _on_LeftController_button_pressed(button: String):
	print ("_on_LeftController_button_pressed: " + button)
	#################### 스크립트 5-3에서 추가 ####################
	var ray = $XROrigin3D/LeftController/RayCast3D
	if ray.is_colliding():
		left_selected_obj = ray.get_collider()
		left_selected_obj.change_color()
	##########################################################


func _on_LeftController_button_release(button: String):
	print ("_on_LeftController_button_release: " + button)
	#################### 스크립트 5-3에서 추가 ####################
	if left_selected_obj != null:
		left_selected_obj.change_color()
		left_selected_obj = null
	##########################################################


func _on_RightController_button_pressed(button: String):
	print ("_on_RightController_button_pressed: " + button)
	#################### 스크립트 5-3에서 추가 ####################
	var ray = $XROrigin3D/RightController/RayCast3D
	if ray.is_colliding():
		right_selected_obj = ray.get_collider()
		right_selected_obj.change_color()
	##########################################################


func _on_RightController_button_release(button: String):
	print ("_on_RightController_button_release: " + button)
	#################### 스크립트 5-3에서 추가 ####################
	if right_selected_obj != null:
		right_selected_obj.change_color()
		right_selected_obj = null
	##########################################################


func _webxr_on_select(controller_id: int):
	print("_webxr_on_select: " + str(controller_id))


func _webxr_on_select_start(controller_id: int):
	print("_webxr_on_select_start: " + str(controller_id))


func _webxr_on_select_end(controller_id: int):
	print("_webxr_on_select_end: " + str(controller_id))


func _webxr_on_squeeze(controller_id: int):
	print("_webxr_on_squeeze: " + str(controller_id))


func _webxr_on_squeeze_start(controller_id: int):
	print("_webxr_on_squeeze_start: " + str(controller_id))

 
func _webxr_on_squeeze_end(controller_id: int):
	print("_webxr_on_squeeze_end: " + str(controller_id))
