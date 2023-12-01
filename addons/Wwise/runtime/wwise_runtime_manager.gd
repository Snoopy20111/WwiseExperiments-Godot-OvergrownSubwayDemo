extends Node


func _init():
	Wwise.init()
	Wwise.load_bank("Init")
	#Wwise.load_bank_id(AK.BANKS.INIT)
	print(AK.AUDIO_DEVICES._dict)
	print(AK.AUDIO_DEVICES.SYSTEM)


func _enter_tree():
	get_tree().connect("process_frame", Callable(Wwise, "render_audio"))


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST || what == NOTIFICATION_CRASH:
		Wwise.shutdown()
