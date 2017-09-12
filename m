Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 51AD4529D6
	for <meta-arago@arago-project.org>;
	Tue, 12 Sep 2017 21:57:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8CLv31d028547
	for <meta-arago@arago-project.org>; Tue, 12 Sep 2017 16:57:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505253423;
	bh=IneGB44MFHkd7Oug9+sigqFIBI0gALia3XLCBbjFdHQ=;
	h=From:To:CC:Subject:Date;
	b=y9H0t88Ttl/2tZ4Org43XPGsFZ2Z1ZNrFUvl2a4KjMDA6TGFx50Cokh4BEIvKbx7C
	5dtL2CZjLwvKKoOBcI4BMD+fIniQIkHJExFrOA4O+0O4YCAqo1/IcPINgJmKCxAPDe
	h6JkUVof/2To2fTFxL5e9O9rxDroLJFk0ezE+NGU=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8CLv2fM018906
	for <meta-arago@arago-project.org>; Tue, 12 Sep 2017 16:57:03 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 12 Sep 2017 16:57:02 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 12 Sep 2017 16:57:02 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8CLv2sH007994;
	Tue, 12 Sep 2017 16:57:02 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 12 Sep 2017 17:57:01 -0400
Message-ID: <1505253421-30055-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH] arago-base-tisdk-image: enable UBI format for minimal FS image
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
X-List-Received-Date: Tue, 12 Sep 2017 21:57:03 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/arago-base-tisdk-image.bb  |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
index a3f5128..26b9488 100644
--- a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
@@ -3,7 +3,7 @@
 
 require arago-image.inc
 
-IMAGE_FSTYPES += "cpio.xz"
+IMAGE_FSTYPES += "cpio.xz ubifs ubi"
 
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
-- 
1.7.9.5


