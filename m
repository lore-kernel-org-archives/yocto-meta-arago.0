Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 242B05298A
	for <meta-arago@arago-project.org>;
	Mon, 19 Aug 2019 22:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4F9EA40BE8;
	Mon, 19 Aug 2019 22:21:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 24xhvpTHipz2; Mon, 19 Aug 2019 22:21:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3474C40BC0;
	Mon, 19 Aug 2019 22:21:31 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id E1174172E7B;
	Mon, 19 Aug 2019 18:21:30 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 19 Aug 2019 18:21:29 -0400
Message-Id: <1566253290-51048-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH 1/2] tidl-utils: fix LICENSE field
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
X-List-Received-Date: Mon, 19 Aug 2019 22:22:33 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
index b7c9d7a..ad1dad1 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-import_git.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "TIDL import tool is using protobuf to read and parse information
 
 require ./tidl-utils.inc
 
-LICENSE = "BSD-3"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://modules/ti_dl/inc/itidl_ti.h;beginline=1;endline=34;md5=cabe1fdaabfa0d85dc5544566b0e2425"
 
 S = "${WORKDIR}/git/src/importTool/"
-- 
2.7.4


