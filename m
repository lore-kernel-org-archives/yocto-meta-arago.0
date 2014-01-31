Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4BDB652A86
	for <meta-arago@arago-project.org>;
	Fri, 31 Jan 2014 19:48:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0VJmV24025751
	for <meta-arago@arago-project.org>; Fri, 31 Jan 2014 13:48:31 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0VJmVlF015166
	for <meta-arago@arago-project.org>; Fri, 31 Jan 2014 13:48:31 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 31 Jan 2014 13:48:30 -0600
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s0VJmPS5024302;	Fri, 31 Jan 2014 13:48:29 -0600
From: Chase Maupin <chase.maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 31 Jan 2014 13:48:23 -0600
Message-ID: <1391197703-29424-2-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391197703-29424-1-git-send-email-chase.maupin@ti.com>
References: <1391197703-29424-1-git-send-email-chase.maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] arago-prefs: set PREFERRED VERSION of libdrm to latest
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
X-List-Received-Date: Fri, 31 Jan 2014 19:48:32 -0000
Content-Type: text/plain

* Set the PREFERRED_VERSION of libdrm to the latest available in
  openembedded core by default.
* This will allow using a version of libdrm that will support
  the latest TI devices

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 20c6a63..e417585 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -4,6 +4,9 @@ include conf/distro/include/qt5-versions.inc
 # Use the latest version of ltp-ddt for kernel versions 3.8+
 PREFERRED_PROVIDER_ltp-ddt = "ltp-ddt"
 
+# User the latest version of libdrm
+PREFERRED_VERSION_libdrm = "2.4.46"
+
 PREFERRED_PROVIDER_virtual/gettext = "gettext"
 
 ARAGO_QT_PROVIDER = "${@base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d)}"
-- 
1.7.9.5


