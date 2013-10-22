Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 747F75296F
	for <meta-arago@arago-project.org>;
	Tue, 22 Oct 2013 17:45:56 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9MHjtDb020444
	for <meta-arago@arago-project.org>; Tue, 22 Oct 2013 12:45:55 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9MHjtNX003227
	for <meta-arago@arago-project.org>; Tue, 22 Oct 2013 12:45:55 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 22 Oct 2013 12:45:55 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Rini, Tom"
	<trini@ti.com>
Thread-Topic: [PATCH] udev: Re-fix touchscreen detection rule
Thread-Index: AQHOz0XIgi+cyzuBW0igwRnt4EoKQ5oA/pLn
Date: Tue, 22 Oct 2013 17:45:55 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E8F72C7@DLEE08.ent.ti.com>
References: <1382460184-12671-1-git-send-email-trini@ti.com>
In-Reply-To: <1382460184-12671-1-git-send-email-trini@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH] udev: Re-fix touchscreen detection rule
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
X-List-Received-Date: Tue, 22 Oct 2013 17:45:56 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE72E8F72C7DLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE72E8F72C7DLEE08entticom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Ack. Can push it soon.


Denys


-----Original Message-----
From: Rini, Tom [trini@ti.com]
Received: Tuesday, 22 Oct 2013, 17:43
To: meta-arago@arago-project.org [meta-arago@arago-project.org]
CC: Maupin, Chase [chase.maupin@ti.com]; Cooper Jr., Franklin [fcooper@ti.c=
om]; Dmytriyenko, Denys [denys@ti.com]
Subject: [PATCH] udev: Re-fix touchscreen detection rule

* Fix the rule to detect the touchscreen and create the
  /dev/input/touchscreen0 device node more reliably.  udev knows how to
  detect a touchscreen and sets ID_INPUT_TOUCHSCREEN for us to check
  against.
* This has already been submitted upstream and can be removed
  when meta-arago switches to something that contains this fix, possibly
  Dora.
* The patch has already been submitted to oe-core at:
  http://article.gmane.org/gmane.comp.handhelds.openembedded.core/44297

Cc: Chase Maupin <chase.maupin@ti.com>
Cc: Franklin Cooper Jr. <fcooper@ti.com>
Cc: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Tom Rini <trini@ti.com>
---
 .../recipes-core/udev/udev/local.rules             |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/udev/udev/local.rules b/meta-ar=
ago-distro/recipes-core/udev/udev/local.rules
index d0cbf91..d0b0216 100644
--- a/meta-arago-distro/recipes-core/udev/udev/local.rules
+++ b/meta-arago-distro/recipes-core/udev/udev/local.rules
@@ -17,7 +17,5 @@
 ACTION=3D=3D"add", DEVPATH=3D=3D"/devices/*", ENV{MODALIAS}=3D=3D"?*", RUN=
+=3D"/sbin/modprobe $env{MODALIAS}"

 # Create a symlink to any touchscreen input device
-# Trigger based on input type, that the evbit (-e) has EV_SYN and EV_ABS,
-# has an EV_ABS value (-a) which is used for touchscreen type devices.
-SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*", ATTRS{modalias}=3D=3D"i=
nput:*-e0*,3,*a0,1,*", SYMLINK+=3D"input/touchscreen0"
+SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*", ENV{ID_INPUT_TOUCHSCREE=
N}=3D=3D"1", SYMLINK+=3D"input/touchscreen0"

--
1.7.9.5


--_000_B0581B5571079145BA1CD78C126DBDE72E8F72C7DLEE08entticom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11p=
t; color:black">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">Ack. Can push it soon.<br>
<br>
<br>
Denys<br>
<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Rini, Tom [trini@ti.com]<br>
<b>Received:</b> Tuesday, 22 Oct 2013, 17:43<br>
<b>To:</b> meta-arago@arago-project.org [meta-arago@arago-project.org]<br>
<b>CC:</b> Maupin, Chase [chase.maupin@ti.com]; Cooper Jr., Franklin [fcoop=
er@ti.com]; Dmytriyenko, Denys [denys@ti.com]<br>
<b>Subject:</b> [PATCH] udev: Re-fix touchscreen detection rule<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">* Fix the rule to detect the touchscreen and creat=
e the<br>
&nbsp; /dev/input/touchscreen0 device node more reliably.&nbsp; udev knows =
how to<br>
&nbsp; detect a touchscreen and sets ID_INPUT_TOUCHSCREEN for us to check<b=
r>
&nbsp; against.<br>
* This has already been submitted upstream and can be removed<br>
&nbsp; when meta-arago switches to something that contains this fix, possib=
ly<br>
&nbsp; Dora.<br>
* The patch has already been submitted to oe-core at:<br>
&nbsp; <a href=3D"http://article.gmane.org/gmane.comp.handhelds.openembedde=
d.core/44297">
http://article.gmane.org/gmane.comp.handhelds.openembedded.core/44297</a><b=
r>
<br>
Cc: Chase Maupin &lt;chase.maupin@ti.com&gt;<br>
Cc: Franklin Cooper Jr. &lt;fcooper@ti.com&gt;<br>
Cc: Denys Dmytriyenko &lt;denys@ti.com&gt;<br>
Signed-off-by: Tom Rini &lt;trini@ti.com&gt;<br>
---<br>
&nbsp;.../recipes-core/udev/udev/local.rules&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 4 &#43;---<br=
>
&nbsp;1 file changed, 1 insertion(&#43;), 3 deletions(-)<br>
<br>
diff --git a/meta-arago-distro/recipes-core/udev/udev/local.rules b/meta-ar=
ago-distro/recipes-core/udev/udev/local.rules<br>
index d0cbf91..d0b0216 100644<br>
--- a/meta-arago-distro/recipes-core/udev/udev/local.rules<br>
&#43;&#43;&#43; b/meta-arago-distro/recipes-core/udev/udev/local.rules<br>
@@ -17,7 &#43;17,5 @@<br>
&nbsp;ACTION=3D=3D&quot;add&quot;, DEVPATH=3D=3D&quot;/devices/*&quot;, ENV=
{MODALIAS}=3D=3D&quot;?*&quot;, RUN&#43;=3D&quot;/sbin/modprobe $env{MODALI=
AS}&quot;<br>
&nbsp;<br>
&nbsp;# Create a symlink to any touchscreen input device<br>
-# Trigger based on input type, that the evbit (-e) has EV_SYN and EV_ABS,<=
br>
-# has an EV_ABS value (-a) which is used for touchscreen type devices.<br>
-SUBSYSTEM=3D=3D&quot;input&quot;, KERNEL=3D=3D&quot;event[0-9]*&quot;, ATT=
RS{modalias}=3D=3D&quot;input:*-e0*,3,*a0,1,*&quot;, SYMLINK&#43;=3D&quot;i=
nput/touchscreen0&quot;<br>
&#43;SUBSYSTEM=3D=3D&quot;input&quot;, KERNEL=3D=3D&quot;event[0-9]*&quot;,=
 ENV{ID_INPUT_TOUCHSCREEN}=3D=3D&quot;1&quot;, SYMLINK&#43;=3D&quot;input/t=
ouchscreen0&quot;<br>
&nbsp;<br>
-- <br>
1.7.9.5<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE72E8F72C7DLEE08entticom_--
