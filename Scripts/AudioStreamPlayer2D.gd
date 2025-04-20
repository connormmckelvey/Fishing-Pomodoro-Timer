extends Node

const AMT_OF_SOUND_CHANNELS = 10

var const_sound_channels: Array[AudioStreamPlayer2D]
var sound_channels: Array[AudioStreamPlayer2D]

func play_sound(sound_stream: AudioStreamMP3, never_clear: bool = false):
	if never_clear:
		var sc = AudioStreamPlayer2D.new()
		sc.autoplay = true
		sc.stream = sound_stream
		const_sound_channels.append(sc)
		add_child(sc)
	else:
		var sc = AudioStreamPlayer2D.new()
		sc.autoplay = true
		sc.stream = sound_stream
		if sound_channels.size() >= AMT_OF_SOUND_CHANNELS:
			var sc_to_remove = sound_channels[0]
			sound_channels.erase(sc_to_remove)
			sc_to_remove.queue_free()
		sound_channels.append(sc)
		add_child(sc)
