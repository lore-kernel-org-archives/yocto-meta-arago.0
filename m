Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 3754A529E7
	for <meta-arago@arago-project.org>;
	Tue, 18 Jul 2017 15:11:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IFBerq003158
	for <meta-arago@arago-project.org>; Tue, 18 Jul 2017 10:11:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500390700;
	bh=dCfHbGgNnkklFB4w8QLfBJUPMfEVFFgJCYSMHvyQnLs=;
	h=From:To:CC:Subject:Date;
	b=JCXw/2/+G/lmxKLrLfLg2KnEA/zZixS7vVHIDI9eE/4MaMiQoplCDrDzUTp0wvYZI
	hBoMufJL86BYvq2fQSDw17BClrTJ2wO0rzXFOT3iCFAAmMkx45bfWv/HIShX79KhdQ
	Aai9LppUj7jjuK+nm/hTHlwAZytP8leciejUNSXg=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IFBeJf020041
	for <meta-arago@arago-project.org>; Tue, 18 Jul 2017 10:11:40 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 10:11:39 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IFBdvc028129;	Tue, 18 Jul 2017 10:11:39 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 18 Jul 2017 11:05:31 -0400
Message-ID: <1500390331-12423-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] arago-prefs: c66x/omapl137: prefer linux-dummy
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
X-List-Received-Date: Tue, 18 Jul 2017 15:11:40 -0000
Content-Type: text/plain

* These SOCs do not have linux support.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 353f918..b68ed8e 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -24,6 +24,10 @@ PREFERRED_PROVIDER_virtual/mesa_keystone = "mesa"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging${ARAGO_KERNEL_SUFFIX}"
 
+# For TI devices with only baremetal/TI RTOS support
+PREFERRED_PROVIDER_virtual/kernel_c66x = "linux-dummy"
+PREFERRED_PROVIDER_virtual/kernel_omapl137 = "linux-dummy"
+
 PREFERRED_PROVIDER_jpeg = "libjpeg-turbo"
 
 # Setting PREFERRED_VERSIONS due to selecting a specific version of a library or
-- 
2.7.4


