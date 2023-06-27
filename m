Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE8AC001DB
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 14:43:07 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.15364.1687876979853179711
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Jun 2023 07:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=C+23JQ9b;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35REgvgj013529;
	Tue, 27 Jun 2023 09:42:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687876977;
	bh=BX1ZrADLfCmMLS/dDZsYfBGi9T+frHExaLA62wR06RE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=C+23JQ9bN3WXBAkwoXVBl/kcMDa3mFUxH4iWKj0dIfw/70rh9qUn8Ejx5uUxUDj/C
	 Za7lzpCbqc4obtRLuBl4NAvOVh3elpLdC5Qv4kGmf5QZdNx/Vud+1eUeqXHsjoDEKU
	 LRA2PS15YjxDIYl+5Ip5xmXn6ul7SA2LafnZ1cKM=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35REgvtI044552
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Jun 2023 09:42:57 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 09:42:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Jun 2023 09:42:57 -0500
Received: from uda0500640.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35REgnlg097343;
	Tue, 27 Jun 2023 09:42:55 -0500
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>, <praneeth@ti.com>,
        <r-gunasekaran@ti.com>, <afd@ti.com>
Subject: [master/kirkstone][PATCH v4 2/8] meta-arago-extras: sysrepo: Add libssh recipe needed for sysrepo
Date: Tue, 27 Jun 2023 20:12:43 +0530
Message-ID: <20230627144249.30543-3-r-gunasekaran@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230627144249.30543-1-r-gunasekaran@ti.com>
References: <20230627144249.30543-1-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 27 Jun 2023 14:43:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14708

libnetconf2 is needed to build sysrepo. And libnetconf2 depends on
libssh. So add receipe for libssh.

The recipe is taken as-is from the commit 09f73e7 ("update for honister")
from the public repo [1].

[1] - https://github.com/sartura/meta-sysrepo

Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
---

Changes since v3:
----------------
No change

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


