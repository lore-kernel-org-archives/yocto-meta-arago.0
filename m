Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 04ADE529D9
	for <meta-arago@arago-project.org>;
	Wed,  5 Nov 2014 19:12:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id sA5JCf8M011365
	for <meta-arago@arago-project.org>; Wed, 5 Nov 2014 13:12:41 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id sA5JCfvm001997
	for <meta-arago@arago-project.org>; Wed, 5 Nov 2014 13:12:41 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Wed, 5 Nov 2014 13:12:41 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: matrix-gui-browser: do_compile failure
Thread-Index: Ac/5LACYNxbe6KFjQB+I6UGiIMkMjw==
Date: Wed, 5 Nov 2014 19:12:40 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958140B815F@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: matrix-gui-browser: do_compile failure
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Nov 2014 19:12:42 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4B26FB5A64EBA14C87266869E037F958140B815FDFLE09entticom_"

--_000_4B26FB5A64EBA14C87266869E037F958140B815FDFLE09entticom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

With the latest patches, the "matrix-gui-browser" recipe is failing to comp=
ile. Any help would be appreciated.

My build configuration is as follows:


=D8  Oe-layersetup config file: arago-daisy-config.txt

=D8  MACHINE=3Ddra7xx-evm

=D8  BITBAKE Target: arago-amsdk-image


Let me know if there is any other information that I need to provide. The e=
rror log is provided below.

Thank you,
Jake



DEBUG: Executing shell function do_compile
NOTE: make -j 16 MAKEFLAGS=3D-j 16 OE_QMAKE_COMPILER=3Darm-linux-gnueabihf-=
gcc  -march=3Darmv7-a -marm -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dne=
on -mtune=3Dcortex-a15 --sysroot=3D/home/gtbldadm/ti/oe-layersetup/build-CO=
RTEX_1/arago-tmp-external-linaro-toolchain/sysroots/dra7xx-evm OE_QMAKE_CC=
=3Darm-linux-gnueabihf-gcc  -march=3Darmv7-a -marm -mthumb-interwork -mfloa=
t-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a15 --sysroot=3D/home/gtbldadm/ti=
/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/=
dra7xx-evm OE_QMAKE_CXX=3Darm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -=
mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a15 --sysr=
oot=3D/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-lin=
aro-toolchain/sysroots/dra7xx-evm OE_QMAKE_CFLAGS=3D -isystem/opt/linaro-20=
13.03/arm-linux-gnueabihf/include  -fstack-protector -O2 -pipe -g -felimina=
te-unused-debug-types OE_QMAKE_CXXFLAGS=3D -isystem/opt/linaro-2013.03/arm-=
linux-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unused-=
debug-types OE_QMAKE_LINK=3Darm-linux-gnueabihf-g++  -march=3Darmv7-a -marm=
 -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a15 --sy=
sroot=3D/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-l=
inaro-toolchain/sysroots/dra7xx-evm OE_QMAKE_LDFLAGS=3D -L/opt/linaro-2013.=
03/arm-linux-gnueabihf/lib -Wl,-rpath-link,/opt/linaro-2013.03/arm-linux-gn=
ueabihf/lib -Wl,-O1 -Wl,--hash-style=3Dgnu OE_QMAKE_AR=3Darm-linux-gnueabih=
f-ar OE_QMAKE_STRIP=3Decho OE_QMAKE_WAYLAND_SCANNER=3D/home/gtbldadm/ti/oe-=
layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_=
64-linux/usr/bin/wayland-scanner
arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mthumb-interwork -mfloat-a=
bi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a15 --sysroot=3D/home/gtbldadm/ti/oe=
-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/dra=
7xx-evm -c -pipe -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include  -=
fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -O2 -Wall -W -=
D_REENTRANT -fPIE -DQT_NO_DEBUG -DQT_WEBKITWIDGETS_LIB -DQT_QUICK_LIB -DQT_=
OPENGL_LIB -DQT_PRINTSUPPORT_LIB -DQT_WEBKIT_LIB -DQT_QML_LIB -DQT_WIDGETS_=
LIB -DQT_NETWORK_LIB -DQT_POSITIONING_LIB -DQT_SENSORS_LIB -DQT_GUI_LIB -DQ=
T_CORE_LIB -I../../../../../sysroots/am57xx-evm/usr/lib/qt5/mkspecs/linux-o=
e-g++ -I../git -I../git -I../../../../../sysroots/am57xx-evm/usr/include/qt=
5 -I../../../../../sysroots/am57xx-evm/usr/include/qt5/QtWebKitWidgets -I..=
/../../../../sysroots/am57xx-evm/usr/include/qt5/QtQuick -I../../../../../s=
ysroots/am57xx-evm/usr/include/qt5/QtOpenGL -I../../../../../sysroots/am57x=
x-evm/usr/include/qt5/QtPrintSupport -I../../../../../sysroots/am57xx-evm/u=
sr/include/qt5/QtWebKit -I../../../../../sysroots/am57xx-evm/usr/include/qt=
5/QtQml -I../../../../../sysroots/am57xx-evm/usr/include/qt5/QtWidgets -I..=
/../../../../sysroots/am57xx-evm/usr/include/qt5/QtNetwork -I../../../../..=
/sysroots/am57xx-evm/usr/include/qt5/QtPositioning -I../../../../../sysroot=
s/am57xx-evm/usr/include/qt5/QtSensors -I../../../../../sysroots/am57xx-evm=
/usr/include/qt5/QtGui -I../../../../../sysroots/am57xx-evm/usr/include/qt5=
/QtCore -I. -I. -o main.o ../git/main.cpp
../git/main.cpp: In function 'int main(int, char**)':
../git/main.cpp:50:67: warning: the address of 'QTextStream& endl(QTextStre=
am&)' will always evaluate as 'true' [-Waddress]
In file included from ../../../../../sysroots/am57xx-evm/usr/include/qt5/Qt=
Core/qobject.h:49:0,
                 from ../../../../../sysroots/am57xx-evm/usr/include/qt5/Qt=
