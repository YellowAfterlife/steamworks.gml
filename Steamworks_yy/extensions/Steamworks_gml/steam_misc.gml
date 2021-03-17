// NB! these are copied from /Steamworks_23 to other projects

#define steam_get_friends_game_info
/// ()->array<[user_id, game_id, lobby_id]>
var n = steam_get_friends_game_info_1();
var b = steam_gml_prepare_buffer(n * (8 * 3));
steam_get_friends_game_info_2(buffer_get_address(b));
var r = array_create(n);
for (var i = 0; i < n; i++) {
	var l_user_id = buffer_read(b, buffer_u64);
	var l_game_id = buffer_read(b, buffer_u64);
	var l_lobby_id = buffer_read(b, buffer_u64);
	r[i] = [l_user_id, l_game_id, l_lobby_id];
}
return r;

#define steam_get_app_ownership_ticket_data
/// (buffer, ?app_id)->[size_total, ofs_app_id, ofs_steam_id, ofs_signature, size_signature]
var l_buf = argument[0];
var l_app_id = argument_count > 1 ? argument[1] : steam_get_app_id();
var b = steam_gml_prepare_buffer(4 * 5);
buffer_seek(b, buffer_seek_start, 0);
buffer_write(b, buffer_u32, l_app_id);
buffer_write(b, buffer_u32, buffer_get_size(l_buf));
steam_get_app_ownership_ticket_data_raw(buffer_get_address(l_buf), buffer_get_address(b));
buffer_seek(b, buffer_seek_start, 0);
var r = array_create(5);
for (var i = 0; i < 5; i++) {
	r[i] = buffer_read(b, buffer_u32);
}
return r;

#define steam_user_request_encrypted_app_ticket
/// (?bufferOrStringToInclude, ?bufferToIncludeSize)
var l_data = argument_count > 0 ? argument[0] : undefined;
var l_size = argument_count > 1 ? argument[1] : undefined;
if (l_data == undefined) {
	l_data = "";
	l_size = 0;
} else if (is_string(l_data)) {
	if (l_size == undefined) l_size = string_byte_length(l_data);
} else {
	if (l_size == undefined) l_size = buffer_get_size(l_data);
	l_data = buffer_get_address(l_data);
}
return steam_user_request_encrypted_app_ticket_raw(l_data, l_size);