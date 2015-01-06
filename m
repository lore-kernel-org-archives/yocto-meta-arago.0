Return-Path: <a0866934local@udb0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A1E1B529D3
	for <meta-arago@arago-project.org>;
	Tue,  6 Jan 2015 14:25:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t06EPKos030323
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 08:25:20 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06EPKud005809
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 08:25:20 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 6 Jan 2015 08:25:20 -0600
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06EPKvj003576;
	Tue, 6 Jan 2015 08:25:20 -0600
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1Y8V4S-00056N-D2;
	Tue, 06 Jan 2015 09:25:20 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 6 Jan 2015 09:25:12 -0500
Message-ID: <1420554312-19580-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] perl-native: Fix for when shebang is too many characters.
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
X-List-Received-Date: Tue, 06 Jan 2015 14:25:21 -0000
Content-Type: text/plain

 * Solution obtained from http://patchwork.openembedded.org/patch/79251/

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../perl/perl-native_5.14.3.bbappend               |    9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/perl/perl-native_5.14.3.bbappend

diff --git a/meta-arago-extras/recipes-devtools/perl/perl-native_5.14.3.bbappend b/meta-arago-extras/recipes-devtools/perl/perl-native_5.14.3.bbappend
new file mode 100644
index 0000000..8639d5b
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/perl/perl-native_5.14.3.bbappend
@@ -0,0 +1,9 @@
+
+PR_append = "-arago0"
+
+do_install_append() {
+	for f in `grep -Il '#! *${bindir}/perl' ${D}/${bindir}/*`; do
+		sed -i -e 's|${bindir}/perl|/usr/bin/env nativeperl|' $f
+	done
+}
+
-- 
1.7.9.5


