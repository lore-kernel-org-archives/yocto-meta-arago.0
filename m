Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB61EB64D8
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 22:10:14 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.394.1686953413340898873
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jun 2023 15:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yA/MoiO0;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35GMABmZ098183;
	Fri, 16 Jun 2023 17:10:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686953411;
	bh=CwwEcI6VETFq7zLRI1UTGq2N/A1yboD+khLcyE0fmKY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=yA/MoiO0WhMuKAcF8udpKLSIdBpndLflTI4VQTE4RCeBzkw/a+8+djtSKiRuihJzX
	 Sf2+RaW7C6rarHPJk5sA25IYgNvMaH9DDfPUTdmHBfXBKlTP4+LfGnnTNt3YWBlM+v
	 nhS8L6zAX/8xLQTpB1JEEoeRSQyfyq6KQjZQMmTc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35GMABNU019425
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Jun 2023 17:10:11 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 Jun 2023 17:10:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 16 Jun 2023 17:10:11 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35GMAB0Y059518;
	Fri, 16 Jun 2023 17:10:11 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qAHdz-0004oU-3G; Fri, 16 Jun 2023 17:10:11 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][kirkstone][PATCH 2/2] kms++: Renable kms++-python
Date: Fri, 16 Jun 2023 17:10:10 -0500
Message-ID: <20230616221010.18458-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230616221010.18458-1-reatmon@ti.com>
References: <20230616221010.18458-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jun 2023 22:10:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14648

With the pybind11 backport, the kms++ package builds correctly.  Turn it
back on.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-base.bb    | 3 +--
 meta-arago-extras/recipes-graphics/kms++/kms++_git.bb        | 5 ++---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index 31d9ad5b..ff32112a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -26,8 +26,6 @@ ARAGO_BASE = "\
     libgpiod-tools \
 "
 
-# these require meta-openembedded/meta-oe layer
-#    kms++-python is not provided yet
 ARAGO_EXTRA = "\
     devmem2 \
     tcpdump \
@@ -35,6 +33,7 @@ ARAGO_EXTRA = "\
     dropbear \
     openssh-sftp-server \
     kms++ \
+    kms++-python \
     can-utils \
     docker \
 "
diff --git a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
index eb39736c..2c0abaa7 100644
--- a/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
+++ b/meta-arago-extras/recipes-graphics/kms++/kms++_git.bb
@@ -12,9 +12,8 @@ SRCREV = "5afc8d918f2c084acd65027604868dfde43395cf"
 
 DEPENDS = "drm fmt"
 
-# New meson build system fails to find pybind11 in sysroot, disable for now
-#DEPENDS += "python3-pybind11"
-#EXTRA_OEMESON = "-Dsystem-pybind11=enabled"
+DEPENDS += "libevdev python3-pybind11"
+EXTRA_OEMESON = "-Dsystem-pybind11=enabled"
 
 PACKAGES =+ "${PN}-python"
 
-- 
2.17.1


