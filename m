Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 147FD52970
	for <meta-arago@arago-project.org>;
	Fri, 13 Sep 2019 03:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E14D340BF9;
	Fri, 13 Sep 2019 03:11:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id e4yCti4Nj54P; Fri, 13 Sep 2019 03:11:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CC26040C04;
	Fri, 13 Sep 2019 03:11:29 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 819FC17422A;
	Thu, 12 Sep 2019 23:11:29 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Sep 2019 23:11:23 -0400
Message-Id: <1568344286-30548-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568344286-30548-1-git-send-email-denys@ti.com>
References: <1568344286-30548-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 3/6] HACK: packagegroup-*-opencl: disable ti-fftw for now
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
X-List-Received-Date: Fri, 13 Sep 2019 03:12:38 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
index dfd8555..c1ef8ae 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
@@ -19,16 +19,16 @@ EXTRA_PKGS = " \
     python-pyopencl \
 "
 
+#    ti-fftw-examples
 EXTRA_PKGS_append_k2hk = " \
     linalg-examples \
-    ti-fftw-examples \
 "
 
+#    ti-fftw-examples
 EXTRA_PKGS_append_dra7xx = " \
     linalg-examples \
     opencl-examples \
     kaldi \
-    ti-fftw-examples \
 "
 
 RDEPENDS_${PN} = "\
-- 
2.7.4


