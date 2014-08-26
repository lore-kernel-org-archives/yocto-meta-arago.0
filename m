Return-Path: <devin@jd2.com>
Received: from smtp82.ord1c.emailsrvr.com (smtp82.ord1c.emailsrvr.com
	[108.166.43.82])
	by arago-project.org (Postfix) with ESMTPS id 99EC752976
	for <meta-arago@arago-project.org>;
	Tue, 26 Aug 2014 13:37:17 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp19.relay.ord1c.emailsrvr.com (SMTP Server) with ESMTP id
	7042A180987 for <meta-arago@arago-project.org>;
	Tue, 26 Aug 2014 09:37:16 -0400 (EDT)
X-Virus-Scanned: OK
Received: by smtp19.relay.ord1c.emailsrvr.com (Authenticated sender:
	devin-AT-jd2.com) with ESMTPSA id 18EB31808B2
	for <meta-arago@arago-project.org>;
	Tue, 26 Aug 2014 09:37:16 -0400 (EDT)
X-Sender-Id: devin@jd2.com
Received: from DEVINWIN (tn-76-5-156-138.sta.embarqhsd.net [76.5.156.138])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
	by 0.0.0.0:465 (trex/5.2.10); Tue, 26 Aug 2014 13:37:16 GMT
From: "Devin Hughes" <devin@jd2.com>
To: <meta-arago@arago-project.org>
Date: Tue, 26 Aug 2014 09:37:11 -0400
Message-ID: <003101cfc132$d793d8b0$86bb8a10$@jd2.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: Ac/BMENeG7tsuEZNS3mhRYwxryBe8Q==
Subject: Building meta-arago daisy
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
X-List-Received-Date: Tue, 26 Aug 2014 13:37:18 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0032_01CFC111.508482A0"
Content-Language: en-us

------=_NextPart_000_0032_01CFC111.508482A0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Everyone

 

I am trying to build the daisy branch for my 335x-EVMSK. The build is setup
using arago-daisy-config.txt, and I am using the internal linaro compiler. I
get the same results described using the external linaro gcc4.7 toolchain
mentioned on the wiki page. I have run into a couple of problems:

1.      The arago-base-tisdk-image builds successfully and boots on the SK,
but the splash screen fails to show with failure to find /dev/fb0 in dmesg.
After the boot is complete, I can manually display the splash properly. This
makes me think psplash is running before the lcd modules are loaded, and I
was curious if any of you have seen this behavior.

2.  Building arago-core-tisdk-image fails when building qt 5.2.1 with (from
log.do_compile):


/home/devin/yocto/build/arago-tmp-eglibc/work/cortexa8t2hf-vfp-neon-oe-linux
-gnueabi/qtbase/5.2.1-r0-arago2/qtbase-opensource-src-5.2.1/src/tools/qdoc/q
uoter.cpp: In constructor 'Quoter::Quoter()':

/home/devin/yocto/build/arago-tmp-eglibc/work/cortexa8t2hf-vfp-neon-oe-linux
-gnueabi/qtbase/5.2.1-r0-arago2/qtbase-opensource-src-5.2.1/src/tools/qdoc/q
uoter.cpp:139:1: internal compiler error: in add_stores, at
var-tracking.c:5918

}

^

Please submit a full bug report,

with preprocessed source if appropriate.

See <http://gcc.gnu.org/bugs.html> for instructions.

make[2]: *** [.obj/quoter.o] Error 1

make[2]: *** Waiting for unfinished jobs....

 

Any guidance is greatly appreciated.

 

Regards,

Devin Hughes

 


------=_NextPart_000_0032_01CFC111.508482A0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
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
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
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
	{mso-list-id:1082333262;
	mso-list-type:hybrid;
	mso-list-template-ids:442510190 67698703 67698713 67698715 67698703 =
67698713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal>Hello Everyone<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>I am trying =
to build the daisy branch for my 335x-EVMSK. The build is setup using =
arago-daisy-config.txt, and I am using the internal linaro compiler. I =
get the same results described using the external linaro gcc4.7 =
toolchain mentioned on the wiki page. I have run into a couple of =
problems:<o:p></o:p></p><p class=3DMsoListParagraph =
style=3D'text-indent:-.25in;mso-list:l0 level1 lfo1'><![if =
!supportLists]><span style=3D'mso-list:Ignore'>1.<span =
style=3D'font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</span></span><![endif]>The arago-base-tisdk-image builds successfully =
and boots on the SK, but the splash screen fails to show with failure to =
find /dev/fb0 in dmesg. After the boot is complete, I can manually =
display the splash properly. This makes me think psplash is running =
before the lcd modules are loaded, and I was curious if any of you have =
seen this behavior.<o:p></o:p></p><p class=3DMsoListParagraph =
style=3D'text-indent:-.25in;mso-list:l0 level1 lfo1'><![if =
!supportLists]><span style=3D'font-family:"Courier New"'><span =
style=3D'mso-list:Ignore'>2.<span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp; </span></span></span><![endif]>Building =
arago-core-tisdk-image fails when building qt 5.2.1 with (from =
log.do_compile):<span style=3D'font-family:"Courier =
New"'><o:p></o:p></span></p><p class=3DMsoListParagraph><br><span =
style=3D'font-family:"Courier =
New"'>/home/devin/yocto/build/arago-tmp-eglibc/work/cortexa8t2hf-vfp-neon=
-oe-linux-gnueabi/qtbase/5.2.1-r0-arago2/qtbase-opensource-src-5.2.1/src/=
tools/qdoc/quoter.cpp: In constructor =
'Quoter::Quoter()':<o:p></o:p></span></p><p =
class=3DMsoListParagraph><span style=3D'font-family:"Courier =
New"'>/home/devin/yocto/build/arago-tmp-eglibc/work/cortexa8t2hf-vfp-neon=
-oe-linux-gnueabi/qtbase/5.2.1-r0-arago2/qtbase-opensource-src-5.2.1/src/=
tools/qdoc/quoter.cpp:139:1: internal compiler error: in add_stores, at =
var-tracking.c:5918<o:p></o:p></span></p><p =
class=3DMsoListParagraph><span style=3D'font-family:"Courier New"'> =
}<o:p></o:p></span></p><p class=3DMsoListParagraph><span =
style=3D'font-family:"Courier New"'> ^<o:p></o:p></span></p><p =
class=3DMsoListParagraph><span style=3D'font-family:"Courier =
New"'>Please submit a full bug report,<o:p></o:p></span></p><p =
class=3DMsoListParagraph><span style=3D'font-family:"Courier New"'>with =
preprocessed source if appropriate.<o:p></o:p></span></p><p =
class=3DMsoListParagraph><span style=3D'font-family:"Courier New"'>See =
&lt;http://gcc.gnu.org/bugs.html&gt; for =
instructions.<o:p></o:p></span></p><p class=3DMsoListParagraph><span =
style=3D'font-family:"Courier New"'>make[2]: *** [.obj/quoter.o] Error =
1<o:p></o:p></span></p><p class=3DMsoListParagraph><span =
style=3D'font-family:"Courier New"'>make[2]: *** Waiting for unfinished =
jobs....<o:p></o:p></span></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Any guidance =
is greatly appreciated.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Regards,<o:p></o:p></p><p class=3DMsoNormal>Devin =
Hughes<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>

------=_NextPart_000_0032_01CFC111.508482A0--
