Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7335652A52
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 13:33:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t25DXn5N029852
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 07:33:49 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25DXmNu018477
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 07:33:48 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Mar 2015 07:33:48 -0600
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t25DXmnE011405;	Thu, 5 Mar 2015 07:33:48 -0600
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1YTVuO-0001lr-DW;
	Thu, 05 Mar 2015 08:33:48 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 5 Mar 2015 08:33:26 -0500
Message-ID: <1425562410-19688-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425562410-19688-1-git-send-email-j-stiffler@ti.com>
References: <1425562410-19688-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [RFC 1/4] arago-prefs: Add ARAGO_QT_PLATFORM.
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
X-List-Received-Date: Thu, 05 Mar 2015 13:33:50 -0000
Content-Type: text/plain

* Currently supports either "wayland" of "eglfs"

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index e689f8b..96d84b8 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -28,6 +28,8 @@ PREFERRED_PROVIDER_virtual/gettext = "gettext"
 ARAGO_QT_PROVIDER = "${@base_conditional('QT_PROVIDER','qt5','',base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d),d)}"
 PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
 
+ARAGO_QT_PLATFORM = "wayland"
+
 PREFERRED_VERSION_qt4-embedded = "4.8.5"
 PREFERRED_VERSION_qt4-native = "4.8.5"
 PREFERRED_VERSION_nativesdk-qt4-tools = "4.8.5"
-- 
1.7.9.5


