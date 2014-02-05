require 'swt/swt_bot_extensions'

module Swt
  java_import 'org.eclipse.swt.SWT'

  module Widgets
    java_import 'org.eclipse.swt.widgets.Button'
    java_import 'org.eclipse.swt.widgets.Caret'
    java_import 'org.eclipse.swt.widgets.Combo'
    java_import 'org.eclipse.swt.widgets.Composite'
    java_import 'org.eclipse.swt.widgets.Event'
    java_import 'org.eclipse.swt.widgets.DirectoryDialog'
    java_import 'org.eclipse.swt.widgets.FileDialog'
    java_import 'org.eclipse.swt.widgets.List'
    java_import 'org.eclipse.swt.widgets.Menu'
    java_import 'org.eclipse.swt.widgets.MenuItem'
    java_import 'org.eclipse.swt.widgets.MessageBox'
    java_import 'org.eclipse.swt.widgets.ToolBar'
    java_import 'org.eclipse.swt.widgets.ToolItem'
    java_import 'org.eclipse.swt.widgets.CoolBar'
    java_import 'org.eclipse.swt.widgets.CoolItem'
    java_import 'org.eclipse.swt.widgets.Sash'
    java_import 'org.eclipse.swt.widgets.Slider'
    java_import 'org.eclipse.swt.widgets.TabFolder'
    java_import 'org.eclipse.swt.widgets.TabItem'
    java_import 'org.eclipse.swt.widgets.TableColumn'
    java_import 'org.eclipse.swt.widgets.Text'
    java_import 'org.eclipse.swt.widgets.ToolTip'
    java_import 'org.eclipse.swt.widgets.Table'
    java_import 'org.eclipse.swt.widgets.TableItem'
  end

  module Custom
    java_import 'org.eclipse.swt.custom.CTabFolder'
    java_import 'org.eclipse.swt.custom.CTabItem'
    java_import 'org.eclipse.swt.custom.SashForm'
    java_import 'org.eclipse.swt.custom.StackLayout'
    java_import 'org.eclipse.swt.custom.ST'
    java_import 'org.eclipse.swt.custom.StyleRange'
    java_import 'org.eclipse.swt.custom.StyledText'
    java_import 'org.eclipse.swt.custom.TreeEditor'
  end

  module DND
    java_import 'org.eclipse.swt.dnd.DND'

    java_import 'org.eclipse.swt.dnd.Transfer'
    java_import 'org.eclipse.swt.dnd.TextTransfer'
    java_import 'org.eclipse.swt.dnd.FileTransfer'
    java_import 'org.eclipse.swt.dnd.ByteArrayTransfer'

    java_import 'org.eclipse.swt.dnd.DropTarget'
    java_import 'org.eclipse.swt.dnd.DropTargetEvent'
    java_import 'org.eclipse.swt.dnd.DropTargetListener'

    java_import 'org.eclipse.swt.dnd.DragSource'
    java_import 'org.eclipse.swt.dnd.DragSourceEvent'
    java_import 'org.eclipse.swt.dnd.DragSourceListener'
  end

  module Layout
    java_import 'org.eclipse.swt.layout.FillLayout'
    java_import 'org.eclipse.swt.layout.GridLayout'
    java_import 'org.eclipse.swt.layout.GridData'
    java_import 'org.eclipse.swt.layout.RowLayout'
    java_import 'org.eclipse.swt.layout.RowData'
  end

  module Graphics
    java_import 'org.eclipse.swt.graphics.Color'
    java_import 'org.eclipse.swt.graphics.Device'
    java_import 'org.eclipse.swt.graphics.Font'
    java_import 'org.eclipse.swt.graphics.GC'
    java_import 'org.eclipse.swt.graphics.Point'
    java_import 'org.eclipse.swt.graphics.RGB'
  end

  module Events
    java_import 'org.eclipse.swt.events.KeyEvent'
    java_import 'org.eclipse.swt.events.MouseListener'
    java_import 'org.eclipse.swt.events.MouseTrackListener'
    java_import 'org.eclipse.swt.events.SelectionListener'
    java_import 'org.eclipse.swt.events.KeyListener'
  end

  java_import 'org.eclipse.swt.browser.Browser'
  class Browser
    java_import 'org.eclipse.swt.browser.BrowserFunction'
  end
  
  def self.bot
    @bot ||= begin
      Dir[File.expand_path("../../../vendor/swtbot", __FILE__) + "/*.jar"].each do |fn|
        require fn
      end
      bot = org.eclipse.swtbot.swt.finder.SWTBot.new
      bot.extend SwtBotExtensions
      bot
    end
  end
end

module JFace
  Dir[File.expand_path "../../../vendor/jface/*.jar", __FILE__].each do |jar_fn|
    require jar_fn
  end

  module Viewers
    java_import 'org.eclipse.jface.viewers.ColumnViewerToolTipSupport'
    java_import 'org.eclipse.jface.viewers.TreeViewer'
    java_import 'org.eclipse.jface.viewers.ITreeContentProvider'
    java_import 'org.eclipse.jface.viewers.ILabelProvider'
    java_import 'org.eclipse.jface.viewers.ILazyTreeContentProvider'
    java_import 'org.eclipse.jface.viewers.ILabelProvider'
    java_import 'org.eclipse.jface.viewers.TextCellEditor'
    java_import 'org.eclipse.jface.viewers.ViewerDropAdapter'
  end

  module Text
    java_import 'org.eclipse.jface.text.TextViewerUndoManager'
  end

  module Dialogs
    java_import 'org.eclipse.jface.dialogs.Dialog'
    java_import 'org.eclipse.jface.dialogs.InputDialog'
  end
end

require 'swt/grid_data'
