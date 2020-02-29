Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 116CF529F2
	for <meta-arago@arago-project.org>;
	Sat, 29 Feb 2020 16:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 657F040A13;
	Sat, 29 Feb 2020 16:15:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 15cxQYTyad06; Sat, 29 Feb 2020 16:15:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 50C0740C27;
	Sat, 29 Feb 2020 16:15:02 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7767B17442A;
	Sat, 29 Feb 2020 11:14:59 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sat, 29 Feb 2020 11:14:45 -0500
Message-Id: <1582992888-3508-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582992888-3508-1-git-send-email-denis@denix.org>
References: <1582992888-3508-1-git-send-email-denis@denix.org>
Subject: [zeus/master][PATCH 6/9] build-essential: add a debian-named alias for OE packagegroup
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
X-List-Received-Date: Sat, 29 Feb 2020 16:17:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/build-essential.bb | 7 +++++++
 meta-arago-distro/recipes-core/packagegroups/ti-world.bb        | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/build-essential.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/build-essential.bb b/meta-arago-distro/recipes-core/packagegroups/build-essential.bb
new file mode 100644
index 0000000..c50053a
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/build-essential.bb
@@ -0,0 +1,7 @@
+# This is just an alias between debian and OE names
+
+LICENSE = "MIT"
+
+inherit packagegroup
+
+RDEPENDS_${PN} = "packagegroup-core-buildessential"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index 95a8cca..ce94572 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -23,7 +23,7 @@ EXTRABROWSERS = " \
 
 DEVTOOLS = " \
     linux-libc-headers-dev \
-    packagegroup-core-buildessential \
+    build-essential \
     packagegroup-core-tools-debug \
     git \
 "
-- 
2.7.4


