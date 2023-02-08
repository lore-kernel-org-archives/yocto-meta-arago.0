Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C35BDC636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 23:34:07 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.1096.1675899240699378813
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 15:34:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JSuE/0qy;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318NXxxp086542;
	Wed, 8 Feb 2023 17:33:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675899239;
	bh=XNGMycyxiRe4f0WpNNFTcI1+epBeehz62OxnOoE6++Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JSuE/0qy3iOsf1OkxQHjKf/79xzHUH42OEn4aIwdOFQMKmEPUgAT6jTLpVIWknjeg
	 nF09/v9TdoKEWA/0MyDdGyeXjoqRlld/WiyS3TNdMGzlWESBiPjPyYqP77m2kihAHU
	 R084XGD+98upwzNUdLDxKccFdk0WhIIZf9nqsVVc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318NXxu7025143
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 17:33:59 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 17:33:59 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 17:33:59 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318NXwlF002011;
	Wed, 8 Feb 2023 17:33:59 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH 2/3] qtbase-conf: Disable sandbox by default for QtWebEngine
Date: Wed, 8 Feb 2023 17:33:57 -0600
Message-ID: <20230208233358.19714-2-afd@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208233358.19714-1-afd@ti.com>
References: <20230208233358.19714-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 08 Feb 2023 23:34:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14208

QtWebEngine does not work with the sandbox right now for a couple
reasons, while we work to fix those, disable it by default.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
index c79ccd47..5180c8e4 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
@@ -11,3 +11,6 @@ export QT_WAYLAND_SHELL_INTEGRATION=xdg-shell
 # from the pthread implementation. Disable this feature temporarily until
 # those issues are resolved.
 export QTWEBENGINE_CHROMIUM_FLAGS="--disable-seccomp-filter-sandbox"
+
+export QTWEBENGINE_DISABLE_SANDBOX=1
+#export QT_QPA_PLATFORM=eglfs
-- 
2.39.1


