{CompositeDisposable} = require 'atom'
OneLiner = require '../lib/one-liner'

module.exports =
    subscriptions: null

    activate: (state) ->
        @subscriptions = new CompositeDisposable
        @subscriptions.add atom.commands.add 'atom-workspace', 'one-liner:run': => @run()

    deactivate: ->
        @subscriptions.dispose()

    run: ->
        editor = atom.workspace.getActivePaneItem()
        range = editor.getSelectedBufferRange()
        text = editor.getSelectedText()
        return unless text.length > 0
        text = OneLiner.run(text)
        editor.setTextInBufferRange(range, text)
        editor.autoIndentSelectedRows()
