Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id DBC9A5208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:53:44 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so4861422oag.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=iJ1mRsGB6asIGGB3LuZE0r8NDCNTXgU08zXOeGe8qGU=;
	b=VKzPyqyFbU0Su2lQzHRdGfJGNmPL4PhMeP3dgcHIG5uZskqVZqEcuzAPelA5ESp2Tz
	0QR42ILuX3rF2/m/y0yneUyqmt7aUVkW4PkN+atXnVYjWs0DV6MpsulY6lsvzgDc6r5x
	1SHyCk5OPfxb4agD2p7XO3KsQ6TrnIhrRp3zpB0B0oZwYW1loXYl3ivNHBSkGBrB5ort
	aD+PwfGFXghC8lTdOyG8LK+aSzpcShJzyXGvrYynWVDf7YR4GD7+xbXW+ickYwkiDrhw
	CLOtbWjCTahdCqKlpI8/gx+75NiKF/RNrE+aTQRVUWZYxU0CPrX8hFgiE/3l0C/h4qCN
	W2eQ==
Received: by 10.60.31.234 with SMTP id d10mr6829381oei.123.1352080423453;
	Sun, 04 Nov 2012 17:53:43 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.53.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:53:43 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:52:58 -0600
Message-Id: <1352080417-9792-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 03/42] libjpeg-turbo: Mimic RPROVIDES fix from meta-oe master
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
X-List-Received-Date: Mon, 05 Nov 2012 01:53:45 -0000

* Add the changes incorporated by the patch
  "libjpeg-turbo: Add RPROVIDES to fix errors when rdepending on jpeg"
  currently applied to meta-oe master.
* When the above patch is applied to the denzil branch then this commit
  can be reverted.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/jpeg/libjpeg-turbo_svn.bbappend   |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend

diff --git a/meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend b/meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend
new file mode 100644
index 0000000..08c085d
--- /dev/null
+++ b/meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend
@@ -0,0 +1,9 @@
+PRINC := "${@int(PRINC) + 1}"
+
+# Temporarily add this append which incorporates the changes of meta-oe master 
+# patch "libjpeg-turbo: Add RPROVIDES to fix errors when rdepending on jpeg"
+# commit id 662fd013adcbee8c59f4f475a11911c3267eae90.
+
+RPROVIDES_${PN}  += "jpeg"
+RREPLACES_${PN}  += "jpeg"
+RCONFLICTS_${PN} += "jpeg"
-- 
1.7.0.4


