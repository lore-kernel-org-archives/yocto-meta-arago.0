Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 18D9552996
	for <meta-arago@arago-project.org>;
	Thu,  7 Aug 2014 19:45:10 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s77Jj9Yx008119
	for <meta-arago@arago-project.org>; Thu, 7 Aug 2014 14:45:09 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s77Jj93N008724
	for <meta-arago@arago-project.org>; Thu, 7 Aug 2014 14:45:09 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 7 Aug 2014 14:45:09 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s77Jj8hg018109;	Thu, 7 Aug 2014 14:45:08 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s77Jj4IX011788;	Fri, 8 Aug 2014 01:15:07 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 7 Aug 2014 14:45:01 -0500
Message-ID: <1407440703-21811-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1407440703-21811-1-git-send-email-fcooper@ti.com>
References: <1407440703-21811-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/4 v2] arago-prefs: Point omap-15 SOCs to use the latest TI U-boot integration tree
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
X-List-Received-Date: Thu, 07 Aug 2014 19:45:10 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

---
 .../conf/distro/include/arago-prefs.inc            |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 1178687..fbbf904 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -76,6 +76,10 @@ PREFERRED_PROVIDER_virtual/bootloader_am335x-evm = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot_am335x-evm = "u-boot-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader_am437x-evm = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot_am437x-evm = "u-boot-ti-staging"
+
+PREFERRED_PROVIDER_virtual/bootloader_omap-a15 = "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot_omap-a15 = "u-boot-ti-staging"
+
 PREFERRED_VERSION_u-boot-ti-staging = "2014.07%"
 
 # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
-- 
1.7.9.5


