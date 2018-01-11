Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id D57895298A
	for <meta-arago@arago-project.org>;
	Thu, 11 Jan 2018 21:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E9CD120B40;
	Thu, 11 Jan 2018 21:34:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id yhvzYZwRVfjS; Thu, 11 Jan 2018 21:34:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C39C820999;
	Thu, 11 Jan 2018 21:34:55 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 47D2E16325F;
	Thu, 11 Jan 2018 16:34:55 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 11 Jan 2018 16:34:53 -0500
Message-Id: <1515706493-6997-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515706493-6997-1-git-send-email-denys@ti.com>
References: <1515706493-6997-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 2/2] stress-ng: update to version 0.09.09
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
X-List-Received-Date: Thu, 11 Jan 2018 21:35:06 -0000

Fixes build issues with Linaro gcc7

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../stress-ng/{stress-ng_0.07.25.bb => stress-ng_0.09.09.bb}       | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-arago-extras/recipes-devtools/stress-ng/{stress-ng_0.07.25.bb => stress-ng_0.09.09.bb} (69%)

diff --git a/meta-arago-extras/recipes-devtools/stress-ng/stress-ng_0.07.25.bb b/meta-arago-extras/recipes-devtools/stress-ng/stress-ng_0.09.09.bb
similarity index 69%
rename from meta-arago-extras/recipes-devtools/stress-ng/stress-ng_0.07.25.bb
rename to meta-arago-extras/recipes-devtools/stress-ng/stress-ng_0.09.09.bb
index 63b939d..c6ac793 100644
--- a/meta-arago-extras/recipes-devtools/stress-ng/stress-ng_0.07.25.bb
+++ b/meta-arago-extras/recipes-devtools/stress-ng/stress-ng_0.09.09.bb
@@ -5,13 +5,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "zlib libaio"
 
-SRC_URI = "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.gz"
+SRC_URI = "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "cc2cecc81ff367976b3dbb68e9959cfd"
-SRC_URI[sha256sum] = "9143c1e78c92612c6a58913c2035c0039e1fe9ff72f99148f049abe47c167224"
+SRC_URI[md5sum] = "6e4df71095e780654ccc0a713b8423fe"
+SRC_URI[sha256sum] = "e993fddb1d990a0cdb23b2af6cf6c417a1c09e155ada7c558ad80eae8a5feed3"
 
 CFLAGS += "-Wall -Wextra -DVERSION='"$(VERSION)"' -O2"
 
 do_install() {
 	oe_runmake DESTDIR=${D} install
+	chown -R root:root ${D}
 }
-- 
2.7.4


