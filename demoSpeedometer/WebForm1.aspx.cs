using System;
using System.Web.UI;
using DevExpress.Web;
using DevExpress.Web.ASPxGauges;
using DevExpress.Web.ASPxGauges.Base;
using DevExpress.Web.ASPxGauges.Gauges.Circular;
using DevExpress.XtraGauges.Core.Model;

public partial class CircularGaugesPage : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsCallback)
        {
            GetGaugeScale(this.gControl_Page1, 0, 0).Value = (float)this.value1.Number;
            GetGaugeScale(this.gControl_Page2, 0, 0).Value = (float)this.value2.Number;
            GetGaugeScale(this.gControl_Page3, 0, 0).Value = (float)this.value3.Number;
            GetGaugeScale(this.gControl_Page4, 0, 0).Value = (float)this.value4.Number;
        }
    }
    protected void OnGauge1CustomCallback(object source, CallbackEventArgsBase e)
    {
        ArcScaleComponent scale = GetGaugeScale(this.gControl_Page1, 0, 0);
        scale.BeginUpdate();
        scale.Logarithmic = logarithmicScale.Checked;
        if (scale.IsLogarithmic == true)
            scale.MaxValue = 100;
        scale.Value = (float)value1.Number;
        scale.RadiusX = (float)radius.Number;
        scale.RadiusY = (float)radius.Number;
        scale.StartAngle = (float)startAngle.Number;
        scale.EndAngle = (float)endAngle.Number;
        scale.MajorTickmark.TextOrientation = (LabelOrientation)(int)textOrientation.Value;
        scale.MajorTickmark.TextOffset = (float)textOffset.Number;
        scale.MajorTickCount = (int)majorTickCountEdit.Number;
        scale.MinorTickCount = (int)minorTickCountEdit.Number;
        scale.MajorTickmark.ShapeOffset = (float)majorTickOffset.Number;
        scale.MinorTickmark.ShapeOffset = (float)minorTickOffset.Number;
        scale.EndUpdate();
    }
    protected void OnGauge2CustomCallback(object source, CallbackEventArgsBase e)
    {
        ArcScaleComponent scale = GetGaugeScale(this.gControl_Page2, 0, 0);
        ArcScaleRangeBarComponent range = GetGaugeRangeBar(this.gControl_Page2, 0, 0);
        ArcScaleMarkerComponent marker = GetGaugeMarker(this.gControl_Page2, 0, 0);
        scale.Value = (float)value2.Number;
        range.BeginUpdate();
        range.AnchorValue = (float)anchorValue.Number;
        range.StartOffset = (float)startOffset.Number;
        range.EndOffset = (float)endOffset.Number;
        range.EndUpdate();
        marker.BeginUpdate();
        marker.ShapeOffset = (float)markerOffset.Number;
        marker.ShapeType = (MarkerPointerShapeType)(int)markerShape.SelectedIndex;
        marker.EndUpdate();
    }
    protected void OnGauge3CustomCallback(object source, CallbackEventArgsBase e)
    {
        ArcScaleComponent scale = GetGaugeScale(this.gControl_Page3, 0, 0);
        ArcScaleNeedleComponent needle = GetGaugeNeedle(this.gControl_Page3, 0, 0);
        scale.Value = (float)value3.Number;
        needle.StartOffset = (float)needleStartOffset.Number;
        needle.EndOffset = (float)needleEndOffset.Number;
    }
    protected void OnGauge4CustomCallback(object source, CallbackEventArgsBase e)
    {
        ArcScaleComponent scale = GetGaugeScale(this.gControl_Page4, 0, 0);
        scale.Value = (float)value4.Number;
    }
    ArcScaleComponent GetGaugeScale(ASPxGaugeControl gaugeControl, int gaugeIndex, int scaleIndex)
    {
        return ((ICircularGauge)gaugeControl.Gauges[gaugeIndex]).Scales[scaleIndex];
    }
    ArcScaleRangeBarComponent GetGaugeRangeBar(ASPxGaugeControl gaugeControl, int gaugeIndex, int rangeBarIndex)
    {
        return ((ICircularGauge)gaugeControl.Gauges[gaugeIndex]).RangeBars[rangeBarIndex];
    }
    ArcScaleMarkerComponent GetGaugeMarker(ASPxGaugeControl gaugeControl, int gaugeIndex, int markerIndex)
    {
        return ((ICircularGauge)gaugeControl.Gauges[gaugeIndex]).Markers[markerIndex];
    }
    ArcScaleNeedleComponent GetGaugeNeedle(ASPxGaugeControl gaugeControl, int gaugeIndex, int needleIndex)
    {
        return ((ICircularGauge)gaugeControl.Gauges[gaugeIndex]).Needles[needleIndex];
    }
}
