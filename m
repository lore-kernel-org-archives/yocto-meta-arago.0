Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 2343A529C8
	for <meta-arago@arago-project.org>;
	Tue, 24 Jun 2014 03:17:13 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7N00NXAL4O2EA0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 23 Jun 2014 22:17:12 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0AE8420368; Mon,
	23 Jun 2014 23:17:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 23 Jun 2014 23:17:10 -0400
Message-id: <1403579830-27590-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1403579830-27590-1-git-send-email-denis@denix.org>
References: <1403579830-27590-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/3] arago: temporarily filter out "sgx" machine feature, when building for 3.14+ kernel
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
X-List-Received-Date: Tue, 24 Jun 2014 03:17:13 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf              | 3 +++
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 7d916e3..b9af13f 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -47,6 +47,9 @@ TARGET_CPPFLAGS += "-fstack-protector"
 # Load default preferences
 require conf/distro/include/arago-prefs.inc
 
+# Hack out sgx flag for now, as breaking on kernels >= 3.14
+MACHINE_FEATURES := "${@filter_out('sgx','${MACHINE_FEATURES}',d)}"
+
 # Allow branding on top of Arago Distro and Core TI-SDK
 # If ARAGO_BRAND is not set in local.conf, default to core
 ARAGO_BRAND ??= "core"
diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index bcc885c..6773053 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -98,3 +98,7 @@ PREFERRED_VERSION_gettext = "0.16.1"
 PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
 PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
+
+def filter_out(f, str, d):
+    from re import match
+    return " ".join(filter(lambda x: not match(f, x, 0), str.split()))
-- 
2.0.0


