<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.6.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="ic-package">
<description>&lt;b&gt;IC Packages an Sockets&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="DIL10">
<description>&lt;b&gt;Dual In Line Package&lt;/b&gt;</description>
<wire x1="6.35" y1="2.921" x2="-6.35" y2="2.921" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="-2.921" x2="6.35" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="6.35" y1="2.921" x2="6.35" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="2.921" x2="-6.35" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="-2.921" x2="-6.35" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="1.016" x2="-6.35" y2="-1.016" width="0.1524" layer="21" curve="-180"/>
<pad name="1" x="-5.08" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-2.54" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="2.54" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="0" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="0" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="2.54" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="5.08" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="5.08" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="9" x="-2.54" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="10" x="-5.08" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<text x="-6.604" y="-2.921" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-4.953" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="DIL10">
<wire x1="-5.08" y1="3.81" x2="-5.08" y2="-8.89" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-8.89" x2="5.08" y2="-8.89" width="0.254" layer="94"/>
<wire x1="5.08" y1="-8.89" x2="5.08" y2="3.81" width="0.254" layer="94"/>
<wire x1="5.08" y1="3.81" x2="2.54" y2="3.81" width="0.254" layer="94"/>
<wire x1="-5.08" y1="3.81" x2="-2.54" y2="3.81" width="0.254" layer="94"/>
<wire x1="-2.54" y1="3.81" x2="2.54" y2="3.81" width="0.254" layer="94" curve="180"/>
<text x="-4.445" y="4.445" size="1.778" layer="95">&gt;NAME</text>
<text x="-4.445" y="-11.43" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-7.62" y="2.54" visible="pad" length="short" direction="pas"/>
<pin name="2" x="-7.62" y="0" visible="pad" length="short" direction="pas"/>
<pin name="3" x="-7.62" y="-2.54" visible="pad" length="short" direction="pas"/>
<pin name="4" x="-7.62" y="-5.08" visible="pad" length="short" direction="pas"/>
<pin name="5" x="-7.62" y="-7.62" visible="pad" length="short" direction="pas"/>
<pin name="6" x="7.62" y="-7.62" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="7" x="7.62" y="-5.08" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="8" x="7.62" y="-2.54" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="9" x="7.62" y="0" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="10" x="7.62" y="2.54" visible="pad" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="DIL10" prefix="IC" uservalue="yes">
<description>&lt;b&gt;Dual In Line / Socket&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="DIL10" x="0" y="2.54"/>
</gates>
<devices>
<device name="" package="DIL10">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="frames">
<description>&lt;b&gt;Frames for Sheet and Layout&lt;/b&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="A4L-LOC">
<wire x1="256.54" y1="3.81" x2="256.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="256.54" y1="8.89" x2="256.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="256.54" y1="13.97" x2="256.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="256.54" y1="19.05" x2="256.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="161.29" y1="3.81" x2="161.29" y2="24.13" width="0.1016" layer="94"/>
<wire x1="161.29" y1="24.13" x2="215.265" y2="24.13" width="0.1016" layer="94"/>
<wire x1="215.265" y1="24.13" x2="256.54" y2="24.13" width="0.1016" layer="94"/>
<wire x1="246.38" y1="3.81" x2="246.38" y2="8.89" width="0.1016" layer="94"/>
<wire x1="246.38" y1="8.89" x2="256.54" y2="8.89" width="0.1016" layer="94"/>
<wire x1="246.38" y1="8.89" x2="215.265" y2="8.89" width="0.1016" layer="94"/>
<wire x1="215.265" y1="8.89" x2="215.265" y2="3.81" width="0.1016" layer="94"/>
<wire x1="215.265" y1="8.89" x2="215.265" y2="13.97" width="0.1016" layer="94"/>
<wire x1="215.265" y1="13.97" x2="256.54" y2="13.97" width="0.1016" layer="94"/>
<wire x1="215.265" y1="13.97" x2="215.265" y2="19.05" width="0.1016" layer="94"/>
<wire x1="215.265" y1="19.05" x2="256.54" y2="19.05" width="0.1016" layer="94"/>
<wire x1="215.265" y1="19.05" x2="215.265" y2="24.13" width="0.1016" layer="94"/>
<text x="217.17" y="15.24" size="2.54" layer="94">&gt;DRAWING_NAME</text>
<text x="217.17" y="10.16" size="2.286" layer="94">&gt;LAST_DATE_TIME</text>
<text x="230.505" y="5.08" size="2.54" layer="94">&gt;SHEET</text>
<text x="216.916" y="4.953" size="2.54" layer="94">Sheet:</text>
<frame x1="0" y1="0" x2="260.35" y2="179.07" columns="6" rows="4" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="A4L-LOC" prefix="FRAME" uservalue="yes">
<description>&lt;b&gt;FRAME&lt;/b&gt;&lt;p&gt;
DIN A4, landscape with location and doc. field</description>
<gates>
<gate name="G$1" symbol="A4L-LOC" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-molex">
<description>&lt;b&gt;Molex Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="70543-08">
<description>&lt;b&gt;C-Grid SL Connector&lt;/b&gt;&lt;p&gt;
 vertical, 8 pin</description>
