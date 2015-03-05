Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0F55D52A77
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 18:31:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t25IVnm1010611
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 12:31:49 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25IVmKP005295
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 12:31:48 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Mar 2015 12:31:47 -0600
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t25IVlHJ023826;	Thu, 5 Mar 2015 12:31:47 -0600
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YTaYl-0005C1-Ii;
	Thu, 05 Mar 2015 13:31:47 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 5 Mar 2015 13:31:40 -0500
Message-ID: <1425580304-19919-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425580304-19919-1-git-send-email-j-stiffler@ti.com>
References: <1425580304-19919-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [RFC v2 1/4] arago-prefs: Add WAYLAND_SUPPORT flag.
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
X-List-Received-Date: Thu, 05 Mar 2015 18:31:50 -0000
Content-Type: text/plain

* Default to "1" if QT_PROVIDER is not "qt4e".

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index e689f8b..a566437 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -28,6 +28,8 @@ PREFERRED_PROVIDER_virtual/gettext = "gettext"
 ARAGO_QT_PROVIDER = "${@base_conditional('QT_PROVIDER','qt5','',base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d),d)}"
 PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
 
+WAYLAND_SUPPORT ?= "${@base_conditional('QT_PROVIDER', 'qt4e', '0', '1', d)}"
+
 PREFERRED_VERSION_qt4-embedded = "4.8.5"
 PREFERRED_VERSION_qt4-native = "4.8.5"
 PREFERRED_VERSION_nativesdk-qt4-tools = "4.8.5"
-- 
1.7.9.5


