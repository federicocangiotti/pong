@tool
class_name RT_Blink
extends RichTextEffect

var bbcode = "blink"


func _process_custom_fx(char_fx: CharFXTransform) -> bool:
	# Ottiene la frequenza passata nel BBCode (es. [blink freq=2.0]) o usa 2.0 come default
	var freq = char_fx.env.get("freq", 2.0)

	# Calcola il tempo corrente del carattere
	var time = char_fx.elapsed_time * freq

	# Usa il modulo fmod per creare un'onda quadra netta (acceso/spento)
	if fmod(time, 2.0) < 1.0:
		char_fx.color.a = 0.0 # Nasconde il carattere
	else:
		char_fx.color.a = 1.0 # Mostra il carattere

	return true
