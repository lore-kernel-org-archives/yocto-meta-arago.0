Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50])
	by arago-project.org (Postfix) with ESMTPS id B2A6E52A6D
	for <meta-arago@arago-project.org>;
	Wed,  6 Feb 2013 02:28:12 +0000 (UTC)
Received: by mail-oa0-f50.google.com with SMTP id l20so1000188oag.37
	for <meta-arago@arago-project.org>;
	Tue, 05 Feb 2013 18:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=LKwt6XhuQrRMC3nMG4UeLblJZ6ZvXMYEbr/FOwO7N04=;
	b=f3f+aVyDSMWnZ0oJECWDKZf+CNx7cPMjqydoqIIVmvlK9j1z9UWY4LRmp7SokV9KDs
	8HIBQKYsDQ6n25pXshxBWQXOt+LmCNxg/dUbJVzFNIc7T7My3K8E9vM+LzTUviNfHjb+
	9mvbz/HvokzRzteZuSj7zRXE0R6XT87FMM67ZgNj/gM1cs7miVR65vPNhTymvsYYT3gV
	JhyhbV082jw2gJTsF8zETOUnCjrEoc/GcHP+FyZ2/sfN0qHENuw9GotW9uVQQOU+H/1C
	kfM4HV0EQCb69jS7rdlZlcAgx4/Xk+O7+r+r3LIuiWGm6VqJwKlCCnigRya25K5Czxm8
	R1Iw==
X-Received: by 10.60.154.169 with SMTP id vp9mr20737631oeb.109.1360117692063; 
	Tue, 05 Feb 2013 18:28:12 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id 9sm3307205oeh.8.2013.02.05.18.28.10
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 18:28:11 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Tue,  5 Feb 2013 20:27:58 -0600
Message-Id: <1360117678-4395-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360117678-4395-1-git-send-email-fcooper@ti.com>
References: <1360117678-4395-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/4] php_5.3.19: Do not build php-fpm
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
X-List-Received-Date: Wed, 06 Feb 2013 02:28:12 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* In meta-oe php-fpm is being built which prevents php-cgi from being built.
* This issue is talked about here: https://bugs.php.net/bug.php?id=60144
* Php-cgi is used by Matrix v2
* Simply removing enable-fpm from EXTRA_OECONF doesn't work because do_install
  requires certain files to be there which is only generated if fpm support is
  enabled.
* Add a workaround to address this issue.
* The goal is to resolve this issue in meta-oe which means the changes in this
  patch can eventually be removed.
---
 .../recipes-devtools/php/php_5.3.19.bbappend       |   19 ++++++++++++++++++-
 1 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-devtools/php/php_5.3.19.bbappend b/meta-arago-distro/recipes-devtools/php/php_5.3.19.bbappend
index 4c3fd39..fb1c25d 100644
--- a/meta-arago-distro/recipes-devtools/php/php_5.3.19.bbappend
+++ b/meta-arago-distro/recipes-devtools/php/php_5.3.19.bbappend
@@ -1,6 +1,23 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago0"
+PR_append = "-arago1"
 
 SRC_URI_append_virtclass-native = " file://0001-php-native-Fix-host-contamination-issue.patch"
+
+
+# Work around to address the fact that php-fpm and php-cgi can not coexist
+# php-cgi is used by Matrix and php-fpm is in beta for this version of php.
+# Once this issue is fix in meta-oe the below won't be needed.
+# Issue mentioned here: https://bugs.php.net/bug.php?id=60144
+
+EXTRA_OECONF := "${@oe_filter_out('--enable-fpm', '${EXTRA_OECONF}', d)}"
+
+PACKAGES := "${@oe_filter_out('${PN}-fpm', '${PACKAGES}', d)}"
+PACKAGES := "${@oe_filter_out('${PN}-fpm-apache2', '${PACKAGES}', d)}"
+
+do_install_prepend_pn-php() {
+    # Add the below file even though we aren't going to use it.
+    # do_install will complain and fail if this file isn't found.
+    touch ${S}/sapi/fpm/init.d.php-fpm
+}
-- 
1.7.0.4


