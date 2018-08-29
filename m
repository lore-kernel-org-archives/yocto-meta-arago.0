Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id E342B52A52
	for <meta-arago@arago-project.org>;
	Wed, 29 Aug 2018 00:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 50E8520C5A;
	Wed, 29 Aug 2018 00:14:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id cS6eLSSDFh1R; Wed, 29 Aug 2018 00:14:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 38511207AB;
	Wed, 29 Aug 2018 00:14:05 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 92C401635E4;
	Tue, 28 Aug 2018 20:14:03 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 28 Aug 2018 20:14:00 -0400
Message-Id: <1535501640-23640-7-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535501640-23640-1-git-send-email-denys@ti.com>
References: <1535501640-23640-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 7/7] thttpd: add dependency on virtual/crypt
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
X-List-Received-Date: Wed, 29 Aug 2018 00:14:16 -0000

Required with glibc 2.28+ where crypt is no longer part of glibc.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-extended/thttpd/thttpd_2.28.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-extended/thttpd/thttpd_2.28.bb b/meta-arago-extras/recipes-extended/thttpd/thttpd_2.28.bb
index 0477509..741e1bd 100644
--- a/meta-arago-extras/recipes-extended/thttpd/thttpd_2.28.bb
+++ b/meta-arago-extras/recipes-extended/thttpd/thttpd_2.28.bb
@@ -6,6 +6,8 @@ LICENSE = "BSD"
 HOMEPAGE = "http://www.acme.com/software/thttpd/"
 PR ="r0"
 
+DEPENDS += "virtual/crypt"
+
 LIC_FILES_CHKSUM = "file://thttpd.c;beginline=1;endline=26;md5=525c6428ecff95f4e71d5b3c88a34fff"
 SRC_URI = "http://www.acme.com/software/thttpd/thttpd-${PV}.tar.gz \
 	   file://install.patch \
-- 
2.7.4


