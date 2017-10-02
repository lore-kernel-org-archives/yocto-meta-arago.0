Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 1A41952A23
	for <meta-arago@arago-project.org>;
	Mon,  2 Oct 2017 22:55:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v92MtWXG021737
	for <meta-arago@arago-project.org>; Mon, 2 Oct 2017 17:55:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506984932;
	bh=Vh08VDgo6SydG8eQyu7ogUBH+V707/0QDWh3Atu+p54=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hrKmFLNWMq/dl0UeC7MwkUdiuH4nGjZCCHLv3Nz83cRqfwk1Ffhqlw7IwDsy9yL4E
	cVpqbAD7US0NuQ7ywFaGnKW+4rPGxPijCAfDFrfS6ZXD1eChLtAVfUPbEJQQNVmF1K
	+FKS6zSul8LTHjNciK9X8TJw+2Sam274yHkA1nnE=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92MtWsM032189
	for <meta-arago@arago-project.org>; Mon, 2 Oct 2017 17:55:32 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 2 Oct 2017 17:55:32 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 2 Oct 2017 17:55:32 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92MtVOF014023;
	Mon, 2 Oct 2017 17:55:32 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 2 Oct 2017 18:55:31 -0400
Message-ID: <1506984931-14186-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1506984931-14186-1-git-send-email-denys@ti.com>
References: <1506984931-14186-1-git-send-email-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][PATCH 2/2] arago-prefs: update gstreamer preferred version
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
X-List-Received-Date: Mon, 02 Oct 2017 22:55:33 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 7b09c1d..c839c9a 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -47,9 +47,9 @@ PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_omap-a15 = "wpa-supplicant-wl18xx"
 
-PREFERRED_VERSION_gstreamer1.0 = "1.10.4"
-PREFERRED_VERSION_gstreamer1.0-plugins-ugly = "1.10.4"
-PREFERRED_VERSION_gstreamer1.0-libav = "1.10.4"
-PREFERRED_VERSION_gstreamer1.0-plugins-good = "1.10.4"
-PREFERRED_VERSION_gstreamer1.0-plugins-bad = "1.10.4"
-PREFERRED_VERSION_gstreamer1.0-plugins-base = "1.10.4"
+PREFERRED_VERSION_gstreamer1.0 = "1.12.2"
+PREFERRED_VERSION_gstreamer1.0-plugins-ugly = "1.12.2"
+PREFERRED_VERSION_gstreamer1.0-libav = "1.12.2"
+PREFERRED_VERSION_gstreamer1.0-plugins-good = "1.12.2"
+PREFERRED_VERSION_gstreamer1.0-plugins-bad = "1.12.2"
+PREFERRED_VERSION_gstreamer1.0-plugins-base = "1.12.2"
-- 
1.7.9.5


