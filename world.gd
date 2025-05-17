extends Node2D


var walletA_upgrades = [0,4];
var walletA_upgrade_cost = 10;
var walletA_upgrade_size = 10;
var walletB_upgrades = [0,2];
var walletB_upgrade_cost = 50;
var walletB_upgrade_size = 25;


func inc_value(n):
	var old:float = $the_bar.value
	var nu: float = old + float(n)
	$the_bar.value = nu
	
func dec_value(n):
	print ("dec %d" % n)
	$the_bar.value -= n
	
func _on_the_bar_changed() -> void:
	update_bar_disps()

func _on_the_bar_value_changed(_value: float) -> void:
	update_bar_disps()
	check_unlocks()

func update_bar_disps() -> void:
	$lbl_disp.text = str($the_bar.value) + "/" + str($the_bar.max_value)
	$lbl_disp2.text = str($the_bar.ratio)

func _on_button_reset_pressed() -> void:
	print("0 button pressed")
	$the_bar.value = 0



func check_unlocks():
	print ("========= starting check unlocks")
	
	print ("bar val:" + str($the_bar.value))
	var filled_perc:float = round($the_bar.ratio*100)
	print ("filled_perc is " + str(filled_perc))

	if($cont_shop/b_buy_wallet.visible):
		if((walletA_upgrades[0] < walletA_upgrades[1]) && $the_bar.value >= walletA_upgrade_cost):
			print("unlocking buy wallet")
			$cont_shop/b_buy_wallet.disabled = false
		else:
			print("locking buy wallet")
			$cont_shop/b_buy_wallet.disabled = true

	if($cont_shop/b_buy_wallet2.visible):
		if((walletB_upgrades[0] < walletB_upgrades[1]) && $the_bar.value >= walletB_upgrade_cost):
			print("unlocking buy wallet2")
			$cont_shop/b_buy_wallet2.disabled = false
		else:
			print("locking buy wallet")
			$cont_shop/b_buy_wallet2.disabled = true

	if($cont_shop/b_buy5.visible):
		if($the_bar.value >= $cont_shop/b_buy5.get_meta("cost")):
			$cont_shop/b_buy5.disabled = false
		else:
			$cont_shop/b_buy5.disabled = true

	if($cont_shop/b_buy10.visible):
		if($the_bar.value >= $cont_shop/b_buy10.get_meta("cost")):
			$cont_shop/b_buy10.disabled = false
		else:
			$cont_shop/b_buy10.disabled = true
	pass
	
