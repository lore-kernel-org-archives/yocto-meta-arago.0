Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 9D96C52A83
	for <meta-arago@arago-project.org>;
	Thu,  9 Aug 2012 04:23:57 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M8H0005V076EXJ0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 08 Aug 2012 23:23:46 -0500 (CDT)
Received: from [25.230.225.209] (m882336d0.tmodns.net [208.54.35.136])
	by gandalf.denix.org (Postfix) with ESMTPA id 4F06020094; Thu,
	09 Aug 2012 00:23:30 -0400 (EDT)
References: <1344462645-2945-1-git-send-email-fcooper@ti.com>
	<1344462645-2945-2-git-send-email-fcooper@ti.com>
User-Agent: K-9 Mail for Android
In-reply-to: <1344462645-2945-2-git-send-email-fcooper@ti.com>
MIME-version: 1.0
From: Denys Dmytriyenko <denis@denix.org>
Date: Thu, 09 Aug 2012 00:23:25 -0400
To: Franklin S Cooper Jr <fcooper@ti.com>,meta-arago@arago-project.org
Message-id: <2fc6fdb7-a8a9-4517-8ec5-7cb4c245a6fa@email.android.com>
Subject: Re: [branches:master][PATCH 2/2 v3] busybox: Enable vlan,	tftpd, udpsvd, tcpsvd and inetd
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
X-List-Received-Date: Thu, 09 Aug 2012 04:23:58 -0000
Content-type: multipart/alternative;
	boundary=----7VE81AQ2ME0US4W95AJYOT6TO4C2X3

------7VE81AQ2ME0US4W95AJYOT6TO4C2X3
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit

A quick comment - these should go to meta-arago-distro and not extras.

Denys


Franklin S Cooper Jr <fcooper@ti.com> wrote:

* Enable vconfig which is useful for devices that support the virtual
lan kernel option such as the am335x

* Enable tftpd ,udpsvd and tcpsvd

* Enable inetd service which is used by various programs including tftpd

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
.../recipes-core/busybox/busybox/defconfig | 20 ++++++++++----------
1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-arago-extras/recipes-core/busybox/busybox/defconfig b/meta-arago-extras/recipes-core/busybox/busybox/defconfig
index 372d7b5..4aa0e7e 100644
--- a/meta-arago-extras/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-extras/recipes-core/busybox/busybox/defconfig
@@ -774,12 +774,12 @@ CONFIG_FEATURE_IFUPDOWN_IPV4=y
CONFIG_FEATURE_IFUPDOWN_IPV6=y
CONFIG_FEATURE_IFUPDOWN_MAPPING=y
# CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not set
-# CONFIG_INETD is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME is not set
-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN is not set
+CONFIG_INETD=y
+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO=y
+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD=y
+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME=y
+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME=y
+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN=y
# CONFIG_FEATURE_INETD_RPC is not set
CONFIG_IP=y
CONFIG_FEATURE_IP_ADDRESS=y
@@ -806,7 +806,7 @@ CONFIG_NSLOOKUP=y
# CONFIG_PSCAN is not set
CONFIG_ROUTE=y
# CONFIG_SLATTACH is not set
-# CONFIG_TCPSVD is not set
+CONFIG_TCPSVD=y
CONFIG_TELNET=y
# CONFIG_FEATURE_TELNET_TTYPE is not set
CONFIG_FEATURE_TELNET_AUTOLOGIN=y
@@ -814,7 +814,7 @@ CONFIG_FEATURE_TELNET_AUTOLOGIN=y
# CONFIG_FEATURE_TELNETD_STANDALONE is not set
# CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
CONFIG_TFTP=y
-# CONFIG_TFTPD is not set
+CONFIG_TFTPD=y

#
# Common options for tftp/tftpd
@@ -846,8 +846,8 @@ CONFIG_UDHCP_DEBUG=0
CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"
CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"
-# CONFIG_UDPSVD is not set
-# CONFIG_VCONFIG is not set
+CONFIG_UDPSVD=y
+CONFIG_VCONFIG=y
CONFIG_WGET=y
CONFIG_FEATURE_WGET_STATUSBAR=y
CONFIG_FEATURE_WGET_AUTHENTICATION=y
-- 
1.7.0.4

