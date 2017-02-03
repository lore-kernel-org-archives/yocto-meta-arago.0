Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 98AA952B0B
	for <meta-arago@arago-project.org>;
	Fri,  3 Feb 2017 00:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9207320B35;
	Fri,  3 Feb 2017 00:53:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id VCTz04pT4RF8; Fri,  3 Feb 2017 00:53:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 71D86208D1;
	Fri,  3 Feb 2017 00:53:57 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 9E29D16233B;
	Thu,  2 Feb 2017 19:53:56 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  2 Feb 2017 19:53:56 -0500
Message-Id: <1486083236-32396-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] linux-libc-headers: add 4.9 version
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
X-List-Received-Date: Fri, 03 Feb 2017 00:53:59 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../linux-libc-headers/linux-libc-headers_4.9.bb             | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb

diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb
new file mode 100644
index 0000000..a560e14
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb
@@ -0,0 +1,12 @@
+require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+
+PR_append = ".arago0"
+
+BRANCH = "ti-lsk-linux-4.9.y"
+SRCREV = "20e747cb77b81fce68c4b7ee3cfa24e10aedf484"
+
+KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
+KERNEL_GIT_PROTOCOL = "git"
+SRC_URI = "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
-- 
2.7.4


