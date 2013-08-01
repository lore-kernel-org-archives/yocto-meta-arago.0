Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0DFDD52A38
	for <meta-arago@arago-project.org>;
	Thu,  1 Aug 2013 00:07:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7107PUo030226
	for <meta-arago@arago-project.org>; Wed, 31 Jul 2013 19:07:25 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7107PiT010234
	for <meta-arago@arago-project.org>; Wed, 31 Jul 2013 19:07:25 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 31 Jul 2013 19:07:25 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r71079RC032028;
	Wed, 31 Jul 2013 19:07:23 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 31 Jul 2013 19:31:51 -0500
Message-ID: <1375317112-1690-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1375317112-1690-1-git-send-email-fcooper@ti.com>
References: <1375317112-1690-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [master & danny][PATCH 6/7] toolchain-external-linaro: Use separate linux-libc-headers provider
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
X-List-Received-Date: Thu, 01 Aug 2013 00:07:26 -0000
Content-Type: text/plain

* Do not use linux-libc-headers from the toolchain which is fixed to a specific
  version of linux-libc-headers.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/include/toolchain-linaro.inc       |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index 5713da2..9751725 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -36,3 +36,7 @@ PREFERRED_VERSION_binutils-crosssdk ?= "${SDKBINUVERSION}"
 PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${SDKLINUXLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-eglibc ?= "${SDKEGLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-eglibc-initial ?= "${SDKEGLIBCVERSION}"
+
+PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
+PREFERRED_PROVIDER_linux-libc-headers-dev = "linux-libc-headers"
+PREFERRED_PROVIDER_virtual/linux-libc-headers = "linux-libc-headers"
-- 
1.7.0.4


