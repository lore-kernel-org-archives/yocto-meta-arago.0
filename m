Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id E945A529A2
	for <meta-arago@arago-project.org>;
	Thu,  4 Mar 2021 06:51:49 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1246q36Y019131
	for <meta-arago@arago-project.org>; Thu, 4 Mar 2021 00:52:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614840723;
	bh=UD83iPpGqIjm/FNQOndvhI1M0Wtzfa+BhfPFY2aFNyM=;
	h=From:To:CC:Subject:Date;
	b=uL4gFhNG9tezydGjzJ7PKazuz/EjKMmSlGdOkeo2u6m6bjwgwLCOz28iNKMlORlzA
	cneO3oo0/3SsWZ5j+AXjC2+4ARHWRsRxZDxGnAHCWYsQ1oYZvkk2vve+m7lfbVqHno
	LBX/VI7FHjXLCLq5R+c6Gp9e+cyC0vWU38ph7q8k=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1246q3oh014637
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 4 Mar 2021 00:52:03 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 4 Mar 2021 00:52:02 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 4 Mar 2021 00:52:03 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1246q2Im004019;
	Thu, 4 Mar 2021 00:52:02 -0600
From: Nishanth Menon <nm@ti.com>
To: meta-arago <meta-arago@arago-project.org>
Date: Thu, 4 Mar 2021 00:52:00 -0600
Message-ID: <20210304065200.15811-1-nm@ti.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b814c1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH dunfell] cryptodev: Move to 1.12 revision
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
X-List-Received-Date: Thu, 04 Mar 2021 06:51:50 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Cryptodev out of kernel module and suite has yet another set of
challenge with broken API compatibility. However, the complete list of
patches beteween dunfell's default 1.10 and current latest 1.12 revisions:
 e0c25e289d6b (tag: cryptodev-linux-1.12) Release version 1.12
 55c6315058fc Fix build for Linux 5.11-rc1
 2f5e08aebf92 Fix build for Linux 5.9-rc1
 e8263d2d682b remove VLA usage from authenc.c
 dafa42cadc86 Fix for change in Kernel 4.4.168
 f4d3653c8dcb Release version 1.11
 9e765068582a Fix build for Linux 5.8-rc1
 7e72f6758f2d enabled the support for TLS1.1 - AES128-SHA1 - AES256-SHA1
 98b163a23f6b cryptlib.c: fix build on kernel v5.5+
 a1e738aef624 tests: cipher-aead-srtp: Fix cao->dst alignment
 f971e0cd4a0e Fix module loading with Linux v5.0-rc5

We have the following choices
1) just cherry-pick minimum set of kernel patches relevant for kernel
compatibility
OR
2) switch to a newer version with richer set of fixups

Attempting to switch to 1.12 version with minimal changes as a better
option to get a wider swath of kernel compatibility.

Signed-off-by: Nishanth Menon <nm@ti.com>
---

DISCLAIMER: This is probably a dumb way of switching to 1.12.. open to
suggestions.

NOTE:
a) master is already on 1.12 -> So, I am suggesting this only for dunfell at the
moment: http://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/cryptodev?h=master

b) gatesgarth is on 1.11 -> we wont get the fixes needed for newer
kernel, so a variant of this will be needed.. http://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/cryptodev?h=gatesgarth

c) dunfell is still on 1.10 -> Same story as gatesgarth.. http://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/cryptodev?h=dunfell

 .../recipes-kernel/cryptodev/cryptodev-linux_%.bbappend     | 5 +++++
 .../recipes-kernel/cryptodev/cryptodev-module_%.bbappend    | 5 +++++
 .../recipes-kernel/cryptodev/cryptodev-tests_%.bbappend     | 6 ++++++
 3 files changed, 16 insertions(+)
 create mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev-linux_%.bbappend
 create mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev-tests_%.bbappend

diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-linux_%.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-linux_%.bbappend
new file mode 100644
index 000000000000..a3fb634463fd
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-linux_%.bbappend
@@ -0,0 +1,5 @@
+# Bring in fixes including https://github.com/cryptodev-linux/cryptodev-linux/pull/55
+# just pull 1.12 revision, everything else remains the same.
+PR = "1.12"
+PR_append = ".arago0"
+SRCREV = "e0c25e289d6baf1d83c2b9cb523d3bc237d0c0c9"
diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
index f8a35cd73765..602ada0daf3a 100644
--- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
@@ -1,3 +1,8 @@
+# Bring in fixes including https://github.com/cryptodev-linux/cryptodev-linux/pull/55
+# just pull 1.12 revision, everything else remains the same.
+
+PR = "1.12"
 PR_append = ".arago0"
+SRCREV = "e0c25e289d6baf1d83c2b9cb523d3bc237d0c0c9"
 
 KERNEL_MODULE_AUTOLOAD += "cryptodev"
diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-tests_%.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-tests_%.bbappend
new file mode 100644
index 000000000000..dee8f40862cb
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-tests_%.bbappend
@@ -0,0 +1,6 @@
+# Bring in fixes including https://github.com/cryptodev-linux/cryptodev-linux/pull/55
+# just pull 1.12 revision, everything else remains the same.
+
+PR = "1.12"
+PR_append = ".arago0"
+SRCREV = "e0c25e289d6baf1d83c2b9cb523d3bc237d0c0c9"
-- 
2.25.1.377.g2d2118b814c1