Core/qabstractanimation.h:45,
                 from ../../../../../sysroots/am57xx-evm/usr/include/qt5/Qt=
Core/QtCore:4,
                 from ../../../../../sysroots/am57xx-evm/usr/include/qt5/Qt=
Widgets/QtWidgetsDepends:2,
                 from ../../../../../sysroots/am57xx-evm/usr/include/qt5/Qt=
Widgets/QtWidgets:3,
                 from ../git/main.cpp:39:
../../../../../sysroots/am57xx-evm/usr/include/qt5/QtCore/qstring.h: At glo=
bal scope:
../../../../../sysroots/am57xx-evm/usr/include/qt5/QtCore/qstring.h:305:14:=
 note: the mangling of 'va_list' has changed in GCC 4.4
arm-linux-gnueabihf-g++  -march=3Darmv7-a -marm -mthumb-interwork -mfloat-a=
bi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a15 --sysroot=3D/home/gtbldadm/ti/oe=
-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/dra=
7xx-evm -L/opt/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-rpath-link,/opt/=
linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,-=
O1 -Wl,-rpath-link,/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp=
-external-linaro-toolchain/sysroots/am57xx-evm/usr/lib -o matrix_browser ma=
in.o   -lQt5WebKitWidgets -lxslt -lz -lm -lgio-2.0 -lgstapp-0.10 -lgstinter=
faces-0.10 -lgstpbutils-0.10 -lgstvideo-0.10 -lgstbase-0.10 -lgstreamer-0.1=
0 -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -pthread -lrt -lglib-2.0 -lxml2=
 -lsqlite3 -licui18n -licuuc -licudata -lQt5Sql -lQt5Quick -lQt5OpenGL -lQt=
5PrintSupport -lQt5WebKit -lQt5Qml -lQt5Widgets -lQt5Network -lQt5Positioni=
ng -lQt5Sensors -lQt5Gui -lQt5Core -lGLESv2 -lpthread
/opt/linaro-2013.03/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../ar=
m-linux-gnueabihf/bin/ld: cannot find -lQt5WebKitWidgets
/opt/linaro-2013.03/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../ar=
m-linux-gnueabihf/bin/ld: cannot find -lQt5WebKit
collect2: error: ld returned 1 exit status
make: *** [matrix_browser] Error 1
ERROR: oe_runmake failed
WARNING: /home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-=
linaro-toolchain/work/cortexa15t2hf-vfp-neon-oe-linux-gnueabi/matrix-gui-br=
owser/2.0-r7/temp/run.do_compile.16225:1 exit 1 from
  exit 1
ERROR: Function failed: do_compile (log file is located at /home/gtbldadm/t=
i/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/work/cor=
texa15t2hf-vfp-neon-oe-linux-gnueabi/matrix-gui-browser/2.0-r7/temp/log.do_=
compile.16225)


--_000_4B26FB5A64EBA14C87266869E037F958140B815FDFLE09entticom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:207881370;
	mso-list-type:hybrid;
	mso-list-template-ids:1364481002 -2009037132 67698691 67698693 67698689 67=
