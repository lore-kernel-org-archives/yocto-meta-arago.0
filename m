Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 4E75252ABC
	for <meta-arago@arago-project.org>;
	Mon,  4 Mar 2013 20:01:39 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id h2so9683437oag.38
	for <meta-arago@arago-project.org>;
	Mon, 04 Mar 2013 12:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=nmoNw42GAnIBQlp8XyWs8pogvMEFjdqA63DLtEMECAo=;
	b=YUTaMC2JSIQdRIJKIo3ZdHdbtrREoyYDoLwnwOZ4cE0LJPwp15txBZZAjTO3WQl6Bf
	wX9cJNK/lLKhOhPzF0sxRUZytVx/n+2uMDU6dtOdpFcz0p3o0IPPgI12AdVp/SYas1/D
	VMzm0e+cJt55MuRJDNL+0KTmLvlQcwYvx0CGX1HaMQW1ibMLXeuxWJwJl+T5CRjCXgsv
	mUGS2B4drUXegDeu89/GSpLrj5iV/hDA6W9NKIz2aUipQe9EOnHUXB1rXhv3EjlfU6A7
	+rLnVMNgpphNVsItmh4IhIwDH3GwG91W1UOkiZZYaD1Xmeaeo1Kwy6WTHsdRwMQDGWUn
	U7hg==
X-Received: by 10.182.93.193 with SMTP id cw1mr16788317obb.93.1362427298766;
	Mon, 04 Mar 2013 12:01:38 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id j4sm31153357oea.3.2013.03.04.12.01.37
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 12:01:37 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon,  4 Mar 2013 14:01:21 -0600
Message-Id: <1362427289-18057-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1362427289-18057-1-git-send-email-fcooper@ti.com>
References: <1362427289-18057-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 02/10] linux-omap-psp_2.6.37: Add Arago specific appends
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
X-List-Received-Date: Mon, 04 Mar 2013 20:01:39 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Set variables used by sourceipk.
* Add include files to determine which configs to use.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../linux/linux-omap-psp_2.6.37.bbappend           |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-omap-psp_2.6.37.bbappend

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-omap-psp_2.6.37.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-omap-psp_2.6.37.bbappend
new file mode 100644
index 0000000..c4daac1
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-omap-psp_2.6.37.bbappend
@@ -0,0 +1,8 @@
+MACHINE_KERNEL_PR_append = "-arago0"
+
+# KVER is used by arago-source-ipk.conf
+KVER = "2.6.37"
+PSPREL = "04.02.00.07"
+
+require copy-defconfig.inc
+require setup-defconfig.inc
-- 
1.7.0.4


