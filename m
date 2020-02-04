Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 8A662529E3
	for <meta-arago@arago-project.org>;
	Tue,  4 Feb 2020 18:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C7DA340C13;
	Tue,  4 Feb 2020 18:18:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id TZ7ekyN5M_jE; Tue,  4 Feb 2020 18:18:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A341F40C0A;
	Tue,  4 Feb 2020 18:18:29 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 41FE71743D4;
	Tue,  4 Feb 2020 13:18:28 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  4 Feb 2020 13:18:16 -0500
Message-Id: <1580840296-30685-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580840296-30685-1-git-send-email-denis@denix.org>
References: <1580840296-30685-1-git-send-email-denis@denix.org>
Subject: [RFC][PATCH 3/3] ti-opencl: add aliases for opencl and opencl-runtime
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
X-List-Received-Date: Tue, 04 Feb 2020 18:20:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/ti-opencl.bb | 10 ++++++++++
 meta-arago-distro/recipes-core/packagegroups/ti-world.bb  |  1 +
 2 files changed, 11 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/ti-opencl.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/ti-opencl.bb
new file mode 100644
index 0000000..b962779
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-opencl.bb
@@ -0,0 +1,10 @@
+# This is just an alias between debian and OE names
+
+LICENSE = "MIT"
+
+inherit packagegroup
+
+PACKAGES += "${PN}-runtime"
+
+RDEPENDS_${PN} = "opencl"
+RDEPENDS_${PN}-runtime = "opencl-runtime"
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
index 164ac63..c9aad1f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -55,4 +55,5 @@ RDEPENDS_${PN} = "\
     packagegroup-arago-misc \
     ti-analytics \
     ti-demos \
+    ti-opencl \
 "
-- 
2.7.4


