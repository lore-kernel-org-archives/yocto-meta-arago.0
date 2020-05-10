Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 5283B529A8
	for <meta-arago@arago-project.org>;
	Sun, 10 May 2020 02:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5514040B89;
	Sun, 10 May 2020 02:43:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Mw8KSmmQcFOw; Sun, 10 May 2020 02:43:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3B9A5409AA;
	Sun, 10 May 2020 02:43:22 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7C7E5172D0E;
	Sat,  9 May 2020 22:43:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat,  9 May 2020 22:43:21 -0400
Message-Id: <1589078601-28009-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH] python3: skip shebang-size QA check for nativesdk-python3 packages
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
X-List-Received-Date: Sun, 10 May 2020 02:45:47 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-devtools/python/python3_%.bbappend | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-arago-distro/recipes-devtools/python/python3_%.bbappend

diff --git a/meta-arago-distro/recipes-devtools/python/python3_%.bbappend b/meta-arago-distro/recipes-devtools/python/python3_%.bbappend
new file mode 100644
index 0000000..3e5bb4c
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python/python3_%.bbappend
@@ -0,0 +1,12 @@
+# In arago.conf, we pre-allocate SDK path very long to reserve enough space in ELF headers
+# and then it gets replaced with a short real path at the time of SDK creation:
+# SDKPATH_REAL = "/usr/local/${SDK_NAME_PREFIX}-${SDK_VERSION}"
+# SDKPATH = "${@"/tmp/"+"x"*96+"/"+"y"*96}"
+# Unfortunately, that triggers the new shebang-size QA check in nativesdk-python3 packages
+
+python() {
+    if d.getVar('CLASSOVERRIDE') == "class-nativesdk":
+        pkgs = d.getVar("PACKAGES").split()
+        for p in pkgs:
+            d.appendVar('INSANE_SKIP_%s' % (p), ' shebang-size')
+}
-- 
2.7.4


