Return-Path: <a0866934local@udb0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4A732529A7
	for <meta-arago@arago-project.org>;
	Wed,  4 Feb 2015 13:51:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t14DpjnA000447
	for <meta-arago@arago-project.org>; Wed, 4 Feb 2015 07:51:45 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t14DpiUo001548
	for <meta-arago@arago-project.org>; Wed, 4 Feb 2015 07:51:44 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Feb 2015 07:51:44 -0600
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t14DphSS029788;
	Wed, 4 Feb 2015 07:51:44 -0600
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YJ0Mp-0001VZ-BJ;
	Wed, 04 Feb 2015 08:51:43 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 Feb 2015 08:51:41 -0500
Message-ID: <1423057901-5767-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] perl-native: Fix for when shebang is too many characters.
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
X-List-Received-Date: Wed, 04 Feb 2015 13:51:46 -0000
Content-Type: text/plain

* Currently perl-native is installing perl scripts with the
  absolute path to the native  perl interpreter in the shebang.
* Due to the directory structure of Yocto, this path may exceed
  the shebang character limit in bash.
* This is a workaround to get the correct perl interpreter from
  the environment.
* This solution has been obtained from:
  http://patchwork.openembedded.org/patch/79251/
* This may be dropped after migrating to dizzy as this has been
  upstreamed: http://cgit.openembedded.org/openembedded-core/commit/?id=83dec26849a120d0f1de64e63025354fa7108491

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../perl/perl-native_5.14.3.bbappend               |    9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/perl/perl-native_5.14.3.bbappend

diff --git a/meta-arago-extras/recipes-devtools/perl/perl-native_5.14.3.bbappend b/meta-arago-extras/recipes-devtools/perl/perl-native_5.14.3.bbappend
new file mode 100644
index 0000000..2b16416
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/perl/perl-native_5.14.3.bbappend
@@ -0,0 +1,9 @@
+
+PR_append = "a"
+
+do_install_append() {
+	for f in `grep -Il '#! *${bindir}/perl' ${D}/${bindir}/*`; do
+		sed -i -e 's|${bindir}/perl|/usr/bin/env nativeperl|' $f
+	done
+}
+
-- 
1.7.9.5