698691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0D8;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:"Courier New";}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">Hi all,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">With the latest patches, the &#8220;matrix-gui-browser&#82=
21; recipe is failing to compile. Any help would be appreciated.<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">My build configuration is as follows:<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Wi=
ngdings"><span style=3D"mso-list:Ignore">=D8<span style=3D"font:7.0pt &quot=
;Times New Roman&quot;">&nbsp;
</span></span></span><![endif]><span style=3D"font-size:10.0pt;font-family:=
&quot;Courier New&quot;">Oe-layersetup config file: arago-daisy-config.txt<=
o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Wi=
ngdings"><span style=3D"mso-list:Ignore">=D8<span style=3D"font:7.0pt &quot=
;Times New Roman&quot;">&nbsp;
</span></span></span><![endif]><span style=3D"font-size:10.0pt;font-family:=
&quot;Courier New&quot;">MACHINE=3Ddra7xx-evm<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Wi=
ngdings"><span style=3D"mso-list:Ignore">=D8<span style=3D"font:7.0pt &quot=
;Times New Roman&quot;">&nbsp;
</span></span></span><![endif]><span style=3D"font-size:10.0pt;font-family:=
&quot;Courier New&quot;">BITBAKE Target: arago-amsdk-image<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">Let me know if there is any other information that I need =
to provide. The error log is provided below.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">Thank you,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">Jake<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">DEBUG: Executing shell function do_compile<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">NOTE: make -j 16 MAKEFLAGS=3D-j 16 OE_QMAKE_COMPILER=3Darm=
-linux-gnueabihf-gcc&nbsp; -march=3Darmv7-a -marm -mthumb-interwork -mfloat=
-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a15 --sysroot=3D/home/gtbldadm/ti/=
oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/d=
ra7xx-evm
 OE_QMAKE_CC=3Darm-linux-gnueabihf-gcc&nbsp; -march=3Darmv7-a -marm -mthumb=
-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a15 --sysroot=3D=
/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-to=
olchain/sysroots/dra7xx-evm OE_QMAKE_CXX=3Darm-linux-gnueabihf-g&#43;&#43;&=
nbsp;
 -march=3Darmv7-a -marm -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -=
mtune=3Dcortex-a15 --sysroot=3D/home/gtbldadm/ti/oe-layersetup/build-CORTEX=
_1/arago-tmp-external-linaro-toolchain/sysroots/dra7xx-evm OE_QMAKE_CFLAGS=
=3D -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include&nbsp;
 -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types OE_QMAKE_CXX=
FLAGS=3D -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include&nbsp; -fst=
ack-protector -O2 -pipe -g -feliminate-unused-debug-types OE_QMAKE_LINK=3Da=
rm-linux-gnueabihf-g&#43;&#43;&nbsp; -march=3Darmv7-a -marm
 -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a15 --sy=
sroot=3D/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-l=
inaro-toolchain/sysroots/dra7xx-evm OE_QMAKE_LDFLAGS=3D -L/opt/linaro-2013.=
03/arm-linux-gnueabihf/lib -Wl,-rpath-link,/opt/linaro-2013.03/arm-linux-gn=
ueabihf/lib
 -Wl,-O1 -Wl,--hash-style=3Dgnu OE_QMAKE_AR=3Darm-linux-gnueabihf-ar OE_QMA=
KE_STRIP=3Decho OE_QMAKE_WAYLAND_SCANNER=3D/home/gtbldadm/ti/oe-layersetup/=
build-CORTEX_1/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/us=
r/bin/wayland-scanner<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">arm-linux-gnueabihf-g&#43;&#43;&nbsp; -march=3Darmv7-a -ma=
rm -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a15 --=
sysroot=3D/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external=
-linaro-toolchain/sysroots/dra7xx-evm
 -c -pipe -isystem/opt/linaro-2013.03/arm-linux-gnueabihf/include&nbsp; -fs=
tack-protector -O2 -pipe -g -feliminate-unused-debug-types -O2 -Wall -W -D_=
REENTRANT -fPIE -DQT_NO_DEBUG -DQT_WEBKITWIDGETS_LIB -DQT_QUICK_LIB -DQT_OP=
ENGL_LIB -DQT_PRINTSUPPORT_LIB -DQT_WEBKIT_LIB
 -DQT_QML_LIB -DQT_WIDGETS_LIB -DQT_NETWORK_LIB -DQT_POSITIONING_LIB -DQT_S=
ENSORS_LIB -DQT_GUI_LIB -DQT_CORE_LIB -I../../../../../sysroots/am57xx-evm/=
usr/lib/qt5/mkspecs/linux-oe-g&#43;&#43; -I../git -I../git -I../../../../..=
/sysroots/am57xx-evm/usr/include/qt5 -I../../../../../sysroots/am57xx-evm/u=
sr/include/qt5/QtWebKitWidgets
 -I../../../../../sysroots/am57xx-evm/usr/include/qt5/QtQuick -I../../../..=