<wire x1="11.43" y1="-2.8575" x2="11.43" y2="2.8575" width="0.254" layer="21"/>
<wire x1="11.43" y1="2.8575" x2="-11.43" y2="2.8575" width="0.254" layer="21"/>
<wire x1="-11.43" y1="2.8575" x2="-11.43" y2="-2.8575" width="0.254" layer="21"/>
<wire x1="-11.43" y1="-2.8575" x2="-3.4925" y2="-2.8575" width="0.254" layer="21"/>
<wire x1="-3.4925" y1="-2.8575" x2="-3.4925" y2="-3.81" width="0.254" layer="21"/>
<wire x1="-3.4925" y1="-3.81" x2="3.4925" y2="-3.81" width="0.254" layer="21"/>
<wire x1="3.4925" y1="-3.81" x2="3.4925" y2="-2.8575" width="0.254" layer="21"/>
<wire x1="3.4925" y1="-2.8575" x2="11.43" y2="-2.8575" width="0.254" layer="21"/>
<wire x1="-10.795" y1="2.2225" x2="-10.795" y2="-2.2225" width="0.0508" layer="51"/>
<wire x1="10.795" y1="2.2225" x2="10.795" y2="-2.2225" width="0.0508" layer="51"/>
<wire x1="-10.795" y1="2.2225" x2="10.795" y2="2.2225" width="0.0508" layer="51"/>
<wire x1="-10.795" y1="-2.2225" x2="-2.8575" y2="-2.2225" width="0.0508" layer="51"/>
<wire x1="-2.8575" y1="-2.2225" x2="2.8575" y2="-2.2225" width="0.0508" layer="51"/>
<wire x1="2.8575" y1="-2.2225" x2="10.795" y2="-2.2225" width="0.0508" layer="51"/>
<wire x1="2.8575" y1="-3.175" x2="-2.8575" y2="-3.175" width="0.0508" layer="51"/>
<wire x1="-2.8575" y1="-2.2225" x2="-2.8575" y2="-3.175" width="0.0508" layer="51"/>
<wire x1="2.8575" y1="-2.2225" x2="2.8575" y2="-3.175" width="0.0508" layer="51"/>
<pad name="3" x="-3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-6.35" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="1" x="-8.89" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="7" x="6.35" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="8" x="8.89" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-12.065" y="-2.54" size="1.016" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-11.1125" y="3.4925" size="0.8128" layer="27" ratio="10">&gt;VALUE</text>
<text x="-10.4775" y="-1.5875" size="1.016" layer="51" ratio="10">1</text>
<rectangle x1="-6.5881" y1="-0.2381" x2="-6.1119" y2="0.2381" layer="51"/>
<rectangle x1="-9.1281" y1="-0.2381" x2="-8.6519" y2="0.2381" layer="51"/>
<rectangle x1="-1.5081" y1="-0.2381" x2="-1.0319" y2="0.2381" layer="51"/>
<rectangle x1="-4.0481" y1="-0.2381" x2="-3.5719" y2="0.2381" layer="51"/>
<rectangle x1="3.5719" y1="-0.2381" x2="4.0481" y2="0.2381" layer="51"/>
<rectangle x1="1.0319" y1="-0.2381" x2="1.5081" y2="0.2381" layer="51"/>
<rectangle x1="8.6519" y1="-0.2381" x2="9.1281" y2="0.2381" layer="51"/>
<rectangle x1="6.1119" y1="-0.2381" x2="6.5881" y2="0.2381" layer="51"/>
</package>
<package name="70553-08">
<description>&lt;b&gt;C-Grid SL Connector&lt;/b&gt;&lt;p&gt;
 right angle, 8 pin</description>
