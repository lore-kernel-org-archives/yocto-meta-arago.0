Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 9AADA52ACE
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2015 03:02:42 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQW00LWD5RTN440@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 02 Jul 2015 22:02:29 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=KZwvylsD c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=YkyeFSju_eaELsnz_7gA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 47F3C161AD0;	Thu,
	2 Jul 2015 23:02:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 02 Jul 2015 23:01:33 -0400
Message-id: <1435892533-6046-15-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1435892533-6046-1-git-send-email-denis@denix.org>
References: <1435892533-6046-1-git-send-email-denis@denix.org>
Subject: [PATCH 14/54] curl: remove local configuration of older version, uses PACKAGECONFIG now
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
X-List-Received-Date: Fri, 03 Jul 2015 03:02:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf           |  3 +++
 .../recipes-support/curl/curl_7.35.0.bbappend      | 23 ----------------------
 2 files changed, 3 insertions(+), 23 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-support/curl/curl_7.35.0.bbappend

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index a224a8b..261f1dc 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -45,6 +45,9 @@ PACKAGECONFIG_DISTRO_pn-qtbase = "icu examples"
 # Configure gstreamer dependency based on GST_PROVIDER
 PACKAGECONFIG_pn-qtwebkit = "${@base_conditional('GST_PROVIDER', '0.10', 'gstreamer010', 'gstreamer', d)} qtlocation qtmultimedia qtsensors"
 
+# Prefer OpenSSL over GnuTLS for curl due to TSU exemptions
+PACKAGECONFIG_pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} ssl zlib"
+
 # Enable UI and scripting for perf
 PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
 
diff --git a/meta-arago-distro/recipes-support/curl/curl_7.35.0.bbappend b/meta-arago-distro/recipes-support/curl/curl_7.35.0.bbappend
deleted file mode 100644
index b0afced..0000000
--- a/meta-arago-distro/recipes-support/curl/curl_7.35.0.bbappend
+++ /dev/null
@@ -1,23 +0,0 @@
-# Switch curl configuration from GnuTLS to OpenSSL
-# per TSU exemption and export control restrictions
-
-DEPENDS := "${@d.getVar('DEPENDS', True).replace('gnutls', '')}"
-DEPENDS += "openssl"
-
-EXTRA_OECONF += "\
-            --with-ssl \
-            --disable-ldap \
-            --disable-ares \
-            --disable-ipv6 \
-            --enable-cookies \
-            --enable-dict \
-            --enable-file \
-            --enable-ftp \
-            --enable-http \
-            --enable-telnet \
-            --enable-tftp \
-            "
-
-CURLGNUTLS = "--without-gnutls"
-
-PR_append = "-arago2"
-- 
2.2.0


