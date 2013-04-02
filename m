Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id F3E3852A35
	for <meta-arago@arago-project.org>;
	Tue,  2 Apr 2013 00:52:26 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MKL00IR1RQ5M7Z3@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 01 Apr 2013 19:51:56 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 96EE420087; Mon,
	01 Apr 2013 20:51:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 01 Apr 2013 20:51:06 -0400
Message-id: <1364863868-14687-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
In-reply-to: <1364863868-14687-1-git-send-email-denis@denix.org>
References: <1364863868-14687-1-git-send-email-denis@denix.org>
Subject: [PATCH 1/3] arago.conf: add branding support to allow products to tweak preferences
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
X-List-Received-Date: Tue, 02 Apr 2013 00:52:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

* For cases when products based on Arago Core TI-SDK need to select different
  providers or versions of packages. For example, AM-SDK needs to stay on the
  stable kernel 3.2, while Core TI-SDK is moving to the new kernel 3.8.
* Adding new branding policies requires creating a new branding-<name>.inc file
  and setting ARAGO_BRAND=<name> in the local.conf

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                | 7 +++++++
 meta-arago-distro/conf/distro/include/branding-core.inc | 6 ++++++
 2 files changed, 13 insertions(+)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-core.inc

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 58e199a..3b07cda 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -33,8 +33,15 @@ EXTERNAL_TOOLCHAIN = "${TOOLCHAIN_PATH}"
 # Enable basic stack and buffer overflow protections
 TARGET_CPPFLAGS += "-fstack-protector -D_FORTIFY_SOURCE=1"
 
+# Load default preferences
 require conf/distro/include/arago-prefs.inc
 
+# Allow branding on top of Arago Distro and Core TI-SDK
+# If ARAGO_BRAND is not set in local.conf, default to core
+ARAGO_BRAND ??= "core"
+
+require conf/distro/include/branding-${ARAGO_BRAND}.inc
+
 # Disable polkit's systemd configuration from meta-oe
 POLKITAUTH = ""
 
diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
new file mode 100644
index 0000000..b1ae89b
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -0,0 +1,6 @@
+# Set extra preferences based on the product branding (AM-SDK, MC-SDK, etc)
+# Examples could be different PREFERRED_PROVIDER or PREFERRED_VERSION
+# As well as some other configurable aspects or variables
+# Please avoid creating multiple versions of the same brand, if possible
+# The policy is for the "Core" brand to be the default,
+# hence this file is mostly empty and used as a template
-- 
1.8.1.5


