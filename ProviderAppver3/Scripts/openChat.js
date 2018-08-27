//Chris chat script
function OpenChat(pid) {
    var cid =  @Html.DisplayFor(m => m.CustomerID);
    $.get('/Chats/GetChatID', { cid: cid, pid: pid }, function (chatid) {
        if (chatid == 0) {
            $.post('/Chats/Create', { cid: cid, pid: pid }, function (chatid) {
                window.location.assign('/Chats/Details/' + chatid);
            })
        }
        window.location.assign('/Chats/Details/' + chatid);
    });

}