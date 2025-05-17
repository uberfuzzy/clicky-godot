extends VBoxContainer

func _on_b_buy_wallet_ready() -> void:
	var upgrade_size = get_parent().walletA_upgrade_size
	var upgrade_cost = get_parent().walletA_upgrade_cost
	$b_buy_wallet.text = $b_buy_wallet.get_meta("format") % [upgrade_size, upgrade_cost]

func _on_b_buy_wallet2_ready() -> void:
	var upgrade_size = get_parent().walletB_upgrade_size
	var upgrade_cost = get_parent().walletB_upgrade_cost
	$b_buy_wallet2.text = $b_buy_wallet2.get_meta("format") % [upgrade_size, upgrade_cost]

func _on_b_buy_5_ready() -> void:
	$b_buy5.text = $b_buy5.get_meta("format") % [$b_buy5.get_meta("cost")]

func _on_b_buy_10_ready() -> void:
	$b_buy10.text = $b_buy10.get_meta("format") % [$b_buy10.get_meta("cost")]

func _on_button_pressed_buy5() -> void:
	get_parent().dec_value($b_buy5.get_meta("cost"))
	$b_buy5.hide()
	%cont_clickers/b_go_up5.disabled = false

func _on_button_pressed_buy10() -> void:
	get_parent().dec_value($b_buy10.get_meta("cost"))
	$b_buy10.hide()
	%cont_clickers/b_go_up10.disabled = false

func _on_b_buy_walletA_pressed() -> void:
	get_parent().walletA_upgrades[0] += 1
	$b_buy_wallet.tooltip_text = "%d / %d" % [get_parent().walletA_upgrades[0], get_parent().walletA_upgrades[1]]

	get_parent().dec_value(get_parent().walletA_upgrade_cost)
	get_parent().get_node("the_bar").max_value += get_parent().walletA_upgrade_size
	

	if (get_parent().walletA_upgrades[0] >= 2):
		get_parent().walletA_upgrade_cost = 20

	if (get_parent().walletA_upgrades[0] >= get_parent().walletA_upgrades[1]):
		get_parent().walletA_upgrades[0] = get_parent().walletA_upgrades[1]
		$b_buy_wallet2.visible = true
		$b_buy_wallet.disabled = true

func _on_b_buy_walletB_pressed() -> void:
	get_parent().walletB_upgrades[0] += 1
	$b_buy_wallet2.tooltip_text = "%d / %d" % [get_parent().walletB_upgrades[0], get_parent().walletB_upgrades[1]]

	get_parent().dec_value(get_parent().walletB_upgrade_cost)
	get_parent().get_node("the_bar").max_value += get_parent().walletB_upgrade_size

	if (get_parent().walletB_upgrades[0] >= get_parent().walletB_upgrades[1]):
		get_parent().walletB_upgrades[0] = get_parent().walletB_upgrades[1]
		$b_buy_wallet2.disabled = true
