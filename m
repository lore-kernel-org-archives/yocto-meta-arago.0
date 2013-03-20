Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 377B652961
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 02:06:08 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2K266Vb006413
	for <meta-arago@arago-project.org>; Tue, 19 Mar 2013 21:06:07 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K265iP023060
	for <meta-arago@arago-project.org>;
	Wed, 20 Mar 2013 07:36:05 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Wed, 20 Mar 2013 07:36:05 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2K25epU026167;
	Wed, 20 Mar 2013 07:36:05 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Mar 2013 21:05:38 -0500
Message-ID: <1363745138-10288-17-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363745138-10288-1-git-send-email-fcooper@ti.com>
References: <1363745138-10288-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 17/17] arago.conf: Set PREFERRED_VERSIONs for Wilink 6 recipes
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
X-List-Received-Date: Wed, 20 Mar 2013 02:06:08 -0000
Content-Type: text/plain

* Currently two versions of Wilink 6 need to be supported.
* The latest version supports the PG 3 wilink 6 module which is the version that
  comes with the am37x-evm and am335x-evm .
* An older version supports the PG 2 wilink 6 module which is the version that
  comes with the am180x-evm.
* Specifying the PREFERRED_VERSION to match this requirement.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 9e43ea3..44141c1 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -105,6 +105,23 @@ PREFERRED_VERSION_bluez-hcidump = "2.2"
 PREFERRED_VERSION_bash = "3.2.48"
 PREFERRED_VERSION_gettext = "0.16.1"
 
+# Support Wilink 6 PG 3 modules
+PREFERRED_VERSION_ti-compat-bluetooth = "r5.sp3.05"
+PREFERRED_VERSION_ti-compat-wireless-wl12xx = "r5.sp4.01"
+PREFERRED_VERSION_wl12xx-firmware = "r5.sp4.01"
+PREFERRED_VERSION_wpa-supplicant = "r5.sp4.01"
+PREFERRED_VERSION_hostap-daemon = "r5.sp4.01"
+PREFERRED_VERSION_ti-wifi-utils = "r5.sp3.05"
+
+# Support Wilink 6 PG 2 modules
+# By default am180x-evms come with an outdated wilink 6 module
+PREFERRED_VERSION_ti-compat-bluetooth_am180x-evm = "r5.00.18"
+PREFERRED_VERSION_ti-compat-wireless-wl12xx_am180x-evm = "r5.00.18"
+PREFERRED_VERSION_wl12xx-firmware_am180x-evm = "r5.00.18"
+PREFERRED_VERSION_wpa-supplicant_am180x-evm = "r5.00.18"
+PREFERRED_VERSION_hostap-daemon_am180x-evm = "r5.00.18"
+PREFERRED_VERSION_ti-wifi-utils_am180x-evm = "r5.00.18"
+
 # Disable polkit's systemd configuration from meta-oe
 POLKITAUTH = ""
 
-- 
1.7.0.4


