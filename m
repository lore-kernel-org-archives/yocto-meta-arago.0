Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 3608252987
	for <meta-arago@arago-project.org>;
	Fri, 30 Aug 2019 17:27:12 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7UHQ9bg063915
	for <meta-arago@arago-project.org>; Fri, 30 Aug 2019 12:26:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567185969;
	bh=qQvXKDdiHBT1xEjfiYcxHlMkP8OsoM3OyYIjXTH8dkc=;
	h=From:To:CC:Subject:Date;
	b=xFoQwG3oE+FyRZ0aViKJB5A30fsIx0Xx2NdFk5ujS+I3+G8GUnAxSotOFXuhrvIny
	9jKxUbVJbDBTtNokIAogrCRdIuYee8k4004sldZfIznOVl/Yb7Phg8kTPmOa5/cmJn
	N8KLPe30b+nPLslUMEyN3Qbs+xyOnJC7piUh0uSA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7UHQ9eg124735
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 30 Aug 2019 12:26:09 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 30 Aug 2019 12:26:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 30 Aug 2019 12:26:09 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7UHQ9Pj117961;
	Fri, 30 Aug 2019 12:26:09 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 30 Aug 2019 13:08:04 -0400
Message-ID: <1567184885-17326-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 1/2] arago-tiny-image: add cpio image type
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
X-List-Received-Date: Fri, 30 Aug 2019 17:27:13 -0000
Content-Type: text/plain

* The arago-tiny-image will be used as the ramfs for the jailhouse
  linux-demo

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-tiny-image.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/arago-tiny-image.bb b/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
index 56e9429..ed3f556 100644
--- a/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.bb
@@ -7,6 +7,8 @@ COMPATIBLE_MACHINE = "ti-soc"
 
 IMAGE_FEATURES += "package-management splash"
 
+IMAGE_FSTYPES += "cpio"
+
 # 4KB per 1 inode should be enough
 EXTRA_IMAGECMD_ext2.gz += "-i 4096"
 
-- 
2.7.4


