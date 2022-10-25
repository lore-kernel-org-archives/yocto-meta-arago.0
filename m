Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB5EFA3740
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 14:22:49 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.7524.1666707759888394222
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Oct 2022 07:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=A84CapCg;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29PEMbdm051905;
	Tue, 25 Oct 2022 09:22:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666707757;
	bh=W8pFm+8pgaejkBsWFAQoFFmPD5Zock87fqMX1rCI/xU=;
	h=From:To:CC:Subject:Date;
	b=A84CapCgtjy4eISQX7o/noLa9/fXPPlrC4TUoLYcI6tHE/i5dSPSGu37z0oEJo4Nd
	 7wNWYA7077OMG+5dKMBzQ29tyzu7iU0YwbdR7WHNDIdLUmijjzTkmXAtoh3mBxKEAD
	 ujuBjNhGoAhZevVgEDRiBRVMSIpv0DoMQAgcffuA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29PEMblw014670
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Oct 2022 09:22:37 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 25
 Oct 2022 09:22:36 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 25 Oct 2022 09:22:36 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29PEMah8008329;
	Tue, 25 Oct 2022 09:22:36 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] net-snmp: Remove broken net-snmp recipe
Date: Tue, 25 Oct 2022 09:22:35 -0500
Message-ID: <20221025142235.12400-1-afd@ti.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 25 Oct 2022 14:22:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14089

This bbappend is not functional on the latest net-snmp. The additional
patches are ~61k lines, half the entire size of meta-arago. This extra
functionality should have been added to a forked repo and that is how we
should add this back if ever needed again. Remove this recipe.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Patch created with --irreversible-delete to prevent oversized email,
will need manually applied.

 .../packagegroup-arago-tisdk-connectivity.bb  |     2 -
 .../net-snmp/files/snmpd.conf                 |   422 -
 ...initial-support-for-hsr-prp-mib-supp.patch |  1224 -
 ...a-dummy-lreInterfaceConfigTable-for-.patch |   326 -
 ...update-lreInterfaceConfigTable-for-M.patch | 12791 -------
 ...update-lreInterfaceTable-to-use-real.patch |   413 -
 ...2439-3-MIB-refractor-code-for-re-use.patch |   403 -
 ...update-to-get-real-slave-admin-and-l.patch |   612 -
 ...add-functions-to-get-set-real-values.patch |   471 -
 ...Move-existing-lre-access-functions-t.patch |   884 -
 ...add-initial-version-of-stats-and-nod.patch | 10371 -----
 ...-3-MIB-Add-support-for-lreNodesTable.patch |  1236 -
 .../0011-IEC-62439-3-MIB-bug-fixes.patch      |   722 -
 ...Fix-index-issue-in-table-implementat.patch |    87 -
 ...39-3-MIB-Add-command-to-set-HSR-mode.patch |    34 -
 ...-3-MIB-add-license-header-to-sources.patch | 31871 ----------------
 ...fix-lreManufacturerName-displaying-d.patch |    34 -
 ...fix-duplicate-discard-mode-setting-f.patch |    53 -
 ...to-retrieve-mibs-from-main-interface.patch |   700 -
 ...update-to-work-with-iproute2-changes.patch |    71 -
 .../net-snmp/net-snmp_%.bbappend              |    31 -
 21 files changed, 62758 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-protocols/net-snmp/files/snmpd.conf
 delete mode 100644 meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0001-IEC-62439-3-add-initial-support-for-hsr-prp-mib-supp.patch
 delete mode 100644 meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0002-IEC-62439-3-add-a-dummy-lreInterfaceConfigTable-for-.patch
 delete mode 100644 meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0003-IEC-62439-3-MIB-update-lreInterfaceConfigTable-for-M.patch
 delete mode 100644 meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0004-IEC-62439-3-MIB-update-lreInterfaceTable-to-use-real.patch
 delete mode 100644 meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0005-IEC-62439-3-MIB-refractor-code-for-re-use.patch
 delete mode 100644 meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0006-IEC-62439-3-MIB-update-to-get-real-slave-admin-and-l.patch
 delete mode 100644 meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0007-IEC-62439-3-MIB-add-functions-to-get-set-real-values.patch
 delete mode 100644 meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0008-IEC-62439-3-MIB-Move-existing-lre-access-functions-t.patch
 delete mode 100644 meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0009-IEC-62439-3-MIB-add-initial-version-of-stats-and-nod.patch
 delete mode 100644 meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0010-IEC-62439-3-MIB-Add-support-for-lreNodesTable.patch
 delete mode 100644 meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0011-IEC-62439-3-MIB-bug-fixes.patch
 delete mode 100644 meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0012-IEC-62439-3-MIB-Fix-index-issue-in-table-implementat.patch
 delete mode 100644 meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0013-IEC-62439-3-MIB-Add-command-to-set-HSR-mode.patch
 delete mode 100644 meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0014-IEC-62439-3-MIB-add-license-header-to-sources.patch
 delete mode 100644 meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0015-IEC-62439-3-MIB-fix-lreManufacturerName-displaying-d.patch
 delete mode 100644 meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0016-IEC-62439-3-MIB-fix-duplicate-discard-mode-setting-f.patch
 delete mode 100644 meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0017-hsr-prp-update-to-retrieve-mibs-from-main-interface.patch
 delete mode 100644 meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0018-IEC-62439-3-MIB-update-to-work-with-iproute2-changes.patch
 delete mode 100644 meta-arago-distro/recipes-protocols/net-snmp/net-snmp_%.bbappend

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 8798a44a..623ffc49 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -51,8 +51,6 @@ BT_TI = "\
     bt-fw \
 "
 
