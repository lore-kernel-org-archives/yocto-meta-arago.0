Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 553DB52A6F
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2012 05:02:25 +0000 (UTC)
Received: by oagn12 with SMTP id n12so1433090oag.38
	for <meta-arago@arago-project.org>;
	Wed, 26 Sep 2012 22:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=VFFT3BsqTsdL+hJ6KD7UKl/SAjKwaz4VW94S1a0eQ3E=;
	b=V8jHYPpFyNNiebyN6/6TaI9pT7h89ZWXYOobc+6G6PVu6kP39i/W7lngNx7fFU41CP
	S4t26Cc5xfY8JG0HlCPlW3SLg2zz03vL4mAu2nHx6+p2wDJt8tE5lS/+5zhcpIe+Nw8p
	qH4l1JCXVS/hHZlbrNitYcVLKgCeKHo4Xxzay+gVt5F47JU2Gd3JwD4TfhWdztq9esYE
	iYSfJUWJV5ZDFHRpcWdJxNzSWNnVaU/23rGu9uf4EB9ZS6R1tvRdwPWVHJtrZ4e2dICc
	tKh8k01rqFGPcoTRwXclHqFUQr15Aar9WbcDJ1Ypq30wr/wB58pKabaqc8z/2gvIUMiM
	iriw==
Received: by 10.182.169.37 with SMTP id ab5mr2171563obc.82.1348722144779;
	Wed, 26 Sep 2012 22:02:24 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id g8sm4862631obz.16.2012.09.26.22.02.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 22:02:24 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 27 Sep 2012 00:27:45 -0500
Message-Id: <1348723665-9571-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [meta-arago-distro][PATCH] openobex: Add arago specific tweaks.
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
X-List-Received-Date: Thu, 27 Sep 2012 05:02:26 -0000

* Port tweaks to openobex from arago:
* Add obex_test application
* Disable logging and dump prints
* Add libmisc.a which is needed by some bluetooth applications.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../openobex/openobex_1.5.bbappend                 |   21 ++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-connectivity/openobex/openobex_1.5.bbappend

diff --git a/meta-arago-distro/recipes-connectivity/openobex/openobex_1.5.bbappend b/meta-arago-distro/recipes-connectivity/openobex/openobex_1.5.bbappend
new file mode 100644
index 0000000..b4d7319
--- /dev/null
+++ b/meta-arago-distro/recipes-connectivity/openobex/openobex_1.5.bbappend
@@ -0,0 +1,21 @@
+PR_append = "-arago0"
+
+# Add apps/obex_test for testing
+do_configure_prepend() {
+	sed -i -e 's:bin_PROGRAMS = irxfer obex_tcp irobex_palm3:bin_PROGRAMS = irxfer obex_tcp irobex_palm3 obex_test:g' ${S}/apps/Makefile.am
+	aclocal
+	automake --add-missing
+	autoreconf
+}
+
+# tell the openobex configure script NOT to enable syslog and dump.
+# enabling log and dump prints lots of debug messages and hex dump value during BT
+# file transfer using openobex, due to which BT transfer get slow.
+
+EXTRA_OECONF := "${@'${EXTRA_OECONF}'.replace('--enable-syslog', '')}"
+EXTRA_OECONF := "${@'${EXTRA_OECONF}'.replace('--enable-dump', '')}"
+
+# WiLink Bluetooth application build depends on libmisc.a.
+do_install_append() {
+	install -m 644 ${S}/apps/libmisc.a ${D}/${libdir}
+}
-- 
1.7.0.4


