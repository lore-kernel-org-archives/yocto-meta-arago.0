Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by arago-project.org (Postfix) with ESMTPS id 65D2652AC2
	for <meta-arago@arago-project.org>;
	Mon,  4 Mar 2013 20:01:41 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id o6so9840815oag.32
	for <meta-arago@arago-project.org>;
	Mon, 04 Mar 2013 12:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=zd2NVcZK5t9cmyTZtMxEMowb/HodJ4ZgQaAOCaus+6M=;
	b=eJJ4UebKyZyIxU5wpxunhVEWhqaXIPnxQ4jvhRdsCeERo7WVBMwOxa6xzIoTQIJUke
	tbuVXbThmhSFtUsgTIxc9yUFdqPgVBmY00V+BIi2/P9Ek41R8Ik2TGMgPzp3PIVRpFGP
	RpIi/0JbxKkSQYD9IKwe8apXSaATweLMr3Mmmrm/r0L7ZbHE5eg/l16XzFN4NKXPWJCg
	ke4VlArkdGYvJW3ZO4hipgv2lSRn/ToE4CP+hHMnzDbE4iLfYHfjATbRgdx/gf/HMe37
	ArUQ9Q4+s+zBbQ5JKrRT77ntZ69YkAOSaEjDoEWNTsnx1izdkoLrfqxNeLoyQYFmCD0+
	ZYnw==
X-Received: by 10.182.86.162 with SMTP id q2mr17090831obz.35.1362427300791;
	Mon, 04 Mar 2013 12:01:40 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id j4sm31153357oea.3.2013.03.04.12.01.38
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 12:01:39 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon,  4 Mar 2013 14:01:22 -0600
Message-Id: <1362427289-18057-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1362427289-18057-1-git-send-email-fcooper@ti.com>
References: <1362427289-18057-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 03/10] u-boot_2010.12-psp03.21.00.04.sdk: Set sourceipk variables
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
X-List-Received-Date: Mon, 04 Mar 2013 20:01:41 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../u-boot_2010.12-psp03.21.00.04.sdk.bbappend     |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot_2010.12-psp03.21.00.04.sdk.bbappend

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2010.12-psp03.21.00.04.sdk.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2010.12-psp03.21.00.04.sdk.bbappend
new file mode 100644
index 0000000..06a69a0
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2010.12-psp03.21.00.04.sdk.bbappend
@@ -0,0 +1,5 @@
+PR_append = "-arago0"
+
+# PSPREL and UVER are used by arago-source-ipk.conf
+UVER = "2010.12"
+PSPREL = "03.21.00.04.sdk"
-- 
1.7.0.4