-#    net-snmp
-#    net-snmp-server-snmpd
 CONNECTIVITY_RDEPENDS = " \
     htop \
     iptables \
diff --git a/meta-arago-distro/recipes-protocols/net-snmp/files/snmpd.conf b/meta-arago-distro/recipes-protocols/net-snmp/files/snmpd.conf
deleted file mode 100644
index 6c2f1755..00000000
diff --git a/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0001-IEC-62439-3-add-initial-support-for-hsr-prp-mib-supp.patch b/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0001-IEC-62439-3-add-initial-support-for-hsr-prp-mib-supp.patch
deleted file mode 100644
index 5f1f350a..00000000
diff --git a/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0002-IEC-62439-3-add-a-dummy-lreInterfaceConfigTable-for-.patch b/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0002-IEC-62439-3-add-a-dummy-lreInterfaceConfigTable-for-.patch
deleted file mode 100644
index dfabb06c..00000000
diff --git a/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0003-IEC-62439-3-MIB-update-lreInterfaceConfigTable-for-M.patch b/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0003-IEC-62439-3-MIB-update-lreInterfaceConfigTable-for-M.patch
deleted file mode 100644
index 30cd147d..00000000
diff --git a/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0004-IEC-62439-3-MIB-update-lreInterfaceTable-to-use-real.patch b/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0004-IEC-62439-3-MIB-update-lreInterfaceTable-to-use-real.patch
deleted file mode 100644
index 28e923f6..00000000
diff --git a/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0005-IEC-62439-3-MIB-refractor-code-for-re-use.patch b/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0005-IEC-62439-3-MIB-refractor-code-for-re-use.patch
deleted file mode 100644
index ac385243..00000000
diff --git a/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0006-IEC-62439-3-MIB-update-to-get-real-slave-admin-and-l.patch b/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0006-IEC-62439-3-MIB-update-to-get-real-slave-admin-and-l.patch
deleted file mode 100644
index 66cd8003..00000000
diff --git a/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0007-IEC-62439-3-MIB-add-functions-to-get-set-real-values.patch b/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0007-IEC-62439-3-MIB-add-functions-to-get-set-real-values.patch
deleted file mode 100644
index 27b811c2..00000000
diff --git a/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0008-IEC-62439-3-MIB-Move-existing-lre-access-functions-t.patch b/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0008-IEC-62439-3-MIB-Move-existing-lre-access-functions-t.patch
deleted file mode 100644
index 2659ddc0..00000000
diff --git a/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0009-IEC-62439-3-MIB-add-initial-version-of-stats-and-nod.patch b/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0009-IEC-62439-3-MIB-add-initial-version-of-stats-and-nod.patch
deleted file mode 100644
index 32715b0b..00000000
diff --git a/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0010-IEC-62439-3-MIB-Add-support-for-lreNodesTable.patch b/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0010-IEC-62439-3-MIB-Add-support-for-lreNodesTable.patch
deleted file mode 100644
index 25767032..00000000
diff --git a/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0011-IEC-62439-3-MIB-bug-fixes.patch b/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0011-IEC-62439-3-MIB-bug-fixes.patch
deleted file mode 100644
index 02b4ab7b..00000000
diff --git a/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0012-IEC-62439-3-MIB-Fix-index-issue-in-table-implementat.patch b/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0012-IEC-62439-3-MIB-Fix-index-issue-in-table-implementat.patch
deleted file mode 100644
index 3433a23d..00000000
diff --git a/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0013-IEC-62439-3-MIB-Add-command-to-set-HSR-mode.patch b/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0013-IEC-62439-3-MIB-Add-command-to-set-HSR-mode.patch
deleted file mode 100644
index a9719874..00000000
diff --git a/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0014-IEC-62439-3-MIB-add-license-header-to-sources.patch b/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0014-IEC-62439-3-MIB-add-license-header-to-sources.patch
deleted file mode 100644
index e8ca55f9..00000000
diff --git a/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0015-IEC-62439-3-MIB-fix-lreManufacturerName-displaying-d.patch b/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0015-IEC-62439-3-MIB-fix-lreManufacturerName-displaying-d.patch
deleted file mode 100644
index 9f2678a2..00000000
diff --git a/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0016-IEC-62439-3-MIB-fix-duplicate-discard-mode-setting-f.patch b/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0016-IEC-62439-3-MIB-fix-duplicate-discard-mode-setting-f.patch
deleted file mode 100644
index a95679d2..00000000
diff --git a/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0017-hsr-prp-update-to-retrieve-mibs-from-main-interface.patch b/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0017-hsr-prp-update-to-retrieve-mibs-from-main-interface.patch
deleted file mode 100644
index 717331eb..00000000
diff --git a/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0018-IEC-62439-3-MIB-update-to-work-with-iproute2-changes.patch b/meta-arago-distro/recipes-protocols/net-snmp/net-snmp/0018-IEC-62439-3-MIB-update-to-work-with-iproute2-changes.patch
deleted file mode 100644
index e62883dc..00000000
diff --git a/meta-arago-distro/recipes-protocols/net-snmp/net-snmp_%.bbappend b/meta-arago-distro/recipes-protocols/net-snmp/net-snmp_%.bbappend
deleted file mode 100644
index 32cbe416..00000000
-- 
2.37.3


