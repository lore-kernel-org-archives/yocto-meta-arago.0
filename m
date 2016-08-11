Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 87FD752A87
	for <meta-arago@arago-project.org>;
	Thu, 11 Aug 2016 13:37:36 +0000 (UTC)
Received: from vz-proxy-m006.mx.aol.com ([64.236.83.10])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OBQ00799Z689080@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 11 Aug 2016 08:37:21 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=pKq81LsWol7b8sI3Hpopew==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=h2TpYsvnISjjBNbPeboA:9
Received: by 100.15.86.14 with SMTP id 743a927f; Thu, 11 Aug 2016 13:37:21 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 7451C1620E5;	Thu, 11 Aug 2016 09:37:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 11 Aug 2016 09:37:19 -0400
Message-id: <1470922639-29422-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] arago.conf: finalize switch to tar.xz images
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
X-List-Received-Date: Thu, 11 Aug 2016 13:37:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 2888405..36a8a39 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -20,7 +20,7 @@ SDKPATH_REAL = "/usr/local/${SDK_NAME_PREFIX}-${SDK_VERSION}"
 SDKPATH = "${@"/tmp/"+"x"*96+"/"+"y"*96}"
 
 IMAGE_CLASSES += "image_types_md5"
-IMAGE_FSTYPES += "tar.gz.md5 tar.xz.md5"
+IMAGE_FSTYPES += "tar.xz.md5"
 
 # Mask any broken recipes (currently none)
 #BBMASK = ""
-- 
2.7.4


