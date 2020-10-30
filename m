Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id AB160520EA
	for <meta-arago@arago-project.org>;
	Fri, 30 Oct 2020 19:14:36 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09UJBTNe084423
	for <meta-arago@arago-project.org>; Fri, 30 Oct 2020 14:11:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604085089;
	bh=+UczKmF+AxurLRDUesNSHJ/kwAWoEXSZft6eXwBBCF0=;
	h=From:To:CC:Subject:Date;
	b=j7ciMM72CxKmwB5NGvKRWE1aUZAp9UiKHQSuBo8VWrWg7zQ84W+CEjLhbfdxAvp6x
	oyrinAlZIOubm0WmivLUSNAz9a+mUUTaNEydf+fgQOF/XW59bz4dx89vyGAhrp1TcC
	vsj4F5Zfb1N9r4q4hNdqZi0xKVn7B60XO7THnFm0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09UJBTDF104839
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 30 Oct 2020 14:11:29 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 30 Oct 2020 14:11:29 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 30 Oct 2020 14:11:29 -0500
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09UJBTPZ102427;
	Fri, 30 Oct 2020 14:11:29 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	09UJBTNu024643; Fri, 30 Oct 2020 14:11:29 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Dan Murphy <dmurphy@ti.com>, Denys
	Dmytriyenko <denys@ti.com>
Date: Fri, 30 Oct 2020 14:11:24 -0500
Message-ID: <20201030191124.8507-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master][PATCH] argo-prefs: remove prefered provider for libgl
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
X-List-Received-Date: Fri, 30 Oct 2020 19:14:37 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

ligbl provider was needed earlier for satisfying weston dependencies.
Removing this as that is not needed anymore.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 6d156624..a356c76c 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -21,9 +21,6 @@ PREFERRED_PROVIDER_virtual/libgles2_j7 = "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/libgbm_j7 = "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver_j7 = "ti-img-rogue-driver"
 
-# OpenGL preferences
-PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
-
 # This is required when using keystone devices with graphical support
 # such as Qt5
 PREFERRED_PROVIDER_virtual/egl_keystone = "mesa"
-- 
2.17.1


