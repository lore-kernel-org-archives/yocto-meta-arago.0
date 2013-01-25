Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by arago-project.org (Postfix) with ESMTPS id B1C66529AA
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:28 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id k14so247969oag.39
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=xBDizIRljjpEjbExuGoWKvJMO7VxQz4v1AI2TvFINfc=;
	b=Ux1ShW21L+35bFLbkgt2vJ17vo0sfk8E9U/SZw56m0fH7Y83FigrUmQe22ovnCevsV
	Co1lmPRCRsQuUva5dmNJUyGhmCAUWyswBLtXV6mwvgnADWxLMQmCGD92j8x58r8HXR1n
	NrFQSPkgm4wipenwwWTilewo7PXDPE1v6Qqm9y+kUkWQW5ksaW9dMtEzUzusd5eeSKYY
	PtU1yxs5xaXQPjN8zcKx72nZYdXU3AYVa0q6ISBeyNR2ArtVjcmBwk5IWMY0tH0rbbCc
	7vQxDXt8YiY7WtDIEvnmpor42OmHE1wNa1NahT8aVPY18aRADomgabepZBfXESo/VwFv
	KLJQ==
X-Received: by 10.60.7.67 with SMTP id h3mr5636413oea.31.1359151108116;
	Fri, 25 Jan 2013 13:58:28 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.26
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:27 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:53:57 -0600
Message-Id: <1359150851-23602-16-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 17/31] am33x-cm3: Update to latest firmware
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:28 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Update to the latest version of am33x-cm3 firmware.
* This version corresponds to the official PSP drop v04.06.00.09

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-bsp/am335x-cm3/am33x-cm3_git.bbappend  |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/am335x-cm3/am33x-cm3_git.bbappend

diff --git a/meta-arago-distro/recipes-bsp/am335x-cm3/am33x-cm3_git.bbappend b/meta-arago-distro/recipes-bsp/am335x-cm3/am33x-cm3_git.bbappend
new file mode 100644
index 0000000..61547e3
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/am335x-cm3/am33x-cm3_git.bbappend
@@ -0,0 +1,10 @@
+PR_append = "-arago0"
+
+PV = "05.06.00.00"
+
+BRANCH = "master"
+
+#This SRCREV corresponds to tag AM335xPSP_04.06.00.09-rc
+SRCREV = "7c6075f28d9fdd633175cdbd8dc287613ce92e5d"
+
+SRC_URI = "git://arago-project.org/git/projects/am33x-cm3.git;protocol=git;branch=${BRANCH}"
-- 
1.7.0.4


