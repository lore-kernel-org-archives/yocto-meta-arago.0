Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8546CEB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 10:04:06 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.9458.1687860237609749240
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Jun 2023 03:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=IUbOxEI0;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35RA3sY6078668;
	Tue, 27 Jun 2023 05:03:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687860234;
	bh=26AD4MGzs22zBdQzJ60kSzlAK+bAX8sTf/L2quJCDj0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IUbOxEI0mxgM+ynhfAOHfmwbHi5IM34BV5iSuSvq1E/6dxIofnVfDY9sbmACOJCUF
	 7Mv66Y9F95Yt09sgzJGCEtQTOoxGfqLKVaOMifGLZua3RP82UtXIPs9GryI9iq0oZk
	 2+kkSZmQ7PseHLslxgR/2Gd5foMAsIINcHPEn6mQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35RA3sxr008200
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Jun 2023 05:03:54 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 05:03:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Jun 2023 05:03:54 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35RA3klb115122;
	Tue, 27 Jun 2023 05:03:52 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>,
        <r-gunasekaran@ti.com>, <praneeth@ti.com>
Subject: [master/kirkstone][PATCH v3 2/8] meta-arago-extras: sysrepo: Add libssh recipe needed for sysrepo
Date: Tue, 27 Jun 2023 15:33:39 +0530
Message-ID: <20230627100345.24340-3-r-gunasekaran@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14697

libnetconf2 is needed to build sysrepo. And libnetconf2 depends on
libssh. So add receipe for libssh.

The recipe is taken as-is from the commit 09f73e7 ("update for honister")
from the public repo [1].

[1] - https://github.com/sartura/meta-sysrepo

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---

Changes since v2:
---------------
Newly introduced in this series

 .../recipes-sysrepo/libssh/libssh_0.9.5.bb    | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb

diff --git a/meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb b/meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb
new file mode 100644
index 00000000..43a6827e
--- /dev/null
+++ b/meta-arago-extras/recipes-sysrepo/libssh/libssh_0.9.5.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Multiplatform C library implementing the SSHv2 and SSHv1 protocol"
+HOMEPAGE = "http://www.libssh.org"
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
+
+DEPENDS = "zlib openssl"
+
+SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=stable-0.9"
+SRCREV = "0cceefd49d4d397eb21bd36e314ac87739da51ff"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+PACKAGECONFIG ??=""
+PACKAGECONFIG[gssapi] = "-DWITH_GSSAPI=1, -DWITH_GSSAPI=0, krb5, "
+
+ARM_INSTRUCTION_SET:armv5 = "arm"
+
+EXTRA_OECMAKE = " \
+    -DWITH_GCRYPT=0 \
+    -DWITH_PCAP=1 \
+    -DWITH_SFTP=1 \
+    -DWITH_ZLIB=1 \
+    -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
+    "
+
+do_configure:prepend () {
+    # Disable building of examples
+    sed -i -e '/add_subdirectory(examples)/s/^/#DONOTWANT/' ${S}/CMakeLists.txt \
+        || bbfatal "Failed to disable examples"
+}
+
+TOOLCHAIN = "gcc"
-- 
2.17.1


