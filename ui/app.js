window.addEventListener('message', function(e) {

    if (e.data.type == 'coordv3') {
        var node = document.createElement('textarea');
        var selection = document.getSelection();

        node.textContent = e.data.coords;
        document.body.appendChild(node);

        selection.removeAllRanges();
        node.select();
        document.execCommand('copy');

        selection.removeAllRanges();
        document.body.removeChild(node);

    } else if (e.data.type == 'coordv3b') {
        var node = document.createElement('textarea');
        var selection = document.getSelection();

        node.textContent = e.data.coords;
        document.body.appendChild(node);

        selection.removeAllRanges();
        node.select();
        document.execCommand('copy');

        selection.removeAllRanges();
        document.body.removeChild(node);
    } else if (e.data.type == 'coordv3bh') {
        var node = document.createElement('textarea');
        var selection = document.getSelection();

        node.textContent = e.data.coords;
        document.body.appendChild(node);

        selection.removeAllRanges();
        node.select();
        document.execCommand('copy');

        selection.removeAllRanges();
        document.body.removeChild(node);
    }

})