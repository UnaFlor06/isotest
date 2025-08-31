extends Area2D

# --- VARIÁVEIS EXISTENTES ---
var velocidade = 400
var direcao = Vector2.DOWN # Começa andando para baixo
var direcoes_possiveis = [Vector2.UP, Vector2.DOWN, Vector2.LEFT, Vector2.RIGHT]

# --- ADIÇÕES PARA O PARRY ---
# 1. Referência ao nó do Sprite para podermos mudar a cor
@onready var sprite = $Sprite2D # <--- ADICIONADO (Certifique-se que o nome do seu nó de sprite é "Sprite2D")

# 2. Variável para saber se o tiro é do inimigo ou do jogador
var pertence_ao_jogador = false # <--- ADICIONADO

# --- FUNÇÕES EXISTENTES ---
func _ready():
	atualizar_rotacao()

func _process(delta):
	position += direcao * velocidade * delta

func _on_timer_timeout():
	# 3. MODIFICADO: Só muda de direção se NÃO foi rebatido pelo jogador
	if not pertence_ao_jogador:
		direcao = direcoes_possiveis.pick_random()
		atualizar_rotacao()

func atualizar_rotacao():
	# A correção "+ PI / 2" assume que o seu sprite original aponta para CIMA.
	rotation = direcao.angle() + PI / 2

# --- NOVA FUNÇÃO DE PARRY ---
# 4. Esta é a função que o seu personagem irá chamar quando o parry for bem-sucedido.
func rebater():
	direcao *= -1
	pertence_ao_jogador = true
	velocidade *= 1.5 
	sprite.modulate = Color.YELLOW
	atualizar_rotacao()