_____________________________________________

meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


------7VE81AQ2ME0US4W95AJYOT6TO4C2X3
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head></head><body>A quick comment - these should go to meta-arago-distro and not extras.<br>
<br>
Denys<br>
<br><br><div class="gmail_quote">Franklin S Cooper Jr &lt;fcooper@ti.com&gt; wrote:<blockquote class="gmail_quote" style="margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<pre style="white-space: pre-wrap; word-wrap:break-word; font-family: sans-serif">* Enable vconfig which is useful for devices that support the virtual<br />  lan kernel option such as the am335x<br /><br />* Enable tftpd ,udpsvd and tcpsvd<br /><br />* Enable inetd service which is used by various programs including tftpd<br /><br />Signed-off-by: Franklin S Cooper Jr &lt;fcooper@ti.com&gt;<br />---<br /> .../recipes-core/busybox/busybox/defconfig         |   20 ++++++++++----------<br /> 1 files changed, 10 insertions(+), 10 deletions(-)<br /><br />diff --git a/meta-arago-extras/recipes-core/busybox/busybox/defconfig b/meta-arago-extras/recipes-core/busybox/busybox/defconfig<br />index 372d7b5..4aa0e7e 100644<br />--- a/meta-arago-extras/recipes-core/busybox/busybox/defconfig<br />+++ b/meta-arago-extras/recipes-core/busybox/busybox/defconfig<br />@@ -774,12 +774,12 @@ CONFIG_FEATURE_IFUPDOWN_IPV4=y<br /> CONFIG_FEATURE_IFUPDOWN_IPV6=y<br /> CONFIG_FEATURE_IFUPDOWN_MAPPING=
 y<br />
# CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not set<br />-# CONFIG_INETD is not set<br />-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO is not set<br />-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD is not set<br />-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME is not set<br />-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME is not set<br />-# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN is not set<br />+CONFIG_INETD=y<br />+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO=y<br />+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD=y<br />+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME=y<br />+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME=y<br />+CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN=y<br /> # CONFIG_FEATURE_INETD_RPC is not set<br /> CONFIG_IP=y<br /> CONFIG_FEATURE_IP_ADDRESS=y<br />@@ -806,7 +806,7 @@ CONFIG_NSLOOKUP=y<br /> # CONFIG_PSCAN is not set<br /> CONFIG_ROUTE=y<br /> # CONFIG_SLATTACH is not set<br />-# CONFIG_TCPSVD is not set<br />+CONFIG_TCPSVD=y<br /> CONFIG_TELNET=y<br /> #
CONFIG_FEATURE_TELNET_TTYPE is not set<br /> CONFIG_FEATURE_TELNET_AUTOLOGIN=y<br />@@ -814,7 +814,7 @@ CONFIG_FEATURE_TELNET_AUTOLOGIN=y<br /> # CONFIG_FEATURE_TELNETD_STANDALONE is not set<br /> # CONFIG_FEATURE_TELNETD_INETD_WAIT is not set<br /> CONFIG_TFTP=y<br />-# CONFIG_TFTPD is not set<br />+CONFIG_TFTPD=y<br /> <br /> #<br /> # Common options for tftp/tftpd<br />@@ -846,8 +846,8 @@ CONFIG_UDHCP_DEBUG=0<br /> CONFIG_UDHCPC_DEFAULT_SCRIPT="/usr/share/udhcpc/default.script"<br /> CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80<br /> CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n"<br />-# CONFIG_UDPSVD is not set<br />-# CONFIG_VCONFIG is not set<br />+CONFIG_UDPSVD=y<br />+CONFIG_VCONFIG=y<br /> CONFIG_WGET=y<br /> CONFIG_FEATURE_WGET_STATUSBAR=y<br /> CONFIG_FEATURE_WGET_AUTHENTICATION=y<br />-- <br /><a href="http://1.7.0.4">1.7.0.4</a><br /><br /><hr /><br />meta-arago mailing list<br />meta-arago@arago-project.org<br /><a
href="http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br /><br /></pre></blockquote></div></body></html>

------7VE81AQ2ME0US4W95AJYOT6TO4C2X3--
