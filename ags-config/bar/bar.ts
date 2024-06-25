import gsconnect from './gsconnect'
import Widget from 'resource:///com/github/Aylur/ags/widget.js'

const Center = () =>
  Widget.Box({
    child: gsconnect(),
  })

const Bar = (monitor = 0) => {
  return Widget.Window({
    name: `bar-${monitor}`,
    class_name: 'bar',
    monitor,
    anchor: ['top', 'left', 'right'],
    exclusivity: 'exclusive',
    child: Widget.CenterBox({
      center_widget: Center(),
    }),
  })
}
export default Bar
