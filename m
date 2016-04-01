Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTPS id 1F79652A93
	for <meta-arago@arago-project.org>;
	Fri,  1 Apr 2016 03:52:03 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.154])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4X0025XS2BA060@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 31 Mar 2016 22:51:48 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=Ut/DdBcw22SB5hFy08yqCQ==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=z88cejFm52V6fhsoaAMA:9
Received: by 100.15.86.14 with SMTP id 66a0fdcf; Fri, 01 Apr 2016 03:51:48 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 357C9161F72;	Thu,
	31 Mar 2016 23:41:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 31 Mar 2016 23:41:46 -0400
Message-id: <1459482106-27723-27-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1459482106-27723-1-git-send-email-denis@denix.org>
References: <1459482106-27723-1-git-send-email-denis@denix.org>
Subject: [PATCH 26/26] arago.conf: disable bluez5, disable -fstack-protector, restore git-native ASSUME_PROVIDED
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
X-List-Received-Date: Fri, 01 Apr 2016 03:52:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

Need to use security_flags.inc for things like -fstack-protector and -D_FORTIFY_SOURCE

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 526e1a9..df90133 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -30,6 +30,7 @@ NO32LIBS = "0"
 
 # Set our distro features, don't forget all the standard libc ones
 DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g ipv4 ipv6 pulseaudio ${DISTRO_FEATURES_LIBC}"
+DISTRO_FEATURES_BACKFILL_CONSIDERED = "bluez5"
 
 # Set additional distro features
 DISTRO_FEATURES += "pam wayland"
@@ -90,16 +91,11 @@ require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
 
 # Enable basic stack and buffer overflow protections
 #TARGET_CPPFLAGS += "-fstack-protector -D_FORTIFY_SOURCE=1"
-TARGET_CPPFLAGS += "-fstack-protector"
+#TARGET_CPPFLAGS += "-fstack-protector"
 
 # Load default preferences
 require conf/distro/include/arago-prefs.inc
 
-# Remove the ASSUME_PROVIDED setting for git-native so that we can
-# use the latest version for the sourceipk which leads to a smaller
-# git history.
-ASSUME_PROVIDED := "${@filter_out('git-native','${ASSUME_PROVIDED}',d)}"
-
 # Enable generation of source packages for SDKs
 require arago-source-ipk.conf
 
-- 
2.2.0


