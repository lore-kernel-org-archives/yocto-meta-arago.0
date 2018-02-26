Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by arago-project.org (Postfix) with ESMTP id 03F29529A0
	for <meta-arago@arago-project.org>;
	Mon, 26 Feb 2018 07:17:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="37254051"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Feb 2018 15:16:25 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 35C5B48AE762
	for <meta-arago@arago-project.org>;
	Mon, 26 Feb 2018 15:16:21 +0800 (CST)
Received: from localhost.localdomain (10.167.225.125) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 26 Feb 2018 15:16:22 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <meta-arago@arago-project.org>
Date: Mon, 26 Feb 2018 15:16:20 +0800
Message-ID: <1519629380-808-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.225.125]
X-yoursite-MailScanner-ID: 35C5B48AE762.A96C7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] thttpd: 2.25b -> 2.28
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
X-List-Received-Date: Mon, 26 Feb 2018 07:17:07 -0000
Content-Type: text/plain

1.Upgrade thttpd from 2.25b to 2.28.
2.Update the checksum of LIC_FILES_CHKSUM, since thttpd.c has been changed. But lincese remains the same.
3.Modify htpasswd_getline.diff, since the data has been changed.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../thttpd/{thttpd-2.25b => thttpd-2.28}/acinclude.m4               | 0
 .../thttpd/{thttpd-2.25b => thttpd-2.28}/htpasswd_getline.diff      | 6 +++---
 .../thttpd/{thttpd-2.25b => thttpd-2.28}/htpasswd_shared.diff       | 0
 .../recipes-extended/thttpd/{thttpd-2.25b => thttpd-2.28}/init      | 0
 .../thttpd/{thttpd-2.25b => thttpd-2.28}/install.patch              | 0
 .../recipes-extended/thttpd/{thttpd_2.25b.bb => thttpd_2.28.bb}     | 6 +++---
 6 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-arago-extras/recipes-extended/thttpd/{thttpd-2.25b => thttpd-2.28}/acinclude.m4 (100%)
 rename meta-arago-extras/recipes-extended/thttpd/{thttpd-2.25b => thttpd-2.28}/htpasswd_getline.diff (80%)
 rename meta-arago-extras/recipes-extended/thttpd/{thttpd-2.25b => thttpd-2.28}/htpasswd_shared.diff (100%)
 rename meta-arago-extras/recipes-extended/thttpd/{thttpd-2.25b => thttpd-2.28}/init (100%)
 rename meta-arago-extras/recipes-extended/thttpd/{thttpd-2.25b => thttpd-2.28}/install.patch (100%)
 rename meta-arago-extras/recipes-extended/thttpd/{thttpd_2.25b.bb => thttpd_2.28.bb} (81%)

diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/acinclude.m4 b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/acinclude.m4
similarity index 100%
rename from meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/acinclude.m4
rename to meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/acinclude.m4
diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/htpasswd_getline.diff b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/htpasswd_getline.diff
similarity index 80%
rename from meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/htpasswd_getline.diff
rename to meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/htpasswd_getline.diff
index 82b12e2..7edd313 100644
--- a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/htpasswd_getline.diff
+++ b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/htpasswd_getline.diff
@@ -4,16 +4,16 @@
      while((line[y++] = line[x++]));
  }
  
--static int getline(char *s, int n, FILE *f) {
+-static int my_getline(char *s, int n, FILE *f) {
 +static int ht_getline(char *s, int n, FILE *f) {
-     register int i=0;
+     int i=0;
  
      while(1) {
 @@ -189,7 +189,7 @@
      strcpy(user,argv[2]);
  
      found = 0;
--    while(!(getline(line,MAX_STRING_LEN,f))) {
+-    while(!(my_getline(line,MAX_STRING_LEN,f))) {
 +    while(!(ht_getline(line,MAX_STRING_LEN,f))) {
          if(found || (line[0] == '#') || (!line[0])) {
              putline(tfp,line);
diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/htpasswd_shared.diff b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/htpasswd_shared.diff
similarity index 100%
rename from meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/htpasswd_shared.diff
rename to meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/htpasswd_shared.diff
diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/init b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/init
similarity index 100%
rename from meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/init
rename to meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/init
diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/install.patch b/meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/install.patch
similarity index 100%
rename from meta-arago-extras/recipes-extended/thttpd/thttpd-2.25b/install.patch
rename to meta-arago-extras/recipes-extended/thttpd/thttpd-2.28/install.patch
diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd_2.25b.bb b/meta-arago-extras/recipes-extended/thttpd/thttpd_2.28.bb
similarity index 81%
rename from meta-arago-extras/recipes-extended/thttpd/thttpd_2.25b.bb
rename to meta-arago-extras/recipes-extended/thttpd/thttpd_2.28.bb
index 477eff4..0477509 100644
--- a/meta-arago-extras/recipes-extended/thttpd/thttpd_2.25b.bb
+++ b/meta-arago-extras/recipes-extended/thttpd/thttpd_2.28.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD"
 HOMEPAGE = "http://www.acme.com/software/thttpd/"
 PR ="r0"
 
-LIC_FILES_CHKSUM = "file://thttpd.c;beginline=1;endline=26;md5=0c5762c2c34dcbe9eb18815516502872"
+LIC_FILES_CHKSUM = "file://thttpd.c;beginline=1;endline=26;md5=525c6428ecff95f4e71d5b3c88a34fff"
 SRC_URI = "http://www.acme.com/software/thttpd/thttpd-${PV}.tar.gz \
 	   file://install.patch \
 	   file://acinclude.m4 \
@@ -39,5 +39,5 @@ do_install_append () {
 }
 
 
-SRC_URI[md5sum] = "156b249b3b0bcd48b06badd2db0d56c5"
-SRC_URI[sha256sum] = "07719b08b1cff6a21c08697a7bcb4395425b07ee753106262fb62a03a7d32360"
+SRC_URI[md5sum] = "f5747680740dfbf8fc73a4fd82c754bb"
+SRC_URI[sha256sum] = "8552f929d4ede26cb193411c1208168e169dda24ee9eb1da8f8da4f4f8e10328"
-- 
2.7.4




