class_name Prop_Pickup
extends Prop

signal item_was_picked

@export var inventory_item_data: InventoryItemData
@export var item_model_height: float

var dropped_in_puzzle_slot: PuzzleSlot = null


func _interacted():
	item_was_picked.emit()
	if inventory_item_data.is_reusable:
		if not InventorySystem.inventory_items.has(inventory_item_data):
			InventorySystem.add_item(inventory_item_data)
	else:
		InventorySystem.add_item(inventory_item_data)

	if dropped_in_puzzle_slot != null:
		dropped_in_puzzle_slot.item_removed(inventory_item_data)

	queue_free()
