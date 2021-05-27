Return-Path: <yogeshs@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 7E84F52B1F
	for <meta-arago@arago-project.org>;
	Thu, 27 May 2021 07:47:36 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14R7mDJF124135;
	Thu, 27 May 2021 02:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1622101693;
	bh=s2mYVP/MQ03tgc39C26A/HJlhtthnD6cotQaYXC4ZBM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EtNhX6HRxdXOFadte/U8aEW2lrYabrAM+kp7EsYsBx+dP7jPYDpWz2Nj2kLxXc/5p
	+Sogao45TOd37N1eZ9VM+eZAEgwiVK/lBVbMiw19B587N4kUkYsMnpgweu+nDRtGIE
	y6ttjdkpObfOzPr0c01eLf7ICjlgxtSx/G04nMGM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14R7mD5u083648
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 May 2021 02:48:13 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Thu, 27 May 2021 02:48:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Thu, 27 May 2021 02:48:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14R7mDbG087553;
	Thu, 27 May 2021 02:48:13 -0500
From: Yogesh Siraswar <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Praneeth Bajjuri
	<praneeth@ti.com>, Nishant Menon <nm@ti.com>
Date: Thu, 27 May 2021 02:48:13 -0500
Message-ID: <20210527074813.31042-4-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210527074813.31042-1-yogeshs@ti.com>
References: <20210527074813.31042-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [dunfell][PATCH 3/3] strace: update bbappend against 5.10 kernel
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
X-List-Received-Date: Thu, 27 May 2021 07:47:37 -0000
Content-Type: text/plain

strace 5.5 on dunfell is not compatible with 5.10 kernel. Instead of
cherry picking the fixes that doesn't apply cleanly, its cleaner to
use strace 5.10.

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 .../recipes-devtools/strace/strace_5.5.bbappend      | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-arago-distro/recipes-devtools/strace/strace_5.5.bbappend

diff --git a/meta-arago-distro/recipes-devtools/strace/strace_5.5.bbappend b/meta-arago-distro/recipes-devtools/strace/strace_5.5.bbappend
new file mode 100644
index 00000000..e1864ec4
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/strace/strace_5.5.bbappend
@@ -0,0 +1,12 @@
+
+PV = "5.10"
+PR = "arago0"
+
+SRC_URI[sha256sum] = "fe3982ea4cd9aeb3b4ba35f6279f0b577a37175d3282be24b9a5537b56b8f01c"
+SRC_URI[md5sum] = "5f9f87f9afa282e7512f67a129287d6c"
+
+EXTRA_OECONF += "--disable-gcc-Werror"
+
+RDEPENDS_${PN}-ptest_append_libc-glibc = "\
+     locale-base-en-us.iso-8859-1 \
+"
-- 
2.17.1


