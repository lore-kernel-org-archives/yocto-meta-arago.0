Return-Path: <h-gou@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A1D0352A5B
	for <meta-arago@arago-project.org>;
	Wed,  3 Feb 2016 22:25:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u13MPVG4015725
	for <meta-arago@arago-project.org>; Wed, 3 Feb 2016 16:25:31 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u13MPVNP028674
	for <meta-arago@arago-project.org>; Wed, 3 Feb 2016 16:25:31 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 3 Feb 2016 16:25:31 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u13MPUK1024042;	Wed, 3 Feb 2016 16:25:30 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Feb 2016 17:25:25 -0500
Message-ID: <1454538325-32154-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] arago.conf: enable gstreamer for qtmultimedia PACKAGECONFIG
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
X-List-Received-Date: Wed, 03 Feb 2016 22:25:39 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index f876f00..4483d0b 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -52,6 +52,9 @@ PACKAGECONFIG_DISTRO_pn-qtbase = "icu examples"
 # Configure gstreamer dependency based on GST_PROVIDER
 PACKAGECONFIG_pn-qtwebkit = "${@base_conditional('GST_PROVIDER', '0.10', 'gstreamer010', 'gstreamer', d)} qtlocation qtmultimedia qtsensors"
 
+# Add gstreamer in package configuration to enable video
+PACKAGECONFIG_append_pn-qtmultimedia  = " gstreamer"
+
 # Prefer OpenSSL over GnuTLS for curl due to TSU exemptions
 PACKAGECONFIG_pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} ssl zlib"
 
-- 
1.9.1


