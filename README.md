# Pong

Implementazione base di Pong, sviluppata in **Godot Engine 4.x** (GDScript, rendering Forward+).

## Struttura del progetto

```
src/
├── autoloads/       # Singleton globali (GameManager, GlobalAudioManager, UIManager)
├── classes/         # Classi di supporto (Player)
├── components/       # Componenti riutilizzabili (Ball, Player scene)
├── scenes/
│   ├── menu/         # Schermata principale
│   ├── gameplay/      # Scena di gioco + UI in-game
│   └── game_over/     # Schermata di fine partita
└── ui/               # Risorse UI (temi, effetti blink, sfondi)
assets/
├── fonts/    # Font pixel (bit5x3, my_3x5_tiny_mono_pixel_font)
├── sounds/   # SFX (point_scored, racket_hit, wall_bounce)
└── sprites/  # Sprite della palla (Aseprite + PNG)
```

## Requisiti

- [Godot Engine 4.x](https://godotengine.org/download)
- [Cartella /assets/](https://drive.google.com/drive/folders/1slXvAT2ZLM5pUcy_FYH6ADT4FvI23Tb3?usp=sharing)

## Avvio

1. Clonare il repository
2. Aprire `project.godot` con Godot Engine
3. Eseguire la scena principale (F5)

## Crediti

- SFX generati con [ChipTone](https://sfbgames.itch.io/chiptone)

## Licenza

**MIT + Commons Clause**

Il codice del progetto è distribuito sotto MIT License + Commons Clause License Condition v1.0.

È consentito utilizzare, modificare, fare fork e distribuire il software. Non è consentito vendere il software, né fornire prodotti o servizi a pagamento il cui valore deriva interamente o sostanzialmente dalla funzionalità del software.
