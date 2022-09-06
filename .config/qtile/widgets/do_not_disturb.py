from typing import Final
from libqtile.widget.base import _TextBox


class DoNotDisturb(_TextBox):
    """Enables/disables notifications when clicked. Works with Dunst."""

    # Instance variables
    _paused: bool

    # Class variables
    _displays: Final = {False: "DND off", True: "DND on"}

    def __init__(self, **config):
        super().__init__("", **config)

        self.add_callbacks({"Button1": self.switch_state})

    def _configure(self, qtile, bar):
        super()._configure(qtile, bar)

        self._paused = False
        self.text = self._displays[self._paused]
        self.qtile.cmd_spawn("dunstctl set-paused false")

        self.bar.draw()

    def switch_state(self) -> None:
        self._paused = not self._paused
        self.text = self._displays[self._paused]
        self.qtile.cmd_spawn("dunstctl set-paused toggle")

        self.bar.draw()
