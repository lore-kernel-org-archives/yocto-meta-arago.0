Return-Path: <h-gou@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 61641529C9
	for <meta-arago@arago-project.org>;
	Tue, 16 Aug 2016 22:04:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u7GM4r2P005521
	for <meta-arago@arago-project.org>; Tue, 16 Aug 2016 17:04:53 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7GM4qHW009253
	for <meta-arago@arago-project.org>; Tue, 16 Aug 2016 17:04:52 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 16 Aug 2016 17:04:52 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u7GM4piq018753;	Tue, 16 Aug 2016 17:04:52 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 16 Aug 2016 18:04:45 -0400
Message-ID: <1471385087-22759-2-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1471385087-22759-1-git-send-email-h-gou@ti.com>
References: <1471385087-22759-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] wayland-protocols: add version 1.5
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
X-List-Received-Date: Tue, 16 Aug 2016 22:04:59 -0000
Content-Type: text/plain

* wayland-protocols is required for building glfw3: version 3.2.
* This recipe exists in upstream under the master branch:
  http://cgit.openembedded.org/cgit.cgi/openembedded-core/tree/meta/
  recipes-graphics/wayland/wayland-protocols_1.5.bb?h=master

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../wayland/wayland-protocols_1.5.bb                 | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-protocols_1.5.bb

diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-protocols_1.5.bb b/meta-arago-distro/recipes-graphics/wayland/wayland-protocols_1.5.bb
new file mode 100644
index 0000000..3a40fb2
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-protocols_1.5.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Collection of additional Wayland protocols"
+DESCRIPTION = "Wayland protocols that add functionality not \
+available in the Wayland core protocol. Such protocols either add \
+completely new functionality, or extend the functionality of some other \
+protocol either in Wayland core, or some other protocol in \
+wayland-protocols."
+HOMEPAGE = "http://wayland.freedesktop.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
+                    file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
+
+SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+           "
+SRC_URI[md5sum] = "e4279fec1283067706373d4d975be333"
+SRC_URI[sha256sum] = "7d0b426ccaeafc084fc579bb2a139f8ad4ea3492d54b7b0210d124c61fbeb2bf"
+
+inherit allarch autotools pkgconfig
+
+PACKAGES = "${PN}"
+FILES_${PN} += "${datadir}/pkgconfig/wayland-protocols.pc"
-- 
1.9.1


