Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 21D88529DC
	for <meta-arago@arago-project.org>;
	Thu, 20 Feb 2020 19:18:09 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KJGACj056297
	for <meta-arago@arago-project.org>; Thu, 20 Feb 2020 13:16:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582226170;
	bh=GPIIA7BELZhNOpfuFyvdoyhEHF+NSsWCIXYk+azOQns=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=a6mOTn2GtFxGW5TwNaiMjVqQPDy5yGXRRqkD9Wn9e7XDOwM7ecMzzduta2czCvUpW
	RMaYn3rnOFxUAsAugkmXFHYQqnl5kEnF504LLD/BGzvfvUA3zMTfxhyfZzYbSJhx7g
	II2iisvkgSAG0INzNvpIRZosb70iJDY6k6h4dVyQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01KJGAnm084168
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 20 Feb 2020 13:16:10 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 20 Feb 2020 13:16:09 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 20 Feb 2020 13:16:09 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KJG7pj017983;
	Thu, 20 Feb 2020 13:16:09 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 20 Feb 2020 18:54:57 +0000
Message-ID: <20200220185458.26926-8-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220185458.26926-1-denys@ti.com>
References: <20200220185458.26926-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [zeus/master][PATCH 8/9] arago-tiny-image: simplify by re-using arago-image.inc
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
X-List-Received-Date: Thu, 20 Feb 2020 19:18:11 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/arago-tiny-image.bb   | 35 ++-----------------
 1 file changed, 3 insertions(+), 32 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-tiny-image.bb b/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
index 465d322b..5d1733e2 100644
--- a/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
@@ -1,16 +1,9 @@
-# Common pieces for Arago images
+ARAGO_SYSVINIT = "1"
 
-LICENSE = "MIT"
-
-COMPATIBLE_MACHINE = "ti-soc"
-
-IMAGE_FEATURES += "package-management splash"
+require arago-image.inc
 
 IMAGE_FSTYPES += "cpio"
 
-# 4KB per 1 inode should be enough
-EXTRA_IMAGECMD_ext2.gz += "-i 4096"
-
 # Install a small set of utils which can be used for diagnostics
 ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= " \
 	parted \
@@ -21,31 +14,9 @@ ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= " \
 	arago-feed-config \
 "
 
-IMAGE_INSTALL += " \
+IMAGE_INSTALL = " \
 	packagegroup-arago-sysvinit-boot \
 	${ARAGO_TINY_IMAGE_EXTRA_INSTALL} \
 "
 
 export IMAGE_BASENAME = "arago-tiny-image"
-
-IMAGE_LINGUAS = ""
-
-make_bootfiles_symlinks_relative() {
-    for f in "${IMAGE_ROOTFS}/boot"/*
-    do
-        [ -L "$f" ] || continue
-
-        l=$(readlink "$f")
-        if [ "${l:0:6}" == "/boot/" ]
-        then
-            ln -sf "${l##/boot/}" "$f"
-        elif ["${l:0:1}" == "/" ]
-        then
-            ln -sf "..$l" "$f"
-        fi
-    done
-}
-
-ROOTFS_POSTPROCESS_COMMAND += "make_bootfiles_symlinks_relative;"
-
-inherit core-image
-- 
2.17.1


