Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 7CF0952A51
	for <meta-arago@arago-project.org>;
	Thu, 12 Sep 2019 15:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9D6BB40BF6;
	Thu, 12 Sep 2019 15:38:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 5I_y3mc1uav4; Thu, 12 Sep 2019 15:38:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 238E940C0A;
	Thu, 12 Sep 2019 15:38:48 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A2E20174214;
	Thu, 12 Sep 2019 11:38:44 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Sep 2019 11:38:29 -0400
Message-Id: <1568302717-46518-25-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568302717-46518-1-git-send-email-denys@ti.com>
References: <1568302717-46518-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 24/32] machine_features_check: class for checking MACHINE_FEATURES flags
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
X-List-Received-Date: Thu, 12 Sep 2019 15:40:14 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../classes/machine_features_check.bbclass         | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-arago-distro/classes/machine_features_check.bbclass

diff --git a/meta-arago-distro/classes/machine_features_check.bbclass b/meta-arago-distro/classes/machine_features_check.bbclass
new file mode 100644
index 0000000..da9ee61
--- /dev/null
+++ b/meta-arago-distro/classes/machine_features_check.bbclass
@@ -0,0 +1,31 @@
+# Allow checking of required and conflicting MACHINE_FEATURES
+#
+# ANY_OF_MACHINE_FEATURES:   ensure at least one item on this list is included
+#                           in MACHINE_FEATURES.
+# REQUIRED_MACHINE_FEATURES: ensure every item on this list is included
+#                           in MACHINE_FEATURES.
+# CONFLICT_MACHINE_FEATURES: ensure no item in this list is included in
+#                           MACHINE_FEATURES.
+# Derived from OE-Core distro_features_check.bbclass
+
+python () {
+    # Assume at least one var is set.
+    machine_features = set((d.getVar('MACHINE_FEATURES') or '').split())
+
+    any_of_machine_features = set((d.getVar('ANY_OF_MACHINE_FEATURES') or '').split())
+    if any_of_machine_features:
+        if set.isdisjoint(any_of_machine_features, machine_features):
+            raise bb.parse.SkipRecipe("one of '%s' needs to be in MACHINE_FEATURES" % ' '.join(any_of_machine_features))
+
+    required_machine_features = set((d.getVar('REQUIRED_MACHINE_FEATURES') or '').split())
+    if required_machine_features:
+        missing = set.difference(required_machine_features, machine_features)
+        if missing:
+            raise bb.parse.SkipRecipe("missing required machine feature%s '%s' (not in MACHINE_FEATURES)" % ('s' if len(missing) > 1 else '', ' '.join(missing)))
+
+    conflict_machine_features = set((d.getVar('CONFLICT_MACHINE_FEATURES') or '').split())
+    if conflict_machine_features:
+        conflicts = set.intersection(conflict_machine_features, machine_features)
+        if conflicts:
+            raise bb.parse.SkipRecipe("conflicting machine feature%s '%s' (in MACHINE_FEATURES)" % ('s' if len(conflicts) > 1 else '', ' '.join(conflicts)))
+}
-- 
2.7.4


