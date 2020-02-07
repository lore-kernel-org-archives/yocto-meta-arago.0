Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id BB5DC52A05
	for <meta-arago@arago-project.org>;
	Fri,  7 Feb 2020 19:09:01 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 017J77qH070795
	for <meta-arago@arago-project.org>; Fri, 7 Feb 2020 13:07:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581102427;
	bh=dKpoh3H4P8sZMVQRY6+gHFhk1oAmJkeK7YqN1yyn7cU=;
	h=From:To:CC:Subject:Date;
	b=EoUm7SjTpB54rHIJeSq9Kb5wKrfj5hX29lFE+SBT8THgX5gSywXeA5hbsFeL02LWJ
	7/ZLfRWYN1dy/X6PJxlRy1J0cMqs+XtaRCJtydEkzFk+1KsQqtctVX7MXf8VHWNFC+
	WahYyZSgXTFkxzi8M8Q+DDqKzN1562ZS47SZSX6Y=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 017J76af041951
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 7 Feb 2020 13:07:07 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 7 Feb 2020 13:07:06 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 7 Feb 2020 13:07:06 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 017J765D024656;
	Fri, 7 Feb 2020 13:07:06 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 7 Feb 2020 13:46:27 -0500
Message-ID: <1581101188-9014-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [RFC][PATCH 1/2] packagegroup-arago-toolchain-minimal-target: bare target sysroot
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
X-List-Received-Date: Fri, 07 Feb 2020 19:09:02 -0000
Content-Type: text/plain

* Define a bare sysroot with only package management and the feed
  configuration.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroup-arago-toolchain-minimal-target.bb           | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-minimal-target.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-minimal-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-minimal-target.bb
new file mode 100644
index 0000000..c689ecd
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-minimal-target.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Target packages for the minimal SDK, intended to be extended with opkg"
+PR = "r0"
+LICENSE = "MIT"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit packagegroup
+
+RDEPENDS_${PN} = "\
+   arago-feed-config \
+   opkg-dev \
+"
-- 
2.7.4