<wire x1="11.2713" y1="5.8738" x2="4.1275" y2="5.8738" width="0.254" layer="21"/>
<wire x1="4.1275" y1="5.8738" x2="-11.2713" y2="5.8738" width="0.254" layer="21"/>
<wire x1="-11.2713" y1="5.8738" x2="-11.2713" y2="-5.715" width="0.254" layer="21"/>
<wire x1="-11.2713" y1="-5.715" x2="11.2713" y2="-5.715" width="0.254" layer="21"/>
<wire x1="11.2713" y1="-5.715" x2="11.2713" y2="5.8738" width="0.254" layer="21"/>
<wire x1="-1.27" y1="2.54" x2="-1.27" y2="-3.175" width="0.254" layer="21"/>
<wire x1="-1.27" y1="-3.175" x2="1.27" y2="-3.175" width="0.254" layer="21"/>
<wire x1="1.27" y1="-3.175" x2="1.27" y2="2.54" width="0.254" layer="21"/>
<wire x1="-4.1275" y1="5.8737" x2="-4.1275" y2="2.54" width="0.254" layer="21"/>
<wire x1="-4.1275" y1="2.54" x2="-3.175" y2="2.54" width="0.254" layer="21"/>
<wire x1="-3.175" y1="2.54" x2="-1.27" y2="2.54" width="0.254" layer="21"/>
<wire x1="1.27" y1="2.54" x2="3.175" y2="2.54" width="0.254" layer="21"/>
<wire x1="3.175" y1="2.54" x2="4.1275" y2="2.54" width="0.254" layer="21"/>
<wire x1="4.1275" y1="2.54" x2="4.1275" y2="5.8738" width="0.254" layer="21"/>
<wire x1="-3.175" y1="2.54" x2="-3.175" y2="3.175" width="0.254" layer="21"/>
<wire x1="-3.175" y1="3.175" x2="-1.905" y2="4.445" width="0.254" layer="21" curve="-90"/>
<wire x1="-1.905" y1="4.445" x2="1.905" y2="4.445" width="0.254" layer="21"/>
<wire x1="1.905" y1="4.445" x2="3.175" y2="3.175" width="0.254" layer="21" curve="-90"/>
<wire x1="3.175" y1="3.175" x2="3.175" y2="2.54" width="0.254" layer="21"/>
<wire x1="-9.525" y1="-6.35" x2="-8.255" y2="-6.35" width="0.127" layer="51"/>
<wire x1="-8.255" y1="-6.35" x2="-6.985" y2="-6.35" width="0.254" layer="51"/>
<wire x1="-8.255" y1="-6.35" x2="-8.255" y2="-7.6835" width="0.254" layer="51"/>
<wire x1="-8.255" y1="-7.6835" x2="-8.001" y2="-7.9375" width="0.254" layer="51" curve="90"/>
<wire x1="-6.985" y1="-6.35" x2="-6.985" y2="-7.6835" width="0.254" layer="51"/>
<wire x1="-6.985" y1="-7.6835" x2="-7.239" y2="-7.9375" width="0.254" layer="51" curve="-90"/>
<wire x1="-7.239" y1="-7.9375" x2="-8.001" y2="-7.9375" width="0.254" layer="51"/>
<wire x1="-6.985" y1="-6.35" x2="-5.715" y2="-6.35" width="0.127" layer="51"/>
<wire x1="-5.715" y1="-6.35" x2="-4.445" y2="-6.35" width="0.254" layer="51"/>
<wire x1="-5.715" y1="-6.35" x2="-5.715" y2="-7.6835" width="0.254" layer="51"/>
<wire x1="-5.715" y1="-7.6835" x2="-5.461" y2="-7.9375" width="0.254" layer="51" curve="90"/>
<wire x1="-4.445" y1="-6.35" x2="-4.445" y2="-7.6835" width="0.254" layer="51"/>
<wire x1="-4.445" y1="-7.6835" x2="-4.699" y2="-7.9375" width="0.254" layer="51" curve="-90"/>
<wire x1="-4.699" y1="-7.9375" x2="-5.461" y2="-7.9375" width="0.254" layer="51"/>
<wire x1="-4.445" y1="-6.35" x2="-3.175" y2="-6.35" width="0.127" layer="51"/>
<wire x1="-3.175" y1="-6.35" x2="-1.905" y2="-6.35" width="0.254" layer="51"/>
<wire x1="-3.175" y1="-6.35" x2="-3.175" y2="-7.6835" width="0.254" layer="51"/>
<wire x1="-3.175" y1="-7.6835" x2="-2.921" y2="-7.9375" width="0.254" layer="51" curve="90"/>
<wire x1="-1.905" y1="-6.35" x2="-1.905" y2="-7.6835" width="0.254" layer="51"/>
<wire x1="-1.905" y1="-7.6835" x2="-2.159" y2="-7.9375" width="0.254" layer="51" curve="-90"/>
<wire x1="-2.159" y1="-7.9375" x2="-2.921" y2="-7.9375" width="0.254" layer="51"/>
<wire x1="-1.905" y1="-6.35" x2="-0.635" y2="-6.35" width="0.127" layer="51"/>
<wire x1="-0.635" y1="-6.35" x2="0.635" y2="-6.35" width="0.254" layer="51"/>
<wire x1="-0.635" y1="-6.35" x2="-0.635" y2="-7.6835" width="0.254" layer="51"/>
<wire x1="-0.635" y1="-7.6835" x2="-0.381" y2="-7.9375" width="0.254" layer="51" curve="90"/>
<wire x1="0.635" y1="-6.35" x2="0.635" y2="-7.6835" width="0.254" layer="51"/>
<wire x1="0.635" y1="-7.6835" x2="0.381" y2="-7.9375" width="0.254" layer="51" curve="-90"/>
<wire x1="0.381" y1="-7.9375" x2="-0.381" y2="-7.9375" width="0.254" layer="51"/>
<wire x1="0.635" y1="-6.35" x2="1.905" y2="-6.35" width="0.127" layer="51"/>
<wire x1="1.905" y1="-6.35" x2="3.175" y2="-6.35" width="0.254" layer="51"/>
<wire x1="1.905" y1="-6.35" x2="1.905" y2="-7.6835" width="0.254" layer="51"/>
<wire x1="1.905" y1="-7.6835" x2="2.159" y2="-7.9375" width="0.254" layer="51" curve="90"/>
<wire x1="3.175" y1="-6.35" x2="3.175" y2="-7.6835" width="0.254" layer="51"/>
<wire x1="3.175" y1="-7.6835" x2="2.921" y2="-7.9375" width="0.254" layer="51" curve="-90"/>
<wire x1="2.921" y1="-7.9375" x2="2.159" y2="-7.9375" width="0.254" layer="51"/>
<wire x1="3.175" y1="-6.35" x2="4.445" y2="-6.35" width="0.127" layer="51"/>
<wire x1="4.445" y1="-6.35" x2="5.715" y2="-6.35" width="0.254" layer="51"/>
<wire x1="4.445" y1="-6.35" x2="4.445" y2="-7.6835" width="0.254" layer="51"/>
<wire x1="4.445" y1="-7.6835" x2="4.699" y2="-7.9375" width="0.254" layer="51" curve="90"/>
<wire x1="5.715" y1="-6.35" x2="5.715" y2="-7.6835" width="0.254" layer="51"/>
<wire x1="5.715" y1="-7.6835" x2="5.461" y2="-7.9375" width="0.254" layer="51" curve="-90"/>
<wire x1="5.461" y1="-7.9375" x2="4.699" y2="-7.9375" width="0.254" layer="51"/>
<wire x1="5.715" y1="-6.35" x2="6.985" y2="-6.35" width="0.127" layer="51"/>
<wire x1="6.985" y1="-6.35" x2="8.255" y2="-6.35" width="0.254" layer="51"/>
<wire x1="6.985" y1="-6.35" x2="6.985" y2="-7.6835" width="0.254" layer="51"/>
<wire x1="6.985" y1="-7.6835" x2="7.239" y2="-7.9375" width="0.254" layer="51" curve="90"/>
<wire x1="8.255" y1="-6.35" x2="8.255" y2="-7.6835" width="0.254" layer="51"/>
<wire x1="8.255" y1="-7.6835" x2="8.001" y2="-7.9375" width="0.254" layer="51" curve="-90"/>
<wire x1="8.001" y1="-7.9375" x2="7.239" y2="-7.9375" width="0.254" layer="51"/>
<wire x1="8.255" y1="-6.35" x2="9.525" y2="-6.35" width="0.127" layer="51"/>
<wire x1="-10.4775" y1="-5.715" x2="-10.4775" y2="-7.9375" width="0.254" layer="51"/>
<wire x1="-9.525" y1="-6.35" x2="-9.525" y2="-7.6835" width="0.254" layer="51"/>
<wire x1="-9.525" y1="-7.6835" x2="-9.779" y2="-7.9375" width="0.254" layer="51" curve="-90"/>
<wire x1="-9.779" y1="-7.9375" x2="-10.4775" y2="-7.9375" width="0.254" layer="51"/>
<wire x1="9.525" y1="-6.35" x2="9.525" y2="-7.6835" width="0.254" layer="51"/>
<wire x1="9.525" y1="-7.6835" x2="9.779" y2="-7.9375" width="0.254" layer="51" curve="90"/>
<wire x1="9.779" y1="-7.9375" x2="10.4775" y2="-7.9375" width="0.254" layer="51"/>
<wire x1="10.4775" y1="-7.9375" x2="10.4775" y2="-6.35" width="0.254" layer="51"/>
<wire x1="10.4775" y1="-6.35" x2="10.4775" y2="-5.715" width="0.254" layer="51"/>
<wire x1="9.525" y1="-6.35" x2="10.4775" y2="-6.35" width="0.254" layer="51"/>
<pad name="2" x="-6.35" y="-7.62" drill="1.0922" shape="long" rot="R90"/>
<pad name="1" x="-8.89" y="-7.62" drill="1.0922" shape="long" rot="R90"/>
<pad name="3" x="-3.81" y="-7.62" drill="1.0922" shape="long" rot="R90"/>
<pad name="4" x="-1.27" y="-7.62" drill="1.0922" shape="long" rot="R90"/>
<pad name="5" x="1.27" y="-7.62" drill="1.0922" shape="long" rot="R90"/>
<pad name="6" x="3.81" y="-7.62" drill="1.0922" shape="long" rot="R90"/>
<pad name="7" x="6.35" y="-7.62" drill="1.0922" shape="long" rot="R90"/>
<pad name="8" x="8.89" y="-7.62" drill="1.0922" shape="long" rot="R90"/>
<text x="-11.7475" y="-5.715" size="1.016" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="13.0175" y="-5.715" size="0.8128" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="-9.2075" y1="-7.62" x2="-8.5725" y2="-6.35" layer="51"/>
<rectangle x1="-6.6675" y1="-7.62" x2="-6.0325" y2="-6.35" layer="51"/>
<rectangle x1="-4.1275" y1="-7.62" x2="-3.4925" y2="-6.35" layer="51"/>
<rectangle x1="-1.5875" y1="-7.62" x2="-0.9525" y2="-6.35" layer="51"/>
<rectangle x1="0.9525" y1="-7.62" x2="1.5875" y2="-6.35" layer="51"/>
<rectangle x1="3.4925" y1="-7.62" x2="4.1275" y2="-6.35" layer="51"/>
<rectangle x1="6.0325" y1="-7.62" x2="6.6675" y2="-6.35" layer="51"/>
<rectangle x1="8.5725" y1="-7.62" x2="9.2075" y2="-6.35" layer="51"/>
<polygon width="0.0508" layer="21">
<vertex x="-10.795" y="5.8737"/>
<vertex x="-10.3187" y="3.9688"/>
<vertex x="-9.8425" y="5.8737"/>
</polygon>
</package>
<package name="74099-08">
<description>&lt;b&gt;C-Grid SL Connector&lt;/b&gt;&lt;p&gt;
 vertical SMD, 8 pin</description>
