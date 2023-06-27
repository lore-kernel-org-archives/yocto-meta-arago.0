Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CC2C3DA41
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 10:04:06 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.9459.1687860240967757078
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Jun 2023 03:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=q2K8ddt1;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35RA3xxs093118;
	Tue, 27 Jun 2023 05:03:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687860239;
	bh=4+3Uen2wt6YBpVdmPKnAXYYukFCLR018P/OQBnHXBkw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=q2K8ddt1dw5L0pQ1uF3UrLBTy9HfJnIso4bowbns/Cp9hf6Yy6BFJtYIE8X0rCKNK
	 EadJkh6QQleYq6GeXmthdYpC6/lfXhUH7mSYIadYh/h2R7qstdcuXtsYXHl25CNz31
	 KKswO/TRwoqK2ke2qRzfooB+EpQq6WKR2lcbV0NY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35RA3xdD129320
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Jun 2023 05:03:59 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 05:03:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Jun 2023 05:03:59 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35RA3kld115122;
	Tue, 27 Jun 2023 05:03:57 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>,
        <r-gunasekaran@ti.com>, <praneeth@ti.com>
Subject: [master/kirkstone][PATCH v3 4/8] meta-arago-extras: sysrepo: Add libnetconf recipe neede for sysrepo
Date: Tue, 27 Jun 2023 15:33:41 +0530
Message-ID: <20230627100345.24340-5-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230627100345.24340-1-r-gunasekaran@ti.com>
References: <20230627100345.24340-1-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 27 Jun 2023 10:04:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14699

libnetconf2 is needed to build sysrepo. Add the recipe for libnetconf2.

The recipe is taken as-is from the commit 09f73e7 ("update for honister")
from the public repo [1].

[1] - https://github.com/sartura/meta-sysrepo

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---
Changes since v2:
---------------
Newly introduced in this series

 .../libnetconf2/libnetconf2_git.bb            | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb

diff --git a/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb b/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
new file mode 100644
index 00000000..a534b9ac
--- /dev/null
+++ b/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "libnetconf2 is a NETCONF library in C intended for building NETCONF clients and servers"
+DESCRIPTION = "The library provides functions to connect NETCONF client and server to each other via SSH and to send, receive and process NETCONF messages."
+SECTION = "libs"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=08a5578c9bab06fb2ae84284630b973f"
+
+SRC_URI = "git://github.com/CESNET/libnetconf2.git;protocol=https;branch=devel"
+
+PV = "2.1.34+git${SRCPV}"
+SRCREV = "91cd6d75722c65de5c005d908f6d645b48cee89b"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "libssh openssl libyang libxcrypt libpam"
+
+FILES:${PN} += "/usr/share/yang/modules/libnetconf2/*"
+
+inherit cmake pkgconfig
+
+# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
+#EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE:String=Release -DLIBYANG_INCLUDE_DIR=/usr/include -DLIBYANG_LIBRARY=/usr/lib "
+EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE:String=Release "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