/../sysroots/am57xx-evm/usr/include/qt5/QtOpenGL -I../../../../../sysroots/=
am57xx-evm/usr/include/qt5/QtPrintSupport -I../../../../../sysroots/am57xx-=
evm/usr/include/qt5/QtWebKit -I../../../../../sysroots/am57xx-evm/usr/inclu=
de/qt5/QtQml
 -I../../../../../sysroots/am57xx-evm/usr/include/qt5/QtWidgets -I../../../=
../../sysroots/am57xx-evm/usr/include/qt5/QtNetwork -I../../../../../sysroo=
ts/am57xx-evm/usr/include/qt5/QtPositioning -I../../../../../sysroots/am57x=
x-evm/usr/include/qt5/QtSensors
 -I../../../../../sysroots/am57xx-evm/usr/include/qt5/QtGui -I../../../../.=
./sysroots/am57xx-evm/usr/include/qt5/QtCore -I. -I. -o main.o ../git/main.=
cpp<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">../git/main.cpp: In function 'int main(int, char**)':<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">../git/main.cpp:50:67: warning: the address of 'QTextStrea=
m&amp; endl(QTextStream&amp;)' will always evaluate as 'true' [-Waddress]<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">In file included from ../../../../../sysroots/am57xx-evm/u=
sr/include/qt5/QtCore/qobject.h:49:0,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from ../../../../../sysroots/am57xx-=
evm/usr/include/qt5/QtCore/qabstractanimation.h:45,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from ../../../../../sysroots/am57xx-=
evm/usr/include/qt5/QtCore/QtCore:4,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from ../../../../../sysroots/am57xx-=
evm/usr/include/qt5/QtWidgets/QtWidgetsDepends:2,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from ../../../../../sysroots/am57xx-=
evm/usr/include/qt5/QtWidgets/QtWidgets:3,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from ../git/main.cpp:39:<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">../../../../../sysroots/am57xx-evm/usr/include/qt5/QtCore/=
qstring.h: At global scope:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">../../../../../sysroots/am57xx-evm/usr/include/qt5/QtCore/=
qstring.h:305:14: note: the mangling of 'va_list' has changed in GCC 4.4<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">arm-linux-gnueabihf-g&#43;&#43;&nbsp; -march=3Darmv7-a -ma=
rm -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a15 --=
sysroot=3D/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external=
-linaro-toolchain/sysroots/dra7xx-evm
 -L/opt/linaro-2013.03/arm-linux-gnueabihf/lib -Wl,-rpath-link,/opt/linaro-=
2013.03/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,-O1 -Wl,=
-rpath-link,/home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-extern=
al-linaro-toolchain/sysroots/am57xx-evm/usr/lib
 -o matrix_browser main.o&nbsp;&nbsp; -lQt5WebKitWidgets -lxslt -lz -lm -lg=
io-2.0 -lgstapp-0.10 -lgstinterfaces-0.10 -lgstpbutils-0.10 -lgstvideo-0.10=
 -lgstbase-0.10 -lgstreamer-0.10 -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 =
-pthread -lrt -lglib-2.0 -lxml2 -lsqlite3
 -licui18n -licuuc -licudata -lQt5Sql -lQt5Quick -lQt5OpenGL -lQt5PrintSupp=
ort -lQt5WebKit -lQt5Qml -lQt5Widgets -lQt5Network -lQt5Positioning -lQt5Se=
nsors -lQt5Gui -lQt5Core -lGLESv2 -lpthread
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">/opt/linaro-2013.03/bin/../lib/gcc/arm-linux-gnueabihf/4.7=
.3/../../../../arm-linux-gnueabihf/bin/ld: cannot find -lQt5WebKitWidgets<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">/opt/linaro-2013.03/bin/../lib/gcc/arm-linux-gnueabihf/4.7=
.3/../../../../arm-linux-gnueabihf/bin/ld: cannot find -lQt5WebKit<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">collect2: error: ld returned 1 exit status<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">make: *** [matrix_browser] Error 1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">ERROR: oe_runmake failed<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">WARNING: /home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/ar=
ago-tmp-external-linaro-toolchain/work/cortexa15t2hf-vfp-neon-oe-linux-gnue=
abi/matrix-gui-browser/2.0-r7/temp/run.do_compile.16225:1
 exit 1 from<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp; exit 1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">ERROR: Function failed: do_compile (log file is located at=
 /home/gtbldadm/ti/oe-layersetup/build-CORTEX_1/arago-tmp-external-linaro-t=
oolchain/work/cortexa15t2hf-vfp-neon-oe-linux-gnueabi/matrix-gui-browser/2.=
0-r7/temp/log.do_compile.16225)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_4B26FB5A64EBA14C87266869E037F958140B815FDFLE09entticom_--
