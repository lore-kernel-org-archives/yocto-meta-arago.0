Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 189C95299C
	for <meta-arago@arago-project.org>;
	Tue,  4 Aug 2015 22:35:35 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSK00J77XEHMED0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 04 Aug 2015 17:35:06 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8 a=Q4-j1AaZAAAA:8	a=ZxaVwV8xPAGNn8RLlAcA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BB597161B2F;	Tue,
	4 Aug 2015 18:35:05 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 04 Aug 2015 18:35:05 -0400
Message-id: <1438727705-20198-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] arago.conf: add tar.gz.md5 image type to store image checksums
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
X-List-Received-Date: Tue, 04 Aug 2015 22:35:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/image_types_md5.bbclass | 5 +++++
 meta-arago-distro/conf/distro/arago.conf          | 3 +++
 2 files changed, 8 insertions(+)
 create mode 100644 meta-arago-distro/classes/image_types_md5.bbclass

diff --git a/meta-arago-distro/classes/image_types_md5.bbclass b/meta-arago-distro/classes/image_types_md5.bbclass
new file mode 100644
index 0000000..dfae60d
--- /dev/null
+++ b/meta-arago-distro/classes/image_types_md5.bbclass
@@ -0,0 +1,5 @@
+inherit image_types
+
+COMPRESSIONTYPES += "gz.md5"
+COMPRESS_CMD_gz.md5 = "md5sum ${IMAGE_NAME}.rootfs.${type}.gz > ${IMAGE_NAME}.rootfs.${type}.gz.md5"
+IMAGE_TYPES += "tar.gz.md5"
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 89e8319..5e24476 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -12,6 +12,9 @@ SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_VERSION}"
 SDKPATH_REAL = "/usr/local/${SDK_NAME_PREFIX}-${SDK_VERSION}"
 SDKPATH = "${@"/tmp/"+"x"*96+"/"+"y"*96}"
 
+IMAGE_CLASSES += "image_types_md5"
+IMAGE_FSTYPES += "tar.gz.md5"
+
 # Daisy has a syntax error in lib/oe/sdk.py, use workaround for now
 # http://cgit.openembedded.org/openembedded-core/commit/?id=81b3cc448f040dcb4c2f2b05983231ac53270663
 IPKGCONF_Target = "${IPKGCONF_TARGET}"
-- 
2.2.0