<wire x1="11.43" y1="-2.8575" x2="11.43" y2="2.8575" width="0.254" layer="21"/>
<wire x1="11.43" y1="2.8575" x2="-11.43" y2="2.8575" width="0.254" layer="21"/>
<wire x1="-11.43" y1="2.8575" x2="-11.43" y2="-2.8575" width="0.254" layer="21"/>
<wire x1="-11.43" y1="-2.8575" x2="-3.4925" y2="-2.8575" width="0.254" layer="21"/>
<wire x1="-3.4925" y1="-2.8575" x2="-3.4925" y2="-3.81" width="0.254" layer="21"/>
<wire x1="-3.4925" y1="-3.81" x2="3.4925" y2="-3.81" width="0.254" layer="21"/>
<wire x1="3.4925" y1="-3.81" x2="3.4925" y2="-2.8575" width="0.254" layer="21"/>
<wire x1="3.4925" y1="-2.8575" x2="11.43" y2="-2.8575" width="0.254" layer="21"/>
<wire x1="-10.795" y1="2.2225" x2="-10.795" y2="-2.2225" width="0.0508" layer="51"/>
<wire x1="10.795" y1="2.2225" x2="10.795" y2="-2.2225" width="0.0508" layer="51"/>
<wire x1="-10.795" y1="2.2225" x2="10.795" y2="2.2225" width="0.0508" layer="51"/>
<wire x1="-10.795" y1="-2.2225" x2="-2.8575" y2="-2.2225" width="0.0508" layer="51"/>
<wire x1="-2.8575" y1="-2.2225" x2="2.8575" y2="-2.2225" width="0.0508" layer="51"/>
<wire x1="2.8575" y1="-2.2225" x2="10.795" y2="-2.2225" width="0.0508" layer="51"/>
<wire x1="2.8575" y1="-3.175" x2="-2.8575" y2="-3.175" width="0.0508" layer="51"/>
<wire x1="-2.8575" y1="-2.2225" x2="-2.8575" y2="-3.175" width="0.0508" layer="51"/>
<wire x1="2.8575" y1="-2.2225" x2="2.8575" y2="-3.175" width="0.0508" layer="51"/>
<smd name="5" x="1.27" y="-2.2225" dx="3.175" dy="1.27" layer="1" rot="R270"/>
<smd name="4" x="-1.27" y="2.2225" dx="3.175" dy="1.27" layer="1" rot="R270"/>
<smd name="3" x="-3.81" y="-2.2225" dx="3.175" dy="1.27" layer="1" rot="R270"/>
<smd name="2" x="-6.35" y="2.2225" dx="3.175" dy="1.27" layer="1" rot="R270"/>
<smd name="1" x="-8.89" y="-2.2225" dx="3.175" dy="1.27" layer="1" rot="R270"/>
<smd name="6" x="3.81" y="2.2225" dx="3.175" dy="1.27" layer="1" rot="R270"/>
<smd name="7" x="6.35" y="-2.2225" dx="3.175" dy="1.27" layer="1" rot="R270"/>
<smd name="8" x="8.89" y="2.2225" dx="3.175" dy="1.27" layer="1" rot="R270"/>
<text x="-12.065" y="-2.54" size="1.016" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-10.4775" y="0.635" size="0.8128" layer="27" ratio="10">&gt;VALUE</text>
<text x="-10.4775" y="-1.905" size="1.016" layer="51" ratio="10">1</text>
<rectangle x1="-4.0481" y1="-0.2381" x2="-3.5719" y2="0.2381" layer="51"/>
<rectangle x1="-6.5881" y1="-0.2381" x2="-6.1119" y2="0.2381" layer="51"/>
<rectangle x1="1.0319" y1="-0.2381" x2="1.5081" y2="0.2381" layer="51"/>
<rectangle x1="-1.5081" y1="-0.2381" x2="-1.0319" y2="0.2381" layer="51"/>
<rectangle x1="-9.1281" y1="-0.2381" x2="-8.6519" y2="0.2381" layer="51"/>
<rectangle x1="3.5719" y1="-0.2381" x2="4.0481" y2="0.2381" layer="51"/>
<rectangle x1="6.1119" y1="-0.2381" x2="6.5881" y2="0.2381" layer="51"/>
<rectangle x1="8.6519" y1="-0.2381" x2="9.1281" y2="0.2381" layer="51"/>
</package>
<package name="15-91-08">
<description>&lt;b&gt;C-Grid SL Connector&lt;/b&gt;&lt;p&gt;
 right angle SMD, 8 pin</description>
