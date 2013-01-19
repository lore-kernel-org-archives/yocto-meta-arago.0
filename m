Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by arago-project.org (Postfix) with ESMTPS id E34BA52A92
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:04 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id un3so4808270obb.21
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=wfEQyjNs2M4Lfwt0gSksvNH8KK3CX9lORET/j3vCcys=;
	b=L39A7n1Nwj/a2MndCVE92lWWLbBD7QJpHG7jhFMOFt0ZBCDlyT9nsIF/WcakQg6yv6
	aT3m+wejyjcLm40s5/eAU7S7NlHwqZxugvcW11FyLAPw+hWVjgu6smQH2Lfl5nCpcREW
	Xfn2BpIqfFu4PtkXmAPJKJBRqHdjBsYkIH+uJir9g/vGVbfUUSC4UvCvF47Z9CvZKfYs
	gpwFpaa7UBdnuIq8Ak04MP7xvruxLQsWytEDAvKzD/wi5pgixiiOKcbsEKyN4NI+SnvL
	1ZAgXDe4VzCXHJHMf335h3y+JhQuTxUV8KLEduprjHwtlOTppQxlXTW0K9KE6Dxq2vYc
	Obtw==
X-Received: by 10.182.131.3 with SMTP id oi3mr10255742obb.84.1358632324030;
	Sat, 19 Jan 2013 13:52:04 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.01
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:02 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:26 -0600
Message-Id: <1358632316-12266-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 01/31] obexd: Pull in obexd from Arago
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:05 -0000

* Pull in obexd version 0.34 which was used in the Sitara SDK.
* The software and scripts included in this SDK for the WL1271 daughter card
  depends on older versions of various wlan and bluetooth libraries and
  applications.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-connectivity/obex/obexd_0.34.bb        |   23 ++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/obex/obexd_0.34.bb

diff --git a/meta-arago-extras/recipes-connectivity/obex/obexd_0.34.bb b/meta-arago-extras/recipes-connectivity/obex/obexd_0.34.bb
new file mode 100644
index 0000000..8de34e9
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/obex/obexd_0.34.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "OBEX Server and Client"
+DEPENDS = "openobex glib-2.0 dbus bluez4 libical"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "files://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
+
+PR = "r0"
+
+SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "36080a767e63e54878cd6bcfb20c4f3b"
+SRC_URI[sha256sum] = "f99fb58562a3d7edef6fd9e63ca04510e241bbdab37fdb122c2c7a112a09100a"
+
+inherit autotools
+
+PACKAGES =+ "obex-client obex-plugins"
+
+FILES_${PN} += "${datadir}/dbus-1/services/${PN}.service"
+FILES_obex-client = "${libexecdir}/obex-client \
+                     ${datadir}/dbus-1/services/obex-client.service"
+# currently the plugins are empty
+FILES_obex-plugins = "${libdir}/obex/plugins"
-- 
1.7.0.4


