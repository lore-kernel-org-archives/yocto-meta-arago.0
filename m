Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 42DAD52007
	for <meta-arago@arago-project.org>;
	Fri, 17 Mar 2017 01:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 178E420BAF;
	Fri, 17 Mar 2017 01:47:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id SKim_BG7BewR; Fri, 17 Mar 2017 01:47:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E6A8C20174;
	Fri, 17 Mar 2017 01:47:00 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 6FC571623AE;
	Thu, 16 Mar 2017 21:47:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 16 Mar 2017 21:46:59 -0400
Message-Id: <1489715219-136349-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] stress-ng: update to 0.07.25
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
X-List-Received-Date: Fri, 17 Mar 2017 01:47:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../stress-ng/{stress-ng_0.05.09.bb => stress-ng_0.07.25.bb}        | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-arago-extras/recipes-devtools/stress-ng/{stress-ng_0.05.09.bb => stress-ng_0.07.25.bb} (69%)

diff --git a/meta-arago-extras/recipes-devtools/stress-ng/stress-ng_0.05.09.bb b/meta-arago-extras/recipes-devtools/stress-ng/stress-ng_0.07.25.bb
similarity index 69%
rename from meta-arago-extras/recipes-devtools/stress-ng/stress-ng_0.05.09.bb
rename to meta-arago-extras/recipes-devtools/stress-ng/stress-ng_0.07.25.bb
index 2e92c53..63b939d 100644
--- a/meta-arago-extras/recipes-devtools/stress-ng/stress-ng_0.05.09.bb
+++ b/meta-arago-extras/recipes-devtools/stress-ng/stress-ng_0.07.25.bb
@@ -3,10 +3,12 @@ HOMEPAGE = "http://kernel.ubuntu.com/~cking/stress-ng/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
+DEPENDS = "zlib libaio"
+
 SRC_URI = "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "fe65047991f654ffaac3c59ea9537763"
-SRC_URI[sha256sum] = "d785b5f2df042d42c43ddfd5bbafa19151ed96f0c483d7f44c737f492b52ddd6"
+SRC_URI[md5sum] = "cc2cecc81ff367976b3dbb68e9959cfd"
+SRC_URI[sha256sum] = "9143c1e78c92612c6a58913c2035c0039e1fe9ff72f99148f049abe47c167224"
 
 CFLAGS += "-Wall -Wextra -DVERSION='"$(VERSION)"' -O2"
 
-- 
2.7.4


