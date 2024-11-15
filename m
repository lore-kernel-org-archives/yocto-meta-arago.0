Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29716D68BD4
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 20:15:25 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1263.1731701715616839859
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 15 Nov 2024 12:15:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vI8VyScp;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AFKFEkq077449;
	Fri, 15 Nov 2024 14:15:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731701714;
	bh=3TBgp/r9Jz2DoxZdMX86nOw7W6pRWvFqV70zUxukKC4=;
	h=From:To:Subject:Date;
	b=vI8VyScplr/mmDvXBa9GR8+nBDoB+rsPdMHWDZkCrtizmARop8kMVgfHltTA3s0XT
	 BwFVAVd93RU8lZa0ySQ12Ond3mi8XiEQU2+oDjbasDh2sNtvmLBaAWYwIp34V4PH9u
	 zmg1aZAwxS/6EbLhEN1Jth0gTrKdRWJRLiuUh0OE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AFKFEFc102470
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 15 Nov 2024 14:15:14 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 15
 Nov 2024 14:15:13 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 15 Nov 2024 14:15:13 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AFKFDYE093253;
	Fri, 15 Nov 2024 14:15:13 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tC2in-0006BM-Nz; Fri, 15 Nov 2024 14:15:13 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap/kirkstone][PATCH] SECURITY: Add file
Date: Fri, 15 Nov 2024 14:15:13 -0600
Message-ID: <20241115201513.23724-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 15 Nov 2024 20:15:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15612

Add a SECURITY file with hints for security researchers and other
parties who might report potential security vulnerabilities.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-demos/SECURITY  | 21 +++++++++++++++++++++
 meta-arago-distro/SECURITY | 21 +++++++++++++++++++++
 meta-arago-extras/SECURITY | 21 +++++++++++++++++++++
 meta-arago-test/SECURITY   | 21 +++++++++++++++++++++
 4 files changed, 84 insertions(+)
 create mode 100644 meta-arago-demos/SECURITY
 create mode 100644 meta-arago-distro/SECURITY
 create mode 100644 meta-arago-extras/SECURITY
 create mode 100644 meta-arago-test/SECURITY

diff --git a/meta-arago-demos/SECURITY b/meta-arago-demos/SECURITY
new file mode 100644
index 00000000..e4b1b13f
--- /dev/null
+++ b/meta-arago-demos/SECURITY
@@ -0,0 +1,21 @@
+How to Report a Potential Vulnerability?
+========================================
+
+If you would like to report a public issue (for example, one with a released
+CVE number), please report it to the mailing list:
+
+  https://lists.yoctoproject.org/g/meta-arago
+
+If you are dealing with a not-yet released or urgent issue, please send a
+message to one of the maintainers listed in the README.  Include as many
+details as possible:
+  - the layer or software module affected
+  - the recipe and its version
+  - any example code, if available
+
+Branches maintained with security fixes
+---------------------------------------
+
+See https://wiki.yoctoproject.org/wiki/Releases for the list of current
+releases.  We only accept patches for the LTS releases and the master branch.
+
diff --git a/meta-arago-distro/SECURITY b/meta-arago-distro/SECURITY
new file mode 100644
index 00000000..e4b1b13f
--- /dev/null
+++ b/meta-arago-distro/SECURITY
@@ -0,0 +1,21 @@
+How to Report a Potential Vulnerability?
+========================================
+
+If you would like to report a public issue (for example, one with a released
+CVE number), please report it to the mailing list:
+
+  https://lists.yoctoproject.org/g/meta-arago
+
+If you are dealing with a not-yet released or urgent issue, please send a
+message to one of the maintainers listed in the README.  Include as many
+details as possible:
+  - the layer or software module affected
+  - the recipe and its version
+  - any example code, if available
+
+Branches maintained with security fixes
+---------------------------------------
+
+See https://wiki.yoctoproject.org/wiki/Releases for the list of current
+releases.  We only accept patches for the LTS releases and the master branch.
+
diff --git a/meta-arago-extras/SECURITY b/meta-arago-extras/SECURITY
new file mode 100644
index 00000000..e4b1b13f
--- /dev/null
+++ b/meta-arago-extras/SECURITY
@@ -0,0 +1,21 @@
+How to Report a Potential Vulnerability?
+========================================
+
+If you would like to report a public issue (for example, one with a released
+CVE number), please report it to the mailing list:
+
+  https://lists.yoctoproject.org/g/meta-arago
+
+If you are dealing with a not-yet released or urgent issue, please send a
+message to one of the maintainers listed in the README.  Include as many
+details as possible:
+  - the layer or software module affected
+  - the recipe and its version
+  - any example code, if available
+
+Branches maintained with security fixes
+---------------------------------------
+
+See https://wiki.yoctoproject.org/wiki/Releases for the list of current
+releases.  We only accept patches for the LTS releases and the master branch.
+
diff --git a/meta-arago-test/SECURITY b/meta-arago-test/SECURITY
new file mode 100644
index 00000000..e4b1b13f
--- /dev/null
+++ b/meta-arago-test/SECURITY
@@ -0,0 +1,21 @@
+How to Report a Potential Vulnerability?
+========================================
+
+If you would like to report a public issue (for example, one with a released
+CVE number), please report it to the mailing list:
+
+  https://lists.yoctoproject.org/g/meta-arago
+
+If you are dealing with a not-yet released or urgent issue, please send a
+message to one of the maintainers listed in the README.  Include as many
+details as possible:
+  - the layer or software module affected
+  - the recipe and its version
+  - any example code, if available
+
+Branches maintained with security fixes
+---------------------------------------
+
+See https://wiki.yoctoproject.org/wiki/Releases for the list of current
+releases.  We only accept patches for the LTS releases and the master branch.
+
-- 
2.17.1