<wire x1="11.2713" y1="5.08" x2="-11.2713" y2="5.08" width="0.254" layer="21"/>
<wire x1="-11.2713" y1="5.08" x2="-11.2713" y2="2.54" width="0.254" layer="21"/>
<wire x1="-11.2713" y1="-0.9525" x2="-11.2713" y2="-6.35" width="0.254" layer="21"/>
<wire x1="-11.2713" y1="-6.35" x2="11.2713" y2="-6.35" width="0.254" layer="21"/>
<wire x1="11.2713" y1="-6.35" x2="11.2713" y2="-0.9525" width="0.254" layer="21"/>
<wire x1="11.2713" y1="2.54" x2="11.2713" y2="5.08" width="0.254" layer="21"/>
<wire x1="-1.27" y1="1.905" x2="-1.27" y2="-3.81" width="0.254" layer="51"/>
<wire x1="-1.27" y1="-3.81" x2="1.27" y2="-3.81" width="0.254" layer="51"/>
<wire x1="1.27" y1="-3.81" x2="1.27" y2="1.905" width="0.254" layer="51"/>
<wire x1="-4.1275" y1="5.0799" x2="-4.1275" y2="1.905" width="0.254" layer="51"/>
<wire x1="-4.1275" y1="1.905" x2="-3.175" y2="1.905" width="0.254" layer="51"/>
<wire x1="-3.175" y1="1.905" x2="-1.27" y2="1.905" width="0.254" layer="51"/>
<wire x1="1.27" y1="1.905" x2="3.175" y2="1.905" width="0.254" layer="51"/>
<wire x1="3.175" y1="1.905" x2="4.1275" y2="1.905" width="0.254" layer="51"/>
<wire x1="4.1275" y1="1.905" x2="4.1275" y2="5.08" width="0.254" layer="51"/>
<wire x1="-3.175" y1="1.905" x2="-3.175" y2="2.54" width="0.254" layer="51"/>
<wire x1="-3.175" y1="2.54" x2="-1.905" y2="3.81" width="0.254" layer="51" curve="-90"/>
<wire x1="-1.905" y1="3.81" x2="1.905" y2="3.81" width="0.254" layer="51"/>
<wire x1="1.905" y1="3.81" x2="3.175" y2="2.54" width="0.254" layer="51" curve="-90"/>
<wire x1="3.175" y1="2.54" x2="3.175" y2="1.905" width="0.254" layer="51"/>
<wire x1="-10.16" y1="-6.35" x2="-10.16" y2="-8.5725" width="0.254" layer="51"/>
<wire x1="-10.16" y1="-6.985" x2="-9.525" y2="-6.985" width="0.254" layer="51"/>
<wire x1="-8.255" y1="-6.985" x2="-6.985" y2="-6.985" width="0.254" layer="51"/>
<wire x1="-9.525" y1="-6.985" x2="-9.525" y2="-8.3185" width="0.254" layer="51"/>
<wire x1="-9.525" y1="-8.3185" x2="-9.779" y2="-8.5725" width="0.254" layer="51" curve="-90"/>
<wire x1="-9.779" y1="-8.5725" x2="-10.16" y2="-8.5725" width="0.254" layer="51"/>
<wire x1="-8.255" y1="-6.985" x2="-8.255" y2="-8.3185" width="0.254" layer="51"/>
<wire x1="-8.255" y1="-8.3185" x2="-8.001" y2="-8.5725" width="0.254" layer="51" curve="90"/>
<wire x1="-6.985" y1="-6.985" x2="-6.985" y2="-8.3185" width="0.254" layer="51"/>
<wire x1="-6.985" y1="-8.3185" x2="-7.239" y2="-8.5725" width="0.254" layer="51" curve="-90"/>
<wire x1="-7.239" y1="-8.5725" x2="-8.001" y2="-8.5725" width="0.254" layer="51"/>
<wire x1="-5.715" y1="-6.985" x2="-5.715" y2="-8.3185" width="0.254" layer="51"/>
<wire x1="-5.715" y1="-8.3185" x2="-5.461" y2="-8.5725" width="0.254" layer="51" curve="90"/>
<wire x1="-5.715" y1="-6.985" x2="-4.445" y2="-6.985" width="0.254" layer="51"/>
<wire x1="-3.175" y1="-6.985" x2="-1.905" y2="-6.985" width="0.254" layer="51"/>
<wire x1="-4.445" y1="-6.985" x2="-4.445" y2="-8.3185" width="0.254" layer="51"/>
<wire x1="-4.445" y1="-8.3185" x2="-4.699" y2="-8.5725" width="0.254" layer="51" curve="-90"/>
<wire x1="-4.699" y1="-8.5725" x2="-5.461" y2="-8.5725" width="0.254" layer="51"/>
<wire x1="-3.175" y1="-6.985" x2="-3.175" y2="-8.3185" width="0.254" layer="51"/>
<wire x1="-3.175" y1="-8.3185" x2="-2.921" y2="-8.5725" width="0.254" layer="51" curve="90"/>
<wire x1="-1.905" y1="-6.985" x2="-1.905" y2="-8.3185" width="0.254" layer="51"/>
<wire x1="-1.905" y1="-8.3185" x2="-2.159" y2="-8.5725" width="0.254" layer="51" curve="-90"/>
<wire x1="-2.159" y1="-8.5725" x2="-2.921" y2="-8.5725" width="0.254" layer="51"/>
<wire x1="-0.635" y1="-6.985" x2="-0.635" y2="-8.3185" width="0.254" layer="51"/>
<wire x1="-0.635" y1="-8.3185" x2="-0.381" y2="-8.5725" width="0.254" layer="51" curve="90"/>
<wire x1="-0.635" y1="-6.985" x2="0.635" y2="-6.985" width="0.254" layer="51"/>
<wire x1="1.905" y1="-6.985" x2="3.175" y2="-6.985" width="0.254" layer="51"/>
<wire x1="0.635" y1="-6.985" x2="0.635" y2="-8.3185" width="0.254" layer="51"/>
<wire x1="0.635" y1="-8.3185" x2="0.381" y2="-8.5725" width="0.254" layer="51" curve="-90"/>
<wire x1="0.381" y1="-8.5725" x2="-0.381" y2="-8.5725" width="0.254" layer="51"/>
<wire x1="1.905" y1="-6.985" x2="1.905" y2="-8.3185" width="0.254" layer="51"/>
<wire x1="1.905" y1="-8.3185" x2="2.159" y2="-8.5725" width="0.254" layer="51" curve="90"/>
<wire x1="3.175" y1="-6.985" x2="3.175" y2="-8.3185" width="0.254" layer="51"/>
<wire x1="3.175" y1="-8.3185" x2="2.921" y2="-8.5725" width="0.254" layer="51" curve="-90"/>
<wire x1="2.921" y1="-8.5725" x2="2.159" y2="-8.5725" width="0.254" layer="51"/>
<wire x1="4.445" y1="-6.985" x2="4.445" y2="-8.3185" width="0.254" layer="51"/>
<wire x1="4.445" y1="-8.3185" x2="4.699" y2="-8.5725" width="0.254" layer="51" curve="90"/>
<wire x1="10.16" y1="-8.5725" x2="10.16" y2="-6.35" width="0.254" layer="51"/>
<wire x1="4.445" y1="-6.985" x2="5.715" y2="-6.985" width="0.254" layer="51"/>
<wire x1="6.985" y1="-6.985" x2="8.255" y2="-6.985" width="0.254" layer="51"/>
<wire x1="9.525" y1="-6.985" x2="10.16" y2="-6.985" width="0.254" layer="51"/>
<wire x1="5.715" y1="-6.985" x2="5.715" y2="-8.3185" width="0.254" layer="51"/>
<wire x1="5.715" y1="-8.3185" x2="5.461" y2="-8.5725" width="0.254" layer="51" curve="-90"/>
<wire x1="5.461" y1="-8.5725" x2="4.699" y2="-8.5725" width="0.254" layer="51"/>
<wire x1="6.985" y1="-6.985" x2="6.985" y2="-8.3185" width="0.254" layer="51"/>
<wire x1="6.985" y1="-8.3185" x2="7.239" y2="-8.5725" width="0.254" layer="51" curve="90"/>
<wire x1="8.255" y1="-6.985" x2="8.255" y2="-8.3185" width="0.254" layer="51"/>
<wire x1="8.255" y1="-8.3185" x2="8.001" y2="-8.5725" width="0.254" layer="51" curve="-90"/>
<wire x1="8.001" y1="-8.5725" x2="7.239" y2="-8.5725" width="0.254" layer="51"/>
<wire x1="9.525" y1="-6.985" x2="9.525" y2="-8.3185" width="0.254" layer="51"/>
<wire x1="9.525" y1="-8.3185" x2="9.779" y2="-8.5725" width="0.254" layer="51" curve="90"/>
<wire x1="9.779" y1="-8.5725" x2="10.16" y2="-8.5725" width="0.254" layer="51"/>
<wire x1="-11.2713" y1="2.54" x2="-11.2713" y2="-0.9525" width="0.254" layer="51"/>
<wire x1="11.2713" y1="2.54" x2="11.2713" y2="-0.9525" width="0.254" layer="51"/>
<wire x1="-9.525" y1="-6.985" x2="-8.255" y2="-6.985" width="0.254" layer="51"/>
<wire x1="-6.985" y1="-6.985" x2="-5.715" y2="-6.985" width="0.254" layer="51"/>
<wire x1="-4.445" y1="-6.985" x2="-3.175" y2="-6.985" width="0.254" layer="51"/>
<wire x1="-1.905" y1="-6.985" x2="-0.635" y2="-6.985" width="0.254" layer="51"/>
<wire x1="0.635" y1="-6.985" x2="1.905" y2="-6.985" width="0.254" layer="51"/>
<wire x1="3.175" y1="-6.985" x2="4.445" y2="-6.985" width="0.254" layer="51"/>
<wire x1="5.715" y1="-6.985" x2="6.985" y2="-6.985" width="0.254" layer="51"/>
<wire x1="8.255" y1="-6.985" x2="9.525" y2="-6.985" width="0.254" layer="51"/>
<smd name="1" x="-8.89" y="-10.795" dx="5.334" dy="1.651" layer="1" rot="R90"/>
<smd name="2" x="-6.35" y="-10.795" dx="5.334" dy="1.651" layer="1" rot="R90"/>
<smd name="3" x="-3.81" y="-10.795" dx="5.334" dy="1.651" layer="1" rot="R90"/>
<smd name="4" x="-1.27" y="-10.795" dx="5.334" dy="1.651" layer="1" rot="R90"/>
<smd name="5" x="1.27" y="-10.795" dx="5.334" dy="1.651" layer="1" rot="R90"/>
<smd name="6" x="3.81" y="-10.795" dx="5.334" dy="1.651" layer="1" rot="R90"/>
<smd name="7" x="6.35" y="-10.795" dx="5.334" dy="1.651" layer="1" rot="R90"/>
<smd name="8" x="8.89" y="-10.795" dx="5.334" dy="1.651" layer="1" rot="R90"/>
<text x="-11.7475" y="-6.35" size="1.016" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="13.0175" y="-6.35" size="0.8128" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="-9.2075" y1="-10.795" x2="-8.5725" y2="-6.985" layer="51"/>
<rectangle x1="-6.6675" y1="-10.795" x2="-6.0325" y2="-6.985" layer="51"/>
<rectangle x1="-4.1275" y1="-10.795" x2="-3.4925" y2="-6.985" layer="51"/>
<rectangle x1="-1.5875" y1="-10.795" x2="-0.9525" y2="-6.985" layer="51"/>
<rectangle x1="0.9525" y1="-10.795" x2="1.5875" y2="-6.985" layer="51"/>
<rectangle x1="3.4925" y1="-10.795" x2="4.1275" y2="-6.985" layer="51"/>
<rectangle x1="6.0325" y1="-10.795" x2="6.6675" y2="-6.985" layer="51"/>
<rectangle x1="8.5725" y1="-10.795" x2="9.2075" y2="-6.985" layer="51"/>
<hole x="-10.287" y="0.8382" drill="3.4036"/>
<hole x="10.287" y="0.8382" drill="3.4036"/>
<polygon width="0.2032" layer="21">
<vertex x="-10.795" y="5.08"/>
<vertex x="-10.3187" y="3.3339"/>
<vertex x="-9.8425" y="5.08"/>
</polygon>
</package>
</packages>
<symbols>
<symbol name="MV">
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<text x="-0.762" y="1.397" size="1.778" layer="96">&gt;VALUE</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
<symbol name="M">
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="C-GRID-08" prefix="X">
<description>&lt;b&gt;CONNECTOR&lt;/b&gt;&lt;p&gt;
wire to board 2.54 mm (0.100") pitch header</description>
<gates>
<gate name="-1" symbol="MV" x="2.54" y="0" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="M" x="2.54" y="-2.54" addlevel="always" swaplevel="1"/>
<gate name="-3" symbol="M" x="2.54" y="-5.08" addlevel="always" swaplevel="1"/>
<gate name="-4" symbol="M" x="2.54" y="-7.62" addlevel="always" swaplevel="1"/>
<gate name="-5" symbol="M" x="2.54" y="-10.16" addlevel="always" swaplevel="1"/>
<gate name="-6" symbol="M" x="2.54" y="-12.7" addlevel="always" swaplevel="1"/>
<gate name="-7" symbol="M" x="2.54" y="-15.24" addlevel="always" swaplevel="1"/>
<gate name="-8" symbol="M" x="2.54" y="-17.78" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="-70543" package="70543-08">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
<connect gate="-7" pin="S" pad="7"/>
<connect gate="-8" pin="S" pad="8"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="-70553" package="70553-08">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
<connect gate="-7" pin="S" pad="7"/>
<connect gate="-8" pin="S" pad="8"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="-74099" package="74099-08">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
<connect gate="-7" pin="S" pad="7"/>
<connect gate="-8" pin="S" pad="8"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
<device name="-15-91" package="15-91-08">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
<connect gate="-3" pin="S" pad="3"/>
<connect gate="-4" pin="S" pad="4"/>
<connect gate="-5" pin="S" pad="5"/>
<connect gate="-6" pin="S" pad="6"/>
<connect gate="-7" pin="S" pad="7"/>
<connect gate="-8" pin="S" pad="8"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="VCC">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="VCC" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VCC" prefix="P+">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="VCC" symbol="VCC" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="ADS1115-1." library="ic-package" deviceset="DIL10" device=""/>
<part name="FRAME1" library="frames" deviceset="A4L-LOC" device=""/>
<part name="SIG" library="con-molex" deviceset="C-GRID-08" device="-15-91" value="SIG"/>
<part name="GND" library="con-molex" deviceset="C-GRID-08" device="-15-91" value="GND"/>
<part name="ADS1115-0" library="ic-package" deviceset="DIL10" device=""/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="P+1" library="supply1" deviceset="VCC" device=""/>
<part name="P+2" library="supply1" deviceset="VCC" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="ADS1115-1." gate="G$1" x="139.7" y="99.06"/>
<instance part="FRAME1" gate="G$1" x="0" y="0"/>
<instance part="SIG" gate="-1" x="127" y="68.58" rot="R270"/>
<instance part="SIG" gate="-2" x="124.46" y="68.58" rot="R270"/>
<instance part="SIG" gate="-3" x="121.92" y="68.58" rot="R270"/>
<instance part="SIG" gate="-4" x="119.38" y="68.58" rot="R270"/>
<instance part="SIG" gate="-5" x="116.84" y="68.58" rot="R270"/>
<instance part="SIG" gate="-6" x="114.3" y="68.58" rot="R270"/>
<instance part="SIG" gate="-7" x="111.76" y="68.58" rot="R270"/>
<instance part="SIG" gate="-8" x="109.22" y="68.58" rot="R270"/>
<instance part="GND" gate="-1" x="50.8" y="58.42" rot="R180"/>
<instance part="GND" gate="-2" x="50.8" y="60.96" rot="R180"/>
<instance part="GND" gate="-3" x="50.8" y="63.5" rot="R180"/>
<instance part="GND" gate="-4" x="50.8" y="66.04" rot="R180"/>
<instance part="GND" gate="-5" x="50.8" y="68.58" rot="R180"/>
<instance part="GND" gate="-6" x="50.8" y="71.12" rot="R180"/>
<instance part="GND" gate="-7" x="50.8" y="73.66" rot="R180"/>
<instance part="GND" gate="-8" x="50.8" y="76.2" rot="R180"/>
<instance part="ADS1115-0" gate="G$1" x="96.52" y="99.06"/>
<instance part="GND1" gate="1" x="55.88" y="53.34"/>
<instance part="GND2" gate="1" x="73.66" y="81.28"/>
<instance part="P+1" gate="VCC" x="109.22" y="119.38"/>
<instance part="P+2" gate="VCC" x="152.4" y="119.38"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<pinref part="ADS1115-0" gate="G$1" pin="4"/>
<wire x1="88.9" y1="93.98" x2="81.28" y2="93.98" width="0.1524" layer="91"/>
<wire x1="81.28" y1="93.98" x2="81.28" y2="78.74" width="0.1524" layer="91"/>
<wire x1="81.28" y1="78.74" x2="109.22" y2="78.74" width="0.1524" layer="91"/>
<pinref part="SIG" gate="-8" pin="S"/>
<wire x1="109.22" y1="78.74" x2="109.22" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="ADS1115-0" gate="G$1" pin="5"/>
<wire x1="88.9" y1="91.44" x2="83.82" y2="91.44" width="0.1524" layer="91"/>
<wire x1="83.82" y1="91.44" x2="83.82" y2="81.28" width="0.1524" layer="91"/>
<wire x1="83.82" y1="81.28" x2="111.76" y2="81.28" width="0.1524" layer="91"/>
<pinref part="SIG" gate="-7" pin="S"/>
<wire x1="111.76" y1="81.28" x2="111.76" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="ADS1115-0" gate="G$1" pin="6"/>
<wire x1="104.14" y1="91.44" x2="114.3" y2="91.44" width="0.1524" layer="91"/>
<pinref part="SIG" gate="-6" pin="S"/>
<wire x1="114.3" y1="91.44" x2="114.3" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="ADS1115-0" gate="G$1" pin="7"/>
<wire x1="104.14" y1="93.98" x2="116.84" y2="93.98" width="0.1524" layer="91"/>
<pinref part="SIG" gate="-5" pin="S"/>
<wire x1="116.84" y1="93.98" x2="116.84" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="ADS1115-1." gate="G$1" pin="4"/>
<wire x1="132.08" y1="93.98" x2="119.38" y2="93.98" width="0.1524" layer="91"/>
<pinref part="SIG" gate="-4" pin="S"/>
<wire x1="119.38" y1="93.98" x2="119.38" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="ADS1115-1." gate="G$1" pin="5"/>
<wire x1="132.08" y1="91.44" x2="121.92" y2="91.44" width="0.1524" layer="91"/>
<pinref part="SIG" gate="-3" pin="S"/>
<wire x1="121.92" y1="91.44" x2="121.92" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<wire x1="152.4" y1="83.82" x2="124.46" y2="83.82" width="0.1524" layer="91"/>
<pinref part="SIG" gate="-2" pin="S"/>
<wire x1="124.46" y1="83.82" x2="124.46" y2="71.12" width="0.1524" layer="91"/>
<pinref part="ADS1115-1." gate="G$1" pin="6"/>
<wire x1="147.32" y1="91.44" x2="152.4" y2="91.44" width="0.1524" layer="91"/>
<wire x1="152.4" y1="91.44" x2="152.4" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="ADS1115-1." gate="G$1" pin="7"/>
<wire x1="147.32" y1="93.98" x2="154.94" y2="93.98" width="0.1524" layer="91"/>
<wire x1="154.94" y1="93.98" x2="154.94" y2="81.28" width="0.1524" layer="91"/>
<wire x1="154.94" y1="81.28" x2="127" y2="81.28" width="0.1524" layer="91"/>
<pinref part="SIG" gate="-1" pin="S"/>
<wire x1="127" y1="81.28" x2="127" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="GND" gate="-8" pin="S"/>
<pinref part="GND1" gate="1" pin="GND"/>
<wire x1="53.34" y1="76.2" x2="55.88" y2="76.2" width="0.1524" layer="91"/>
<wire x1="55.88" y1="76.2" x2="55.88" y2="73.66" width="0.1524" layer="91"/>
<pinref part="GND" gate="-7" pin="S"/>
<wire x1="55.88" y1="73.66" x2="55.88" y2="71.12" width="0.1524" layer="91"/>
<wire x1="55.88" y1="71.12" x2="55.88" y2="68.58" width="0.1524" layer="91"/>
<wire x1="55.88" y1="68.58" x2="55.88" y2="66.04" width="0.1524" layer="91"/>
<wire x1="55.88" y1="66.04" x2="55.88" y2="63.5" width="0.1524" layer="91"/>
<wire x1="55.88" y1="63.5" x2="55.88" y2="60.96" width="0.1524" layer="91"/>
<wire x1="55.88" y1="60.96" x2="55.88" y2="58.42" width="0.1524" layer="91"/>
<wire x1="55.88" y1="58.42" x2="55.88" y2="55.88" width="0.1524" layer="91"/>
<wire x1="53.34" y1="73.66" x2="55.88" y2="73.66" width="0.1524" layer="91"/>
<pinref part="GND" gate="-6" pin="S"/>
<wire x1="53.34" y1="71.12" x2="55.88" y2="71.12" width="0.1524" layer="91"/>
<pinref part="GND" gate="-5" pin="S"/>
<wire x1="53.34" y1="68.58" x2="55.88" y2="68.58" width="0.1524" layer="91"/>
<pinref part="GND" gate="-4" pin="S"/>
<wire x1="53.34" y1="66.04" x2="55.88" y2="66.04" width="0.1524" layer="91"/>
<pinref part="GND" gate="-3" pin="S"/>
<wire x1="53.34" y1="63.5" x2="55.88" y2="63.5" width="0.1524" layer="91"/>
<pinref part="GND" gate="-2" pin="S"/>
<wire x1="53.34" y1="60.96" x2="55.88" y2="60.96" width="0.1524" layer="91"/>
<pinref part="GND" gate="-1" pin="S"/>
<wire x1="53.34" y1="58.42" x2="55.88" y2="58.42" width="0.1524" layer="91"/>
<junction x="55.88" y="73.66"/>
<junction x="55.88" y="71.12"/>
<junction x="55.88" y="68.58"/>
<junction x="55.88" y="66.04"/>
<junction x="55.88" y="63.5"/>
<junction x="55.88" y="60.96"/>
<junction x="55.88" y="58.42"/>
</segment>
<segment>
<pinref part="ADS1115-0" gate="G$1" pin="3"/>
<pinref part="GND2" gate="1" pin="GND"/>
<wire x1="88.9" y1="96.52" x2="86.36" y2="96.52" width="0.1524" layer="91"/>
<wire x1="86.36" y1="96.52" x2="73.66" y2="96.52" width="0.1524" layer="91"/>
<wire x1="73.66" y1="96.52" x2="73.66" y2="86.36" width="0.1524" layer="91"/>
<pinref part="ADS1115-0" gate="G$1" pin="1"/>
<wire x1="73.66" y1="86.36" x2="73.66" y2="83.82" width="0.1524" layer="91"/>
<wire x1="88.9" y1="101.6" x2="86.36" y2="101.6" width="0.1524" layer="91"/>
<wire x1="86.36" y1="101.6" x2="86.36" y2="96.52" width="0.1524" layer="91"/>
<junction x="86.36" y="96.52"/>
<pinref part="ADS1115-1." gate="G$1" pin="3"/>
<wire x1="132.08" y1="96.52" x2="111.76" y2="96.52" width="0.1524" layer="91"/>
<wire x1="111.76" y1="96.52" x2="111.76" y2="86.36" width="0.1524" layer="91"/>
<wire x1="111.76" y1="86.36" x2="73.66" y2="86.36" width="0.1524" layer="91"/>
<junction x="73.66" y="86.36"/>
</segment>
</net>
<net name="VCC" class="0">
<segment>
<pinref part="P+1" gate="VCC" pin="VCC"/>
<wire x1="109.22" y1="116.84" x2="109.22" y2="96.52" width="0.1524" layer="91"/>
<pinref part="ADS1115-0" gate="G$1" pin="8"/>
<wire x1="109.22" y1="96.52" x2="104.14" y2="96.52" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="P+2" gate="VCC" pin="VCC"/>
<wire x1="152.4" y1="116.84" x2="152.4" y2="106.68" width="0.1524" layer="91"/>
<pinref part="ADS1115-1." gate="G$1" pin="8"/>
<wire x1="152.4" y1="106.68" x2="152.4" y2="96.52" width="0.1524" layer="91"/>
<wire x1="152.4" y1="96.52" x2="147.32" y2="96.52" width="0.1524" layer="91"/>
<pinref part="ADS1115-1." gate="G$1" pin="1"/>
<wire x1="132.08" y1="101.6" x2="129.54" y2="101.6" width="0.1524" layer="91"/>
<wire x1="129.54" y1="101.6" x2="129.54" y2="106.68" width="0.1524" layer="91"/>
<wire x1="129.54" y1="106.68" x2="152.4" y2="106.68" width="0.1524" layer="91"/>
<junction x="152.4" y="106.68"/>
</segment>
</net>
<net name="SCL" class="0">
<segment>
<pinref part="ADS1115-0" gate="G$1" pin="10"/>
<wire x1="104.14" y1="101.6" x2="114.3" y2="101.6" width="0.1524" layer="91"/>
<wire x1="114.3" y1="101.6" x2="114.3" y2="111.76" width="0.1524" layer="91"/>
<wire x1="114.3" y1="111.76" x2="147.32" y2="111.76" width="0.1524" layer="91"/>
<label x="160.02" y="111.76" size="1.778" layer="95"/>
<pinref part="ADS1115-1." gate="G$1" pin="10"/>
<wire x1="147.32" y1="111.76" x2="160.02" y2="111.76" width="0.1524" layer="91"/>
<wire x1="147.32" y1="101.6" x2="147.32" y2="111.76" width="0.1524" layer="91"/>
<junction x="147.32" y="111.76"/>
</segment>
</net>
<net name="SDA" class="0">
<segment>
<pinref part="ADS1115-0" gate="G$1" pin="9"/>
<wire x1="104.14" y1="99.06" x2="116.84" y2="99.06" width="0.1524" layer="91"/>
<wire x1="116.84" y1="99.06" x2="116.84" y2="109.22" width="0.1524" layer="91"/>
<wire x1="116.84" y1="109.22" x2="149.86" y2="109.22" width="0.1524" layer="91"/>
<pinref part="ADS1115-1." gate="G$1" pin="9"/>
<wire x1="149.86" y1="109.22" x2="160.02" y2="109.22" width="0.1524" layer="91"/>
<wire x1="147.32" y1="99.06" x2="149.86" y2="99.06" width="0.1524" layer="91"/>
<wire x1="149.86" y1="99.06" x2="149.86" y2="109.22" width="0.1524" layer="91"/>
<junction x="149.86" y="109.22"/>
<label x="160.02" y="109.22" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
