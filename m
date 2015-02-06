Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6F2CF52A72
	for <meta-arago@arago-project.org>;
	Fri,  6 Feb 2015 18:55:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t16It0kS032616
	for <meta-arago@arago-project.org>; Fri, 6 Feb 2015 12:55:00 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t16IsxZQ020992
	for <meta-arago@arago-project.org>; Fri, 6 Feb 2015 12:54:59 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 6 Feb 2015 12:54:59 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t16Isxw6008342;	Fri, 6 Feb 2015 12:54:59 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 6 Feb 2015 13:54:56 -0500
Message-ID: <1423248896-20699-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] branding-mcsdk: Adding MCSDK branding include file
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
X-List-Received-Date: Fri, 06 Feb 2015 18:55:01 -0000
Content-Type: text/plain

- To control preferred version and providers for MCSDK

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../conf/distro/include/branding-mcsdk.inc         |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-mcsdk.inc

diff --git a/meta-arago-distro/conf/distro/include/branding-mcsdk.inc b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
new file mode 100644
index 0000000..d023b67
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
@@ -0,0 +1,20 @@
+# MCSDK branding configuration
+
+# Use the MCSDK supported versions
+PREFERRED_VERSION_libnl = "3.2.24"
+
+DISTRO_FEATURES += "x11 opengl"
+
+# Java preferences.
+#PREFERRED_VERSION_openjdk-7-jre = "25b30-2.3.12"
+PREFERRED_VERSION_icedtea7-native = "2.1.3"
+PREFERRED_PROVIDER_openjdk-7-jre = "openjdk-7-jre"
+
+PREFERRED_PROVIDER_virtual/java-initial = "cacao-initial"
+
+PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
+PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
+
+PREFERRED_PROVIDER_jpeg-native = "jpeg-native"
+#PREFERRED_PROVIDER_jpeg-native = "libjpeg-turbo-native"
+PREFERRED_PROVIDER_glibc-gconv-iso8859-1 = "nativesdk-eglibc-locale"
-- 
1.7.9.5


