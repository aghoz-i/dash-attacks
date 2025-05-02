[Itch.io](https://suisui47.itch.io/dash-attack)
```
contoh finite state machine: (amburadul)
── scripts/
   ├─ state.gd         (interface state,         diextend sama state dari suatu machine)
   ├─ state_machine.gd (interface state machine, diextend sama state machine master)
   └── player/
       ├─ player.gd
       ├─ animation_state.gd    (extend state_machine.gd, harusnya di dalam animation_movement)
       ├─ animation_movement/
       │  ├── idle.gd (extend state.gd)
       │  ├── walk.gd
       │  ├── dash.gd
       │  ├── attack.gd
       │  ├── skill.gd
       │  ├── hurt.gd
       │  ├── death.gd
       │  └── disabled.gd 
       ├─ dash_state/
       │  ├── dash_state.gd  (extend state_machine.gd)
       │  ├── dash_ready.gd  (extend state.gd)
       │  ├── second_dash_ready.gd  
       │  └── dash_cooldown.gd
       └─ skill_state/
          ├── skill_state.gd     (extend state_machine.gd)
          ├── skill_ready.gd     (extend state.gd)
          └── skill_cooldown.gd
```
