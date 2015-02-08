Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D8A2752093
	for <meta-arago@arago-project.org>;
	Sun,  8 Feb 2015 01:39:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t181da21030389
	for <meta-arago@arago-project.org>; Sat, 7 Feb 2015 19:39:36 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t181dZ71021183
	for <meta-arago@arago-project.org>; Sat, 7 Feb 2015 19:39:35 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Sat, 7 Feb 2015 19:39:35 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t181dYG6005641;	Sat, 7 Feb 2015 19:39:34 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 7 Feb 2015 20:39:32 -0500
Message-ID: <1423359573-24792-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] branding-mcsdk: Adding MCSDK branding include file
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
X-List-Received-Date: Sun, 08 Feb 2015 01:39:39 -0000
Content-Type: text/plain

- To control preferred version and providers for MCSDK

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Update from previous patch
- Removed commented lines
- removed opengl
- Changed PREFERRED_PROVIDER_glibc-gconv-iso8859-1 to "eglibc-locale
---
---
 .../conf/distro/include/branding-mcsdk.inc         |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-mcsdk.inc

diff --git a/meta-arago-distro/conf/distro/include/branding-mcsdk.inc b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
new file mode 100644
index 0000000..9fca5af
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
@@ -0,0 +1,18 @@
+# MCSDK branding configuration
+
+# Use the MCSDK supported versions
+PREFERRED_VERSION_libnl = "3.2.24"
+
+DISTRO_FEATURES += "x11"
+
+# Java preferences.
+PREFERRED_VERSION_icedtea7-native = "2.1.3"
+PREFERRED_PROVIDER_openjdk-7-jre = "openjdk-7-jre"
+
+PREFERRED_PROVIDER_virtual/java-initial = "cacao-initial"
+
+PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
+PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
+
+PREFERRED_PROVIDER_jpeg-native = "jpeg-native"
+PREFERRED_PROVIDER_glibc-gconv-iso8859-1 = "eglibc-locale"
-- 
1.7.9.5


