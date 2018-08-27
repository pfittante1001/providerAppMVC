function SCRate() {
    var totalRating = document.getElementById('providerRating').innerHTML.value;

    for (var i = 1; i <= totalRating; i++) {
        $("#sRate" + i).attr('class', 'starGlowN');
    }
}
$(function () {
    SCRate();
});