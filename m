Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858F4EB64DC
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 10:04:06 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.9353.1687860239016979065
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Jun 2023 03:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sW6SLjfK;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35RA3vTS078745;
	Tue, 27 Jun 2023 05:03:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687860237;
	bh=V3rQiZDHEZH2tzRmDHd0XC4JtnVtVbcjrxRLZR1Izrk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sW6SLjfKe3yDv6gogwew4Lv1LE/iHTZVQZP3Ybf8A3sq6erCS2pVcp7iv+wyxvHOc
	 XzNgbWrMGX06jj1e0SwEwEUTXreNiHxdzU/Fe/ig/CSF9ojfMBd53kWlT6Nc388TBI
	 QxjH4WkZsX8psdKggJKgSvb8E7tbrKpuN04RcVis=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35RA3uWs008219
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Jun 2023 05:03:56 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 05:03:56 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Jun 2023 05:03:56 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35RA3klc115122;
	Tue, 27 Jun 2023 05:03:54 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>,
        <r-gunasekaran@ti.com>, <praneeth@ti.com>
Subject: [master/kirkstone][PATCH v3 3/8] meta-arago-extras: sysrepo: Add libyang recipe needed for sysrepo
Date: Tue, 27 Jun 2023 15:33:40 +0530
Message-ID: <20230627100345.24340-4-r-gunasekaran@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14698

libyang library is needed to build sysrepo and libnetconf2.
So add recipe for libyang.

The recipe is taken as-is from the commit 09f73e7 ("update for honister")
from the public repo [1].

[1] - https://github.com/sartura/meta-sysrepo

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---
Changes since v2:
---------------
Newly introduced in this series

 .../recipes-sysrepo/libyang/libyang_git.bb    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-arago-extras/recipes-sysrepo/libyang/libyang_git.bb

diff --git a/meta-arago-extras/recipes-sysrepo/libyang/libyang_git.bb b/meta-arago-extras/recipes-sysrepo/libyang/libyang_git.bb
new file mode 100644
index 00000000..c984a252
--- /dev/null
+++ b/meta-arago-extras/recipes-sysrepo/libyang/libyang_git.bb
@@ -0,0 +1,23 @@
+SUMMARY = "YANG data modelling language parser and toolkit"
+DESCRIPTION = "libyang is YANG data modelling language parser and toolkit written (and providing API) in C. The library is used e.g. in libnetconf2, Netopeer2 or sysrepo projects."
+SECTION = "libs"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f3916d7d8d42a6508d0ea418cfff10ad"
+
+SRC_URI = "git://github.com/CESNET/libyang.git;protocol=https;branch=devel"
+
+PV = "2.1.77+git${SRCPV}"
+SRCREV = "a804113c9bbac3e36c53221be469c1ca5af5b435"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "libpcre2"
+
+FILES:${PN} += "/usr/share/yang/modules/libyang/*"
+
+inherit cmake pkgconfig
+
+# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
+EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE:String=Release "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


