<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="demoSpeedometer.WebForm1" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <asp:Content runat="server" ContentPlaceHolderID="CustomHeadHolder">
    <script type="text/javascript">
        function Gauge1Changed() {
            OnChanged("Gauge1");
            OnChangedLogarithmic();
        }
        function Gauge2Changed() { OnChanged("Gauge2"); }
        function Gauge3Changed() { OnChanged("Gauge3"); }
        function Gauge4Changed() { OnChanged("Gauge4"); }
        function Gauge1EndCallback() { OnEndCallback('Gauge1'); }
        function Gauge2EndCallback() { OnEndCallback('Gauge2'); }
        function Gauge3EndCallback() { OnEndCallback('Gauge3'); }
        function Gauge4EndCallback() { OnEndCallback('Gauge4'); }
        function OnChangedLogarithmic() {
            if (logarithmicScale.GetCheckState() == "Checked")
                value1.SetMaxValue(100);
            else
                value1.SetMaxValue(10);
        }
        //
        var isDirty;
        function PerformCallbackCore(gaugeName) {
            var gauge = window[gaugeName];
            isDirty = gauge.InCallback();
            if (!isDirty)
                gauge.PerformCallback();
        }
        function OnChanged(gaugeName) {
            PerformCallbackCore(gaugeName);
        }
        function OnEndCallback(gaugeName) {
            if (isDirty)
                window.setTimeout(function() { PerformCallbackCore(gaugeName) }, 0);
        }
    </script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentHolder">
    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0">
        <TabPages>
            <dx:TabPage Text="Scale Features">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:ASPxGaugeControl runat="server" Width="350px" Height="350px" BackColor="Transparent" ID="gControl_Page1" ClientInstanceName="Gauge1"
                            SaveStateOnCallbacks="false" OnCustomCallback="OnGauge1CustomCallback">
                            <ClientSideEvents EndCallback="Gauge1EndCallback" />
                            <Gauges>
                                <dx:CircularGauge ID="cGauge1" Bounds="0, 0, 350, 350">
                                    <backgroundlayers>
                                                    <dx:ArcScaleBackgroundLayerComponent Name="arcScaleBackgroundLayerComponent1" ScaleID="arcScaleComponent1"
                                                        ZOrder="1000" ShapeType="CircularFull_Style1"></dx:ArcScaleBackgroundLayerComponent>
                                                </backgroundlayers>
                                    <needles>
                                                    <dx:ArcScaleNeedleComponent EndOffset="5" StartOffset="-4.5" ScaleID="arcScaleComponent1"
                                                        Name="arcScaleNeedleComponent1" ZOrder="-50" ShapeType="CircularFull_Style1"></dx:ArcScaleNeedleComponent>
                                                </needles>
                                    <scales>
                                                    <dx:ArcScaleComponent Name="arcScaleComponent1" MaxValue="10" MinorTickmark-ShapeType="Circular_Style1_3"
                                                        Center="125, 125" EndAngle="60" MajorTickCount="6" MinorTickCount="3" MajorTickmark-TextOffset="-17"
                                                        MajorTickmark-TextOrientation="LeftToRight" MajorTickmark-FormatString="{0:F1}"
                                                        MajorTickmark-ShapeType="Circular_Style1_4" MajorTickmark-ShapeOffset="-3.5"
                                                        StartAngle="-240" AppearanceTickmarkText-Font="Tahoma, 11pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;">
                                                    </dx:ArcScaleComponent>
                                                </scales>
                                </dx:CircularGauge>
                            </Gauges>
                        </dx:ASPxGaugeControl>
                        <dx:ASPxRoundPanel runat="server" ID="ASPxRoundPanel1" ShowHeader="false" style="float: right">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <table class="OptionsTable">
                                        <tr>
                                            <td class="ActionMainLabel">
                                                <dx:ASPxLabel EnableViewState="False" ID="Label1" runat="server" CssClass="DemoLabel NoLeftIndent" Text="Tickmarks" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Major Tickmark Count:
                                            </td>
                                            <td>
                                                <dx:ASPxSpinEdit runat="server" MaxValue="16" MinValue="6" Number="6" Width="100px" ID="majorTickCountEdit" AllowNull="False">
                                                    <ClientSideEvents NumberChanged="Gauge1Changed" />
                                                </dx:ASPxSpinEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Minor Tickmark Count:
                                            </td>
                                            <td>
                                                <dx:ASPxSpinEdit runat="server" MaxValue="10" MinValue="1" Number="3" ValueChangedDelay="250" Width="100px" ID="minorTickCountEdit" AllowNull="False">
                                                    <ClientSideEvents NumberChanged="Gauge1Changed" />
                                                </dx:ASPxSpinEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Major Tickmark Offset:
                                            </td>
                                            <td>
                                                <dx:ASPxSpinEdit runat="server" Increment="0.5" LargeIncrement="2.5" MaxValue="25" MinValue="-50" Number="-3.5" Width="100px"
                                                    ID="majorTickOffset" AllowNull="False">
                                                    <SpinButtons ShowLargeIncrementButtons="True">
                                                    </SpinButtons>
                                                    <ClientSideEvents NumberChanged="Gauge1Changed" />
                                                </dx:ASPxSpinEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Minor Tickmark Offset:
                                            </td>
                                            <td>
                                                <dx:ASPxSpinEdit runat="server" Increment="0.5" LargeIncrement="2.5" MaxValue="25" MinValue="-50" Number="0" Width="100px"
                                                    ID="minorTickOffset" AllowNull="False">
                                                    <SpinButtons ShowLargeIncrementButtons="True">
                                                    </SpinButtons>
                                                    <ClientSideEvents NumberChanged="Gauge1Changed" />
                                                </dx:ASPxSpinEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 12px"></td>
                                        </tr>
                                        <tr>
                                            <td class="ActionMainLabel">
                                                <dx:ASPxLabel EnableViewState="False" ID="Label2" runat="server" CssClass="DemoLabel NoLeftIndent" Text="Text" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Text Offset:
                                            </td>
                                            <td>
                                                <dx:ASPxSpinEdit runat="server" Increment="0.5" LargeIncrement="2.5" MaxValue="25" MinValue="-50" Number="-17" Width="100px"
                                                    ID="textOffset" AllowNull="False">
                                                    <SpinButtons ShowLargeIncrementButtons="True">
                                                    </SpinButtons>
                                                    <ClientSideEvents NumberChanged="Gauge1Changed" />
                                                </dx:ASPxSpinEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Text Orientation:
                                            </td>
                                            <td>
                                                <dx:ASPxComboBox runat="server" SelectedIndex="3" ValueType="System.Int32" Width="100px" ID="textOrientation">
                                                    <ClientSideEvents SelectedIndexChanged="Gauge1Changed" />
                                                    <Items>
                                                        <dx:ListEditItem Text="Default" Value="0"></dx:ListEditItem>
                                                        <dx:ListEditItem Text="Radial" Value="1"></dx:ListEditItem>
                                                        <dx:ListEditItem Text="Tangent" Value="2"></dx:ListEditItem>
                                                        <dx:ListEditItem Text="LeftToRight" Value="3"></dx:ListEditItem>
                                                        <dx:ListEditItem Text="BottomToTop" Value="4"></dx:ListEditItem>
                                                        <dx:ListEditItem Text="TopToBottom" Value="5"></dx:ListEditItem>
                                                    </Items>
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 12px"></td>
                                        </tr>
                                        <tr>
                                            <td class="ActionMainLabel">
                                                <dx:ASPxLabel EnableViewState="False" ID="Label3" runat="server" CssClass="DemoLabel NoLeftIndent" Text="Scale" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Value:
                                            </td>
                                            <td>
                                                <dx:ASPxSpinEdit runat="server" ClientInstanceName="value1" Increment="0.25" LargeIncrement="1" Number="0" Width="100px" ID="value1" AllowNull="False">
                                                    <SpinButtons ShowLargeIncrementButtons="True">
                                                    </SpinButtons>
                                                    <ClientSideEvents NumberChanged="Gauge1Changed" />
                                                </dx:ASPxSpinEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Radius:
                                            </td>
                                            <td>
                                                <dx:ASPxSpinEdit runat="server" LargeIncrement="5" MaxValue="125" MinValue="50" Number="100" Width="100px" ID="radius" AllowNull="False">
                                                    <SpinButtons ShowLargeIncrementButtons="True">
                                                    </SpinButtons>
                                                    <ClientSideEvents NumberChanged="Gauge1Changed" />
                                                </dx:ASPxSpinEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Start Angle:
                                            </td>
                                            <td>
                                                <dx:ASPxSpinEdit runat="server" Increment="5" MinValue="-350" Number="-240" Width="100px" ID="startAngle" AllowNull="False">
                                                    <SpinButtons ShowLargeIncrementButtons="True">
                                                    </SpinButtons>
                                                    <ClientSideEvents NumberChanged="Gauge1Changed" />
                                                </dx:ASPxSpinEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                End Angle:
                                            </td>
                                            <td>
                                                <dx:ASPxSpinEdit runat="server" Increment="5" MaxValue="350" Number="60" Width="100px" ID="endAngle" AllowNull="False">
                                                    <SpinButtons ShowLargeIncrementButtons="True">
                                                    </SpinButtons>
                                                    <ClientSideEvents NumberChanged="Gauge1Changed" />
                                                </dx:ASPxSpinEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Logarithmic Scale:
                                            </td>
                                            <td>
                                                <dx:ASPxCheckBox ClientInstanceName="logarithmicScale" runat="server" ID="logarithmicScale">
                                                <ClientSideEvents CheckedChanged="Gauge1Changed" />
                                                </dx:ASPxCheckBox>
                                            </td>
                                        </tr>
                                    </table>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="Needle Features">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:ASPxGaugeControl runat="server" Width="350px" Height="350px" BackColor="Transparent" ID="gControl_Page3" ClientInstanceName="Gauge3"
                            SaveStateOnCallbacks="false" OnCustomCallback="OnGauge3CustomCallback">
                            <ClientSideEvents EndCallback="Gauge3EndCallback" />
                            <Gauges>
                                <dx:CircularGauge ID="cGauge3" Bounds="0, 0, 350, 350">
                                    <backgroundlayers>
                                                    <dx:ArcScaleBackgroundLayerComponent Name="arcScaleBackgroundLayerComponent3" ScaleID="arcScaleComponent3"
                                                        ZOrder="1000" ShapeType="CircularFull_Style1"></dx:ArcScaleBackgroundLayerComponent>
                                                </backgroundlayers>
                                    <needles>
                                                    <dx:ArcScaleNeedleComponent StartOffset="-4.5" ScaleID="arcScaleComponent3" Name="arcScaleNeedleComponent3"
                                                        ZOrder="-50" ShapeType="CircularFull_Style1"></dx:ArcScaleNeedleComponent>
                                                </needles>
                                    <scales>
                                                    <dx:ArcScaleComponent Name="arcScaleComponent3" MaxValue="10" Value="1" MinorTickmark-ShapeType="Circular_Style1_3"
                                                        Center="125, 125" EndAngle="60" MajorTickCount="6" MinorTickCount="3" MajorTickmark-TextOffset="-17"
                                                        MajorTickmark-TextOrientation="LeftToRight" MajorTickmark-FormatString="{0:F1}"
                                                        MajorTickmark-ShapeType="Circular_Style1_4" MajorTickmark-ShapeOffset="-3.5"
                                                        StartAngle="-240" AppearanceTickmarkText-Font="Tahoma, 11pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;">
                                                    </dx:ArcScaleComponent>
                                                </scales>
                                </dx:CircularGauge>
                            </Gauges>
                        </dx:ASPxGaugeControl>
                        <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" ShowHeader="False" style="float: right">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <table class="OptionsTable">
                                        <tr>
                                            <td class="ActionMainLabel">
                                                <dx:ASPxLabel EnableViewState="False" ID="ASPxLabel1" runat="server" CssClass="DemoLabel NoLeftIndent" Text="Scale" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Value:
                                            </td>
                                            <td>
                                                <dx:ASPxSpinEdit ID="value3" runat="server" MaxValue="10" Number="4" Width="120px" Increment="0.25" LargeIncrement="1" AllowNull="False">
                                                    <ClientSideEvents NumberChanged="Gauge3Changed" />
                                                    <SpinButtons ShowLargeIncrementButtons="True" />
                                                </dx:ASPxSpinEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 12px"></td>
                                        </tr>
                                        <tr>
                                            <td class="ActionMainLabel">
                                                <dx:ASPxLabel EnableViewState="False" ID="ASPxLabel2" runat="server" CssClass="DemoLabel NoLeftIndent" Text="Needle" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Start Offset:
                                            </td>
                                            <td>
                                                <dx:ASPxSpinEdit ID="needleStartOffset" runat="server" MaxValue="50" MinValue="-50" Number="-9.5" Width="120px" Increment="0.5"
                                                    LargeIncrement="5" AllowNull="False">
                                                    <ClientSideEvents NumberChanged="Gauge3Changed" />
                                                    <SpinButtons ShowLargeIncrementButtons="True" />
                                                </dx:ASPxSpinEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                End Offset:
                                            </td>
                                            <td>
                                                <dx:ASPxSpinEdit ID="needleEndOffset" runat="server" MaxValue="50" MinValue="-50" Number="0" Width="120px" Increment="0.5"
                                                    LargeIncrement="5" AllowNull="False">
                                                    <ClientSideEvents NumberChanged="Gauge3Changed" />
                                                    <SpinButtons ShowLargeIncrementButtons="True" />
                                                </dx:ASPxSpinEdit>
                                            </td>
                                        </tr>
                                    </table>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="RangeBar &amp; Marker Features">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:ASPxGaugeControl runat="server" Width="350px" Height="350px" BackColor="Transparent" ID="gControl_Page2" ClientInstanceName="Gauge2"
                            SaveStateOnCallbacks="False" OnCustomCallback="OnGauge2CustomCallback">
                            <ClientSideEvents EndCallback="Gauge2EndCallback" />
                            <Gauges>
                                <dx:CircularGauge ID="cGauge2" Bounds="0, 0, 350, 350">
                                    <backgroundlayers>
                                                    <dx:ArcScaleBackgroundLayerComponent Name="arcScaleBackgroundLayerComponent2" ScaleID="arcScaleComponent2"
                                                        ZOrder="1000" ShapeType="CircularFull_Style1"></dx:ArcScaleBackgroundLayerComponent>
                                                </backgroundlayers>
                                    <markers>
                                                    <dx:ArcScaleMarkerComponent ScaleID="arcScaleComponent2" Name="arcScaleMarkerComponent2"
                                                        ZOrder="-10"></dx:ArcScaleMarkerComponent>
                                                </markers>
                                    <rangebars>
                                                    <dx:ArcScaleRangeBarComponent AppearanceRangeBar-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#8080FF&quot;/&gt;"
                                                        AppearanceRangeBar-ContentBrush="&lt;BrushObject Type=&quot;LinearGradient&quot; Data=&quot;Geometry[Start:0, 0;End:10, 10] Colors[Start:;End:#8080FF]&quot;/&gt;"
                                                        StartOffset="50" ScaleID="arcScaleComponent2" EndOffset="35" Name="arcScaleRangeBarComponent2"
                                                        ZOrder="-100"></dx:ArcScaleRangeBarComponent>
                                                </rangebars>
                                    <scales>
                                                    <dx:ArcScaleComponent Name="arcScaleComponent2" MaxValue="10" Value="1" MinorTickmark-ShapeType="Circular_Style1_3"
                                                        Center="125, 125" EndAngle="60" MajorTickCount="6" MinorTickCount="3" MajorTickmark-TextOffset="-17"
                                                        MajorTickmark-TextOrientation="LeftToRight" MajorTickmark-FormatString="{0:F1}"
                                                        MajorTickmark-ShapeType="Circular_Style1_4" MajorTickmark-ShapeOffset="-3.5"
                                                        StartAngle="-240" AppearanceTickmarkText-Font="Tahoma, 11pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;">
                                                    </dx:ArcScaleComponent>
                                                </scales>
                                </dx:CircularGauge>
                            </Gauges>
                        </dx:ASPxGaugeControl>
                        <dx:ASPxRoundPanel ID="ASPxRoundPanel3" runat="server" ShowHeader="False" style="float: right">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <table class="OptionsTable">
                                        <tr>
                                            <td class="ActionMainLabel">
                                                <dx:ASPxLabel EnableViewState="False" ID="ASPxLabel3" runat="server" CssClass="DemoLabel NoLeftIndent" Text="Scale" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Value:
                                            </td>
                                            <td>
                                                <dx:ASPxSpinEdit ID="value2" runat="server" MaxValue="10" MinValue="0" Number="4" Width="120px" NumberType="Float" Increment="0.25"
                                                    LargeIncrement="1" SpinButtons-ShowLargeIncrementButtons="true" AllowNull="False">
                                                    <ClientSideEvents NumberChanged="Gauge2Changed" />
                                                </dx:ASPxSpinEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 12px"></td>
                                        </tr>
                                        <tr>
                                            <td class="ActionMainLabel">
                                                <dx:ASPxLabel EnableViewState="False" ID="ASPxLabel4" runat="server" CssClass="DemoLabel NoLeftIndent" Text="Range Bar" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Anchor Value:
                                            </td>
                                            <td>
                                                <dx:ASPxSpinEdit ID="anchorValue" runat="server" MaxValue="10" MinValue="0" Number="0" Width="120px" NumberType="Float" Increment="0.25"
                                                    LargeIncrement="1" SpinButtons-ShowLargeIncrementButtons="true" AllowNull="False">
                                                    <ClientSideEvents NumberChanged="Gauge2Changed" />
                                                </dx:ASPxSpinEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Start Offset:
                                            </td>
                                            <td>
                                                <dx:ASPxSpinEdit ID="startOffset" runat="server" MaxValue="100" MinValue="0" Number="50" Width="120px" NumberType="Float"
                                                    Increment="1" LargeIncrement="5" SpinButtons-ShowLargeIncrementButtons="true" AllowNull="False">
                                                    <ClientSideEvents NumberChanged="Gauge2Changed" />
                                                </dx:ASPxSpinEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                End Offset:
                                            </td>
                                            <td>
                                                <dx:ASPxSpinEdit ID="endOffset" runat="server" MaxValue="40" MinValue="-10" Number="35" Width="120px" NumberType="Float"
                                                    Increment="1" LargeIncrement="5" SpinButtons-ShowLargeIncrementButtons="true" AllowNull="False">
                                                    <ClientSideEvents NumberChanged="Gauge2Changed" />
                                                </dx:ASPxSpinEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 12px"></td>
                                        </tr>
                                        <tr>
                                            <td class="ActionMainLabel">
                                                <dx:ASPxLabel EnableViewState="False" ID="ASPxLabel5" runat="server" CssClass="DemoLabel NoLeftIndent" Text="Marker" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Marker Offset:
                                            </td>
                                            <td>
                                                <dx:ASPxSpinEdit ID="markerOffset" runat="server" MaxValue="25" MinValue="-25" Number="0" Width="120px" NumberType="Float"
                                                    Increment="1" LargeIncrement="5" SpinButtons-ShowLargeIncrementButtons="true" AllowNull="False">
                                                    <ClientSideEvents NumberChanged="Gauge2Changed" />
                                                </dx:ASPxSpinEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Marker Shape:
                                            </td>
                                            <td>
                                                <dx:ASPxComboBox ID="markerShape" runat="server" SelectedIndex="0" Width="120px" ValueType="System.Int32">
                                                    <Items>
                                                        <dx:ListEditItem Text="Default" Value="0" />
                                                        <dx:ListEditItem Text="TriangleLeft" Value="1" />
                                                        <dx:ListEditItem Text="SliderLeft" Value="2" />
                                                        <dx:ListEditItem Text="Circle" Value="3" />
                                                        <dx:ListEditItem Text="WedgeLeft" Value="4" />
                                                        <dx:ListEditItem Text="Diamond" Value="5" />
                                                        <dx:ListEditItem Text="ArrowLeft" Value="6" />
                                                        <dx:ListEditItem Text="Box" Value="7" />
                                                        <dx:ListEditItem Text="Star" Value="8" />
                                                        <dx:ListEditItem Text="Button" Value="9" />
                                                        <dx:ListEditItem Text="SnowFlake" Value="10" />
                                                        <dx:ListEditItem Text="TriangleRight" Value="11" />
                                                        <dx:ListEditItem Text="SliderRight" Value="12" />
                                                        <dx:ListEditItem Text="WedgeRight" Value="13" />
                                                        <dx:ListEditItem Text="ArrowRight" Value="14" />
                                                    </Items>
                                                    <ClientSideEvents SelectedIndexChanged="Gauge2Changed" />
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                    </table>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="StateIndicators &amp; Labels &amp; Ranges Features">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:ASPxGaugeControl runat="server" Width="350px" Height="350px" BackColor="Transparent" ID="gControl_Page4" ClientInstanceName="Gauge4"
                            SaveStateOnCallbacks="false" OnCustomCallback="OnGauge4CustomCallback">
                            <ClientSideEvents EndCallback="Gauge4EndCallback" />
                            <Gauges>
                                <dx:CircularGauge ID="cGauge4" Bounds="0, 0, 350, 350">
                                    <backgroundlayers>
                                                    <dx:ArcScaleBackgroundLayerComponent Name="arcScaleBackgroundLayerComponent4" ScaleID="arcScaleComponent4"
                                                        ZOrder="1000" ShapeType="CircularFull_Style1"></dx:ArcScaleBackgroundLayerComponent>
                                                </backgroundlayers>
                                    <indicators>
                                                    <dx:ArcScaleStateIndicatorComponent Name="arcScaleStateIndicatorComponent4" Center="125, 200"
                                                        ScaleID="arcScaleComponent4" ZOrder="-100">
                                                        <States>
                                                            <dx:ScaleIndicatorStateWeb Name="State0" IntervalLength="4" ShapeType="ElectricLight4">
                                                            </dx:ScaleIndicatorStateWeb>
                                                            <dx:ScaleIndicatorStateWeb Name="State1" StartValue="4" IntervalLength="3.25" ShapeType="ElectricLight3">
                                                            </dx:ScaleIndicatorStateWeb>
                                                            <dx:ScaleIndicatorStateWeb Name="State2" StartValue="7.25" IntervalLength="2.75" ShapeType="ElectricLight2">
                                                            </dx:ScaleIndicatorStateWeb>
                                                        </States>
                                                    </dx:ArcScaleStateIndicatorComponent>
                                                </indicators>
                                    <needles>
                                                    <dx:ArcScaleNeedleComponent StartOffset="-4.5" ScaleID="arcScaleComponent4" Name="arcScaleNeedleComponent4"
                                                        ZOrder="-50" ShapeType="CircularFull_Style1"></dx:ArcScaleNeedleComponent>
                                                </needles>
                                    <scales>
                                                    <dx:ArcScaleComponent Name="arcScaleComponent4" MaxValue="10" MinorTickmark-ShapeType="Circular_Style1_3"
                                                        Center="125, 125" EndAngle="60" MajorTickCount="6" MinorTickCount="3" MajorTickmark-TextOffset="-17"
                                                        MajorTickmark-TextOrientation="LeftToRight" MajorTickmark-FormatString="{0:F1}"
                                                        MajorTickmark-ShapeType="Circular_Style1_4" MajorTickmark-ShapeOffset="-3.5"
                                                        StartAngle="-240" AppearanceTickmarkText-Font="Tahoma, 11pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;">
                                                        <Ranges>
                                                            <dx:ArcScaleRangeWeb Name="Range0" AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Green&quot;/&gt;"
                                                                EndValue="4" StartThickness="8" EndThickness="15" ShapeOffset="-30"></dx:ArcScaleRangeWeb>
                                                            <dx:ArcScaleRangeWeb Name="Range1" AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Yellow&quot;/&gt;"
                                                                StartValue="4" EndValue="7.25" StartThickness="15" EndThickness="20" ShapeOffset="-30">
                                                            </dx:ArcScaleRangeWeb>
                                                            <dx:ArcScaleRangeWeb Name="Range2" AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Red&quot;/&gt;"
                                                                StartValue="7.25" EndValue="10" StartThickness="20" EndThickness="25" ShapeOffset="-30">
                                                            </dx:ArcScaleRangeWeb>
                                                        </Ranges>
                                                        <Labels>
                                                            <dx:ScaleLabelWeb Name="Label0" Position="125, 150" Size="70, 20" AppearanceBackground-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:infotext&quot;/&gt;"
                                                                AppearanceBackground-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:infobackground&quot;/&gt;"
                                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:infotext&quot;/&gt;">
                                                            </dx:ScaleLabelWeb>
                                                        </Labels>
                                                    </dx:ArcScaleComponent>
                                                </scales>
                                </dx:CircularGauge>
                            </Gauges>
                        </dx:ASPxGaugeControl>
                        <dx:ASPxRoundPanel ID="ASPxRoundPanel4" runat="server" ShowHeader="False" style="float: right">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <table class="OptionsTable">
                                        <tr>
                                            <td class="ActionMainLabel">
                                                <dx:ASPxLabel EnableViewState="False" ID="ASPxLabel6" runat="server" CssClass="DemoLabel NoLeftIndent" Text="Scale" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Value:
                                            </td>
                                            <td>
                                                <dx:ASPxSpinEdit ID="value4" runat="server" MaxValue="10" MinValue="0" Number="4" Width="120px" NumberType="Float" Increment="0.25"
                                                    LargeIncrement="1" SpinButtons-ShowLargeIncrementButtons="true" AllowNull="False">
                                                    <ClientSideEvents NumberChanged="Gauge4Changed" />
                                                </dx:ASPxSpinEdit>
                                            </td>
                                        </tr>
                                    </table>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>
</asp:Content>
</body>
</html>
