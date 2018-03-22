Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id EA106529BD
	for <meta-arago@arago-project.org>;
	Thu, 22 Mar 2018 14:08:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2ME8Ma8027729
	for <meta-arago@arago-project.org>; Thu, 22 Mar 2018 09:08:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521727702;
	bh=wCtmLKDgeG5+dJjA4N3C9B1eI/MHWHZq3+wbITBz974=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GEMesXM0S1wyHzzPyThzHWWFiF6Y2gEUwzzXtEf9EO5xUsR+nuLERhwGQC69NF7l5
	s9QSkY8adqFQfO1a47iupriIadM9PiHC8VsbmcOCQOZ5PsRcOuO0xMDDIUmNJCmmxJ
	P/3AGngyzWPk5k/p1Ga6vxA9SYIaBKP6JcjrHu/o=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2ME8M9b024258
	for <meta-arago@arago-project.org>; Thu, 22 Mar 2018 09:08:22 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 22 Mar 2018 09:08:21 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 22 Mar 2018 09:08:21 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2ME8LGx014397;
	Thu, 22 Mar 2018 09:08:21 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Mar 2018 09:58:09 -0400
Message-ID: <1521727089-14554-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521727089-14554-1-git-send-email-j-stiffler@ti.com>
References: <1521727089-14554-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH 2/2] linuxptp: update to latest TI fork
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
X-List-Received-Date: Thu, 22 Mar 2018 14:08:23 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../linuxptp/change-pr_warn-to-pr_warning.patch      | 20 ++++++++++++++++++++
 recipes-connectivity/linuxptp/linuxptp_%.bbappend    |  9 ++++++---
 2 files changed, 26 insertions(+), 3 deletions(-)
 create mode 100644 recipes-connectivity/linuxptp/linuxptp/change-pr_warn-to-pr_warning.patch

diff --git a/recipes-connectivity/linuxptp/linuxptp/change-pr_warn-to-pr_warning.patch b/recipes-connectivity/linuxptp/linuxptp/change-pr_warn-to-pr_warning.patch
new file mode 100644
index 0000000..faa19ff
--- /dev/null
+++ b/recipes-connectivity/linuxptp/linuxptp/change-pr_warn-to-pr_warning.patch
@@ -0,0 +1,20 @@
+diff --git a/phc2sys.c b/phc2sys.c
+index e3aec67..9a36668 100644
+--- a/phc2sys.c
++++ b/phc2sys.c
+@@ -607,13 +607,13 @@ static void enable_pps_output(clockid_t src, int enable)
+ static void set_pps_offset(clockid_t src, int offset)
+ {
+ 	if (!phc_has_pps(src)) {
+-		pr_warn("src clk %d does not have pps", src);
++		pr_warning("src clk %d does not have pps", src);
+ 		return;
+ 	}
+ 
+ 	pr_info("set_pps_offset(%d): offset = %d", src, offset);
+ 	if (ioctl(CLOCKID_TO_FD(src), PTP_PPS_OFFSET, offset) < 0)
+-		pr_warn("failed to set PPS offset");
++		pr_warning("failed to set PPS offset");
+ }
+ 
+ static int read_pps(int fd, int64_t *offset, uint64_t *ts)
diff --git a/recipes-connectivity/linuxptp/linuxptp_%.bbappend b/recipes-connectivity/linuxptp/linuxptp_%.bbappend
index 5990e08..3637427 100644
--- a/recipes-connectivity/linuxptp/linuxptp_%.bbappend
+++ b/recipes-connectivity/linuxptp/linuxptp_%.bbappend
@@ -1,11 +1,14 @@
-PR_append = ".tisdk1"
+PR_append = ".tisdk2"
 PV = "1.8+"
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
 BRANCH = "ti-linuxptp-release"
 SRC_URI = "git://git.ti.com/processor-sdk/linuxptp.git;protocol=git;branch=${BRANCH} \
-           file://build-Allow-CC-and-prefix-to-be-overriden.patch"
+           file://build-Allow-CC-and-prefix-to-be-overriden.patch \
+           file://change-pr_warn-to-pr_warning.patch"
 
-SRCREV = "15de3319fadb0c49b085cb7ea83ca5ecd398f75a"
+SRCREV = "19abd3664ded04f57e7d3a0daf9831cc373715f7"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


