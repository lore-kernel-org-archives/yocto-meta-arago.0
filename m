Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id D081C52A83
	for <meta-arago@arago-project.org>;
	Thu,  9 Aug 2012 04:37:20 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q794bJaY018998;
	Wed, 8 Aug 2012 23:37:19 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q794bJcu002142;
	Wed, 8 Aug 2012 23:37:19 -0500
Received: from DFLE30.ent.ti.com ([fe80::648b:2220:c6fb:4e6]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Wed, 8 Aug 2012 23:37:19 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [branches:master][PATCH 2/2 v3] busybox: Enable
	vlan,	tftpd, udpsvd, tcpsvd  and inetd
Thread-Index: AQHNdebFK8608HdhaU+RWYMXkG7tXZdQ5YR5
Date: Thu, 9 Aug 2012 04:37:19 +0000
Message-ID: <A4B6DC62-4FF5-4F92-B4C7-480EDDCD8B8C@ti.com>
References: <1344462645-2945-1-git-send-email-fcooper@ti.com>
	<1344462645-2945-2-git-send-email-fcooper@ti.com>,
	<2fc6fdb7-a8a9-4517-8ec5-7cb4c245a6fa@email.android.com>
In-Reply-To: <2fc6fdb7-a8a9-4517-8ec5-7cb4c245a6fa@email.android.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [branches:master][PATCH 2/2 v3] busybox: Enable vlan, tftpd, udpsvd, tcpsvd and inetd
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
X-List-Received-Date: Thu, 09 Aug 2012 04:37:21 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_A4B6DC624FF54F92B4C7480EDDCD8B8Cticom_"

--_000_A4B6DC624FF54F92B4C7480EDDCD8B8Cticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

How do you differentiate between what goes in distro  and what goes in extr=
as? Based off of my understanding of what should go where the extras layer =
would be the best fit.




On Aug 8, 2012, at 11:23 PM, "Denys Dmytriyenko" <denis@denix.org<mailto:de=
nis@denix.org>> wrote:

A quick comment - these should go to meta-arago-distro and not extras.

Denys


Franklin S Cooper Jr <fcooper@ti.com<mailto:fcooper@ti.com>> wrote:

* Enable vconfig which is useful for devices that support the virtual
  lan kernel option such as the am335x

* Enable tftpd ,udpsvd and tcpsvd

* Enable inetd service which is used by various programs including tftpd

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com<mailto:fcooper@ti.com>>
---
 .../recipes-core/busybox/busybox/defconfig         |   20 ++++++++++------=
----
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-arago-extras/recipes-core/busybox/busybox/defconfig b/met=
a-arago-extras/recipes-core/busybox/busybox/defconfig
index 372d7b5..4aa0e7e 100644
--- a/meta-arago-extras/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-extras/recipes-core/busybox/busybox/defconfig
@@ -774,12 +774,12 @@ CONFIG_FEATURE_IFUPDOWN_IPV4=3Dy
 CONFIG_FEATURE_IFUPDOWN_IPV6=3Dy
 CONFIG_FEATURE_IFUPDOWN_MAPPING=3D
 y

# CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not set
-# CONFIG_INETD is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN is not set
+CONFIG_INETD=3Dy
+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO=3Dy
+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD=3Dy
+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME=3Dy
+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME=3Dy
+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN=3Dy
 # CONFIG_FEATURE_INETD_RPC is not set
 CONFIG_IP=3Dy
 CONFIG_FEATURE_IP_ADDRESS=3Dy
@@ -806,7 +806,7 @@ CONFIG_NSLOOKUP=3Dy
 # CONFIG_PSCAN is not set
 CONFIG_ROUTE=3Dy
 # CONFIG_SLATTACH is not set
-# CONFIG_TCPSVD is not set
+CONFIG_TCPSVD=3Dy
 CONFIG_TELNET=3Dy
 #
CONFIG_FEATURE_TELNET_TTYPE is not set
 CONFIG_FEATURE_TELNET_AUTOLOGIN=3Dy
@@ -814,7 +814,7 @@ CONFIG_FEATURE_TELNET_AUTOLOGIN=3Dy
 # CONFIG_FEATURE_TELNETD_STANDALONE is not set
 # CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
 CONFIG_TFTP=3Dy
-# CONFIG_TFTPD is not set
+CONFIG_TFTPD=3Dy

 #
 # Common options for tftp/tftpd
@@ -846,8 +846,8 @@ CONFIG_UDHCP_DEBUG=3D0
 CONFIG_UDHCPC_DEFAULT_SCRIPT=3D"/usr/share/udhcpc/default.script"
 CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=3D80
 CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=3D"-R -n"
-# CONFIG_UDPSVD is not set
-# CONFIG_VCONFIG is not set
+CONFIG_UDPSVD=3Dy
+CONFIG_VCONFIG=3Dy
 CONFIG_WGET=3Dy
 CONFIG_FEATURE_WGET_STATUSBAR=3Dy
 CONFIG_FEATURE_WGET_AUTHENTICATION=3Dy
--
1.7.0.4<http://1.7.0.4>

________________________________

meta-arago mailing list
meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


--_000_A4B6DC624FF54F92B4C7480EDDCD8B8Cticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body bgcolor=3D"#FFFFFF">
<div>How do you differentiate between what goes in distro &nbsp;and what go=
es in extras? Based off of my understanding of what should go where the ext=
ras layer would be the best fit.</div>
<div><br>
</div>
<div><br>
</div>
<div><br>
<br>
On Aug 8, 2012, at 11:23 PM, &quot;Denys Dmytriyenko&quot; &lt;<a href=3D"m=
ailto:denis@denix.org">denis@denix.org</a>&gt; wrote:<br>
<br>
</div>
<div></div>
<blockquote type=3D"cite">
<div>A quick comment - these should go to meta-arago-distro and not extras.=
<br>
<br>
Denys<br>
<br>
<br>
<div class=3D"gmail_quote">Franklin S Cooper Jr &lt;<a href=3D"mailto:fcoop=
er@ti.com">fcooper@ti.com</a>&gt; wrote:
<blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<pre style=3D"white-space: pre-wrap; word-wrap:break-word; font-family: san=
s-serif">* Enable vconfig which is useful for devices that support the virt=
ual<br>  lan kernel option such as the am335x<br><br>* Enable tftpd ,udpsvd=
 and tcpsvd<br><br>* Enable inetd service which is used by various programs=
 including tftpd<br><br>Signed-off-by: Franklin S Cooper Jr &lt;<a href=3D"=
mailto:fcooper@ti.com">fcooper@ti.com</a>&gt;<br>---<br> .../recipes-core/b=
usybox/busybox/defconfig         |   20 &#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;----------<br> 1 files changed, 10 insertions(&#43;), 10 del=
etions(-)<br><br>diff --git a/meta-arago-extras/recipes-core/busybox/busybo=
x/defconfig b/meta-arago-extras/recipes-core/busybox/busybox/defconfig<br>i=
ndex 372d7b5..4aa0e7e 100644<br>--- a/meta-arago-extras/recipes-core/busybo=
x/busybox/defconfig<br>&#43;&#43;&#43; b/meta-arago-extras/recipes-core/bus=
ybox/busybox/defconfig<br>@@ -774,12 &#43;774,12 @@ CONFIG_FEATURE_IFUPDOWN=
_IPV4=3Dy<br> CONFIG_FEATURE_IFUPDOWN_IPV6=3Dy<br> CONFIG_FEATURE_IFUPDOWN_=
MAPPING=3D
 y<br>
# CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not set<br>-# CONFIG_INETD is no=
t set<br>-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO is not set<br>-# CONF=
IG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD is not set<br>-# CONFIG_FEATURE_IN=
ETD_SUPPORT_BUILTIN_TIME is not set<br>-# CONFIG_FEATURE_INETD_SUPPORT_BUIL=
TIN_DAYTIME is not set<br>-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN i=
s not set<br>&#43;CONFIG_INETD=3Dy<br>&#43;CONFIG_FEATURE_INETD_SUPPORT_BUI=
LTIN_ECHO=3Dy<br>&#43;CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD=3Dy<br>&=
#43;CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME=3Dy<br>&#43;CONFIG_FEATURE_IN=
ETD_SUPPORT_BUILTIN_DAYTIME=3Dy<br>&#43;CONFIG_FEATURE_INETD_SUPPORT_BUILTI=
N_CHARGEN=3Dy<br> # CONFIG_FEATURE_INETD_RPC is not set<br> CONFIG_IP=3Dy<b=
r> CONFIG_FEATURE_IP_ADDRESS=3Dy<br>@@ -806,7 &#43;806,7 @@ CONFIG_NSLOOKUP=
=3Dy<br> # CONFIG_PSCAN is not set<br> CONFIG_ROUTE=3Dy<br> # CONFIG_SLATTA=
CH is not set<br>-# CONFIG_TCPSVD is not set<br>&#43;CONFIG_TCPSVD=3Dy<br> =
CONFIG_TELNET=3Dy<br> #
CONFIG_FEATURE_TELNET_TTYPE is not set<br> CONFIG_FEATURE_TELNET_AUTOLOGIN=
=3Dy<br>@@ -814,7 &#43;814,7 @@ CONFIG_FEATURE_TELNET_AUTOLOGIN=3Dy<br> # C=
ONFIG_FEATURE_TELNETD_STANDALONE is not set<br> # CONFIG_FEATURE_TELNETD_IN=
ETD_WAIT is not set<br> CONFIG_TFTP=3Dy<br>-# CONFIG_TFTPD is not set<br>&#=
43;CONFIG_TFTPD=3Dy<br> <br> #<br> # Common options for tftp/tftpd<br>@@ -8=
46,8 &#43;846,8 @@ CONFIG_UDHCP_DEBUG=3D0<br> CONFIG_UDHCPC_DEFAULT_SCRIPT=
=3D&quot;/usr/share/udhcpc/default.script&quot;<br> CONFIG_UDHCPC_SLACK_FOR=
_BUGGY_SERVERS=3D80<br> CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=3D&quot;-R -n&qu=
ot;<br>-# CONFIG_UDPSVD is not set<br>-# CONFIG_VCONFIG is not set<br>&#43;=
CONFIG_UDPSVD=3Dy<br>&#43;CONFIG_VCONFIG=3Dy<br> CONFIG_WGET=3Dy<br> CONFIG=
_FEATURE_WGET_STATUSBAR=3Dy<br> CONFIG_FEATURE_WGET_AUTHENTICATION=3Dy<br>-=
- <br><a href=3D"http://1.7.0.4">1.7.0.4</a><br><br><hr><br>meta-arago mail=
ing list<br><a href=3D"mailto:meta-arago@arago-project.org">meta-arago@arag=
o-project.org</a><br><a href=3D"http://arago-project.org/cgi-bin/mailman/li=
stinfo/meta-arago">http://arago-project.org/cgi-bin/mailman/listinfo/meta-a=
rago</a><br><br></pre>
</blockquote>
</div>
</div>
</blockquote>
</body>
</html>

--_000_A4B6DC624FF54F92B4C7480EDDCD8B8Cticom_--
