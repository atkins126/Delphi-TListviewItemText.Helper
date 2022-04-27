unit ListItemText.Helper_un;

interface

uses
  FMX.ListView.Types,
  FMX.TextLayout,
  System.Types;

type

  TListItemTextHelper = class helper for TListItemText
  private

  public
    function AutoHeightText: Integer;

  end;

implementation


{ TResponsividade }

function TListItemTextHelper.AutoHeightText: Integer;
var
  Layout: TTextLayout;
begin
  // Create a TTextLayout to measure text dimensions
  Layout := TTextLayoutManager.DefaultTextLayout.Create;
  try
    Layout.BeginUpdate;
    try
      // Initialize layout parameters with those of the drawable
      Layout.Font.Assign(self.Font);
      Layout.VerticalAlign := self.TextVertAlign;
      Layout.HorizontalAlign := self.TextAlign;
      Layout.WordWrap := self.WordWrap;
      Layout.Trimming := self.Trimming;
      Layout.MaxSize := TPointF.Create(self.Width, TTextLayout.MaxLayoutSize.Y);
      Layout.Text := self.Text;
    finally
      Layout.EndUpdate;
    end;

    self.Height := Round(Layout.Height);
    Result := Round(Layout.Height);
    Layout.Text := 'm';
    Result := Result + Round(Layout.Height);
  finally
    Layout.Free;
  end;
end;

end.
