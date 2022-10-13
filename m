Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601A3C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 20:34:47 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.1212.1665693282390618594
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Oct 2022 13:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oVZm/mYk;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29DKYeD0060662;
	Thu, 13 Oct 2022 15:34:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665693280;
	bh=9P/SJ6BxVJZr2uYx9jhYk2yiSioIfozXa+e851SN5Jg=;
	h=From:To:CC:Subject:Date;
	b=oVZm/mYk9fFl/46WbVOBX2wakvrWEFWhcaLcVud5TqzxNP/yljHLddBJihyQGn1R9
	 gmNUZKVhmjWSEl7TrTKUsRHYSo0l7OimOaoStW985oKaRf7Vz0VdRCLx6sTQUYCHa0
	 uYH7V2/g4Bz7+XSvtMhsAFqhpjeJVUeLNxVBQ6KY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29DKYe1E037019
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Oct 2022 15:34:40 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 13
 Oct 2022 15:34:40 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 13 Oct 2022 15:34:40 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29DKYdeu008946;
	Thu, 13 Oct 2022 15:34:39 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone/dunfell][PATCH] qtbase-conf: fix name of WAYLAND_SHELL_INTEGRATION
Date: Thu, 13 Oct 2022 15:34:39 -0500
Message-ID: <20221013203439.17108-1-afd@ti.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Oct 2022 20:34:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14084

The wl-shell is deprecated rename to xdg-shell.
Change this to remove deprecation warning.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh       | 2 +-
 meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
index 928e2cc7..c79ccd47 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
@@ -5,7 +5,7 @@ export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
 export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
 export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
 export QT_QPA_EGLFS_ALWAYS_SET_MODE=1
-export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
+export QT_WAYLAND_SHELL_INTEGRATION=xdg-shell
 
 # SECCOMP-BPF Sandbox does not work due to unexpected FUTEX_UNLOCK_PI call
 # from the pthread implementation. Disable this feature temporarily until
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
index 96526393..ef49b124 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
@@ -6,7 +6,7 @@ export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
 export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
 export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
 export QT_QPA_EGLFS_ALWAYS_SET_MODE=1
-export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
+export QT_WAYLAND_SHELL_INTEGRATION=xdg-shell
 
 # SECCOMP-BPF Sandbox does not work due to unexpected FUTEX_UNLOCK_PI call
 # from the pthread implementation. Disable this feature temporarily until
-- 
2.37.3


