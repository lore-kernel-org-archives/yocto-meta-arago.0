Return-Path: <yanivma@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 845765298E
	for <meta-arago@arago-project.org>;
	Tue, 19 Aug 2014 12:31:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7JCVFXR026295
	for <meta-arago@arago-project.org>; Tue, 19 Aug 2014 07:31:15 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7JCVFag019283
	for <meta-arago@arago-project.org>; Tue, 19 Aug 2014 07:31:15 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 19 Aug 2014 07:31:15 -0500
Received: from mcp8x-srv.emea.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7JCVERS029901;	Tue, 19 Aug 2014 07:31:14 -0500
From: Yaniv Machani <yanivma@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Aug 2014 15:25:57 +0300
Message-ID: <1408451157-17268-1-git-send-email-yanivma@ti.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] omap2+: defconfig: wlan: move configuration to fragments
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
X-List-Received-Date: Tue, 19 Aug 2014 12:31:16 -0000
Content-Type: text/plain

Remove wlan modules from omap2plus_defconfig to support building with compat.

Add wlan fragment with releveant configuration parameters.

Signed-off-by: Yaniv Machani <yanivma@ti.com>
---
To support the compat-wirelss compilation in the meta-arago build
the modules removal is required to avoid conflicts.


 arch/arm/configs/omap2plus_defconfig |    5 -----
 ti_config_fragments/wlan.cfg         |   17 +++++++++++++++++
 2 files changed, 17 insertions(+), 5 deletions(-)
 create mode 100644 ti_config_fragments/wlan.cfg

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index b88bee2..c5d981b 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -79,7 +79,6 @@ CONFIG_BT_HCIUART_LL=y
 CONFIG_BT_HCIBCM203X=m
 CONFIG_BT_HCIBPA10X=m
 CONFIG_BT_WILINK=m
-CONFIG_CFG80211=m
 CONFIG_NL80211_TESTMODE=y
 CONFIG_MAC80211=m
 CONFIG_MAC80211_RC_PID=y
@@ -133,10 +132,6 @@ CONFIG_LIBERTAS_USB=m
 CONFIG_LIBERTAS_SDIO=m
 CONFIG_LIBERTAS_DEBUG=y
 CONFIG_WL_TI=y
-CONFIG_WL12XX=m
-CONFIG_WL18XX=m
-CONFIG_WLCORE_SPI=m
-CONFIG_WLCORE_SDIO=m
 CONFIG_MWIFIEX=m
 CONFIG_MWIFIEX_SDIO=m
 CONFIG_MWIFIEX_USB=m
diff --git a/ti_config_fragments/wlan.cfg b/ti_config_fragments/wlan.cfg
new file mode 100644
index 0000000..596ce9e
--- /dev/null
+++ b/ti_config_fragments/wlan.cfg
@@ -0,0 +1,17 @@
+#Base modules
+CPTCFG_CFG80211=m
+CPTCFG_MAC80211=m
+CPTCFG_WLAN=y
+CPTCFG_WL_TI=y
+CPTCFG_WL12XX=m
+CPTCFG_WL18XX=m
+CPTCFG_WLCORE=m
+CPTCFG_WLCORE_SDIO=m
+
+#SOFTAP CONFIG
+CONFIG_NF_CONNTRACK=y
+CONFIG_NF_CONNTRACK_IPV4=y
+CONFIG_IP_NF_IPTABLES=y
+CONFIG_IP_NF_FILTER=y
+CONFIG_NF_NAT_IPV4=y
+CONFIG_IP_NF_TARGET_MASQUERADE=y
-- 
1.7.9


