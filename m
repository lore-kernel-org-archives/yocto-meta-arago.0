Return-Path: <karthik.ramanan@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 3612A52A25
	for <meta-arago@arago-project.org>;
	Tue, 31 Oct 2017 16:16:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9VGGkdK013118
	for <meta-arago@arago-project.org>; Tue, 31 Oct 2017 11:16:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1509466606;
	bh=69Gh61y4kJbGWE/nyft2XDzDiB7JTEBbaxWrsgP/TyU=;
	h=From:To:CC:Subject:Date;
	b=TU8oG6ChWq9TQoUGGJ0qSuEzjU3lsA/Dqz7SUaPGzJz57maeeOVfaFksSSlF3B0Ca
	NmNpj37NRAEJH1sX24+CSH6ZlYoWQARzW+ogtnX4eVoBb+Aez7/Vycxmf0kzvPmMtU
	uwzc8UPIrY1/9XKQ9VsqsSsCkmuYZqvccjcNdLj0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9VGGkwL007826
	for <meta-arago@arago-project.org>; Tue, 31 Oct 2017 11:16:46 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 31 Oct 2017 11:16:45 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 31 Oct 2017 11:16:45 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9VGGhnH002374;
	Tue, 31 Oct 2017 11:16:44 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 31 Oct 2017 21:46:42 +0530
Message-ID: <1509466602-173226-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth] packagegroup-arago-tisdk-multimedia: TMP: Remove dspdce-fw temporarily
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
X-List-Received-Date: Tue, 31 Oct 2017 16:16:46 -0000
Content-Type: text/plain

From: Sam Nelson <sam.nelson@ti.com>

Build with new bios version is broken. Need to be fixed.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

(from meta-arago/morty f2b86b34c7664425a98c69de52af62ce1c968539)

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index d850e0f..a468086 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -36,7 +36,7 @@ MULTIMEDIA_append_omap5-evm = " \
 ACCEL_FW = ""
 
 ACCEL_FW_append_am57xx-evm = " \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw dspdce-fw', '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
 "
 
 ACCEL_FW_append_omap5-evm = " \
@@ -44,7 +44,7 @@ ACCEL_FW_append_omap5-evm = " \
 "
 
 ACCEL_FW_append_dra7xx-evm = " \
-    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw dspdce-fw', '', d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
     vis \
 "
 
-- 
1.9.1


