Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id CADE452986
	for <meta-arago@arago-project.org>;
	Thu, 17 Oct 2019 19:59:51 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9HJwZDr081416
	for <meta-arago@arago-project.org>; Thu, 17 Oct 2019 14:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571342315;
	bh=8ecq/++YbqCJ4rrJhjFu5Qe9dG2xdCrUIGqzCwKqkaA=;
	h=From:To:CC:Subject:Date;
	b=l0nvTzLFb7CM4dg0An43ORuVd74C9ySEzSYGlThdJlPXVBf0OI00mO5IOErKyBdRB
	jRjjszVj+sxEMCmTL03YsPVPQfZ+8kfx2iu1//4WClbQd/YxWuVgS4ugnipPPsn/Vn
	T7daJSXQWBKJRbcBzOX/f3M8Ppnr7O1vMqVJ5A/0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9HJwZie038801
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 17 Oct 2019 14:58:35 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 17 Oct 2019 14:58:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 17 Oct 2019 14:58:27 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9HJwYdx038585;
	Thu, 17 Oct 2019 14:58:35 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 17 Oct 2019 19:42:11 +0000
Message-ID: <20191017194211.23416-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] arago-tiny-image: also configure package feeds
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
X-List-Received-Date: Thu, 17 Oct 2019 19:59:52 -0000
Content-Type: text/plain

Tiny image already includes opkg package management, so it would be
helpful to also include feed configuration for ease of managing the
packages at run-time.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/arago-tiny-image.bb            | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-tiny-image.bb b/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
index ed3f5566..465d322b 100644
--- a/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
@@ -1,4 +1,3 @@
-
 # Common pieces for Arago images
 
 LICENSE = "MIT"
@@ -13,7 +12,14 @@ IMAGE_FSTYPES += "cpio"
 EXTRA_IMAGECMD_ext2.gz += "-i 4096"
 
 # Install a small set of utils which can be used for diagnostics
-ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= "parted util-linux e2fsprogs dosfstools devmem2"
+ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= " \
+	parted \
+	util-linux \
+	e2fsprogs \
+	dosfstools \
+	devmem2 \
+	arago-feed-config \
+"
 
 IMAGE_INSTALL += " \
 	packagegroup-arago-sysvinit-boot \
-- 
2.17.1


