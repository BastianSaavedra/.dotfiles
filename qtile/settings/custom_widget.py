from libqtile import widget


class ModdedCapsNumLock(widget.CapsNumLockIndicator):
    def poll(self):
        indicators = self.get_indicators()
        # indicators is a list of tuples that looks like this:
        # [('Caps', 'off'), ('Num', 'off')]
        # You can then create your output based on these values and return it
        output = "|".join(f"󰪛 {lock}" for lock, state in indicators if state == "on")
        return output
