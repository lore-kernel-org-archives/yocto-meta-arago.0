Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id C8C7C52A7A
	for <meta-arago@arago-project.org>;
	Wed, 22 Aug 2018 19:08:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7MJ8NZB079046
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2018 14:08:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534964903;
	bh=HszjFjNKxrYDRa88VJybOSg4WGr5e4Gtku8lq3sp3To=;
	h=From:To:CC:Subject:Date;
	b=tjLj+S1WCtsa/Iom/MxWm4wwDfWsup04WrwUThZB1TlDsywq81CQgWBmTm+mMyXLi
	TKrH85hZYfq64pO+ZS+3wrxSCqn5FBRDqoZputNUgbX4cN2icyjfeE9IEgFKODMlgW
	F1M1hfQ7Tbn8QDTtFgocfW4GNNp4P1Ri7y1/VJq8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7MJ8Nfq024315
	for <meta-arago@arago-project.org>; Wed, 22 Aug 2018 14:08:23 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 22 Aug 2018 14:08:22 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 22 Aug 2018 14:08:22 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7MJ8MhE007784;
	Wed, 22 Aug 2018 14:08:22 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 22 Aug 2018 14:56:30 -0400
Message-ID: <1534964190-16523-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] tisdk-image: find overlays in dtb search
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
X-List-Received-Date: Wed, 22 Aug 2018 19:08:31 -0000
Content-Type: text/plain

* Match files that end in .dtb or .dtbo

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 7bc3ca0..cb17d7d 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -768,7 +768,7 @@ tisdk_image_build () {
     #       The \| is important for delimiting these values.
     if [ "${DTB_FILTER}" != "unknown" ]
     then
-        for f in `find ${DEPLOY_DIR_IMAGE} -type l -regex ".*\(${DTB_FILTER}\).*\.dtb"`
+        for f in `find ${DEPLOY_DIR_IMAGE} -type l -regex ".*\(${DTB_FILTER}\).*\.dtbo?"`
         do
             dtb_file=`basename $f | sed s/.Image-//`
             cp $f ${prebuilt_dir}/${dtb_file}
-- 
2.7.4


