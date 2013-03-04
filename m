Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by arago-project.org (Postfix) with ESMTPS id 8385A52AC5
	for <meta-arago@arago-project.org>;
	Mon,  4 Mar 2013 20:01:43 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id dn14so2104850obc.4
	for <meta-arago@arago-project.org>;
	Mon, 04 Mar 2013 12:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=/Ul+mS2Mwon/g7lcst+PfJ8Gs8sdXoWU6uVJW7MiGss=;
	b=uHJgG36ZhmOdfDFBNAy0DxW4/Q+rLZUzcljRvdMCsLl4FTuTHWPvjNmcWYl8mKtERR
	Heds9whqwABVOxlDDjg6mxIfPxChXJ2A6GH9PS5raHxdGX8E+OI9NndU6bvS0dZXbRNu
	rRXqnQmG2Hh+oIOx/+mbgUhNMMojOGLhTgs8ZtCMCDohCumqBUZtL1yi5C5k4OQeFvz4
	uj//6MPsdBM/N89FspPw8Buzo4tzfmJe3ZksR6Sp5iStkyTPT/gojLMXLJ8wAJQnE1qp
	sT7K+Gd8aOrCTZkkKRaBcS8Qwhb3vgsLBgtUph4uukG9FZqjmmQjz05UPgg6L1B4/Yx3
	o9TA==
X-Received: by 10.60.169.114 with SMTP id ad18mr17207934oec.105.1362427302959; 
	Mon, 04 Mar 2013 12:01:42 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id j4sm31153357oea.3.2013.03.04.12.01.40
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 12:01:41 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon,  4 Mar 2013 14:01:23 -0600
Message-Id: <1362427289-18057-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1362427289-18057-1-git-send-email-fcooper@ti.com>
References: <1362427289-18057-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 04/10] u-boot_2012.04.01: Set variables for sourceipk
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
X-List-Received-Date: Mon, 04 Mar 2013 20:01:43 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

---
 .../recipes-bsp/u-boot/u-boot_2012.04.01.bbappend  |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.04.01.bbappend

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.04.01.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.04.01.bbappend
new file mode 100644
index 0000000..580d8dc
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.04.01.bbappend
@@ -0,0 +1,4 @@
+PR_append = "-arago0"
+
+UVER = "2012.04.01"
+PSPREL = "mainline"
-- 
1.7.0.4


