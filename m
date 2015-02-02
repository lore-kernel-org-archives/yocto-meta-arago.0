Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 67B6E52AAD
	for <meta-arago@arago-project.org>;
	Mon,  2 Feb 2015 19:33:16 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.89.130]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NJ500EHPSYTZK90@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 02 Feb 2015 13:32:54 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=PYxIXZlY c=1 sm=1 tr=0	a=ckUr7rGttv+NBxkAVUaaIw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=0HtSIViG9nkA:10
	a=sozttTNsAAAA:8 a=HihYlcsHAAAA:8	a=JR0nwNoZ03JC6XihI78A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id AA0812001F;	Mon,
	2 Feb 2015 14:32:53 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 02 Feb 2015 14:32:52 -0500
Message-id: <1422905572-22060-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] arago-feed-config, arago.conf: setup default (internal) binary IPK feeds
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
X-List-Received-Date: Mon, 02 Feb 2015 19:33:17 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf           |  4 +-
 .../feed-config/arago-feed-config_1.0.bb           | 43 ++++++++++++++++++++++
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-core/feed-config/arago-feed-config_1.0.bb

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 936e0ac..8f79ca0 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -1,6 +1,8 @@
 # Name and version of the distribution
 DISTRO_NAME = "Arago"
-DISTRO_VERSION = "2015.01"
+DISTRO_VERSION = "2015.02"
+DISTRO_FEED_URI ?= "http://lcpd.dal.design.ti.com"
+FEEDURIPREFIX ?= "core-sdk/nightly/deploy/ipk/"
 
 # SDK paths and names
 SDK_NAME_PREFIX = "arago"
diff --git a/meta-arago-distro/recipes-core/feed-config/arago-feed-config_1.0.bb b/meta-arago-distro/recipes-core/feed-config/arago-feed-config_1.0.bb
new file mode 100644
index 0000000..7bf169b
--- /dev/null
+++ b/meta-arago-distro/recipes-core/feed-config/arago-feed-config_1.0.bb
@@ -0,0 +1,43 @@
+SUMMARY = "Arago feed configuration"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r1"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+INHIBIT_DEFAULT_DEPS = "1"
+
+FEEDNAMEPREFIX ?= ""
+FEEDURIPREFIX ?= "feeds/"
+DISTRO_FEED_URI ?= "http://arago-project.org"
+
+do_compile() {
+	mkdir -p ${S}/${sysconfdir}/opkg/
+
+	archconf=${S}/${sysconfdir}/opkg/arch.conf
+
+	rm -f $archconf
+	ipkgarchs="${ALL_MULTILIB_PACKAGE_ARCHS}"
+	priority=1
+	for arch in $ipkgarchs; do
+		echo "arch $arch $priority" >> $archconf
+		priority=$(expr $priority + 5)
+	done
+
+	basefeedconf=${S}/${sysconfdir}/opkg/base-feeds.conf
+
+	rm -f $basefeedconf
+	touch $basefeedconf
+
+	for arch in $ipkgarchs; do
+		echo "src/gz ${FEEDNAMEPREFIX}$arch ${DISTRO_FEED_URI}/${FEEDURIPREFIX}$arch" >> $basefeedconf
+	done
+}
+
+do_install () {
+	install -d ${D}${sysconfdir}/opkg
+	install -m 0644  ${S}/${sysconfdir}/opkg/* ${D}${sysconfdir}/opkg/
+}
+
+FILES_${PN} = "${sysconfdir}/opkg/"
+
+CONFFILES_${PN} += "${sysconfdir}/opkg/base-feeds.conf \
+                    ${sysconfdir}/opkg/arch.conf"
-- 
2.2.0


