Return-Path: <d-senicic1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 580285297F
	for <meta-arago@arago-project.org>;
	Mon, 24 Sep 2018 16:06:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8OG5uLM046683
	for <meta-arago@arago-project.org>; Mon, 24 Sep 2018 11:05:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537805156;
	bh=U+45PeCBIqd2EI+F+m4MPFlwABz5HRL24S8gayH81Is=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=csaR1M61qZhyPrw9kJwlij9T9h5qnZIfGXnTjZKWk861wNyr52VaK7EdSSqwIXpX/
	A2va+lAJdA9snJWXp2UpRNwyVFTFqTc964ylt6bjBG+qMsD//K+R2QPvSelUYaTsRA
	Sa/y6eEypcY9+6oy83x6QJbmYP3t6N4+LCBWRp3U=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8OG5uvF018341
	for <meta-arago@arago-project.org>; Mon, 24 Sep 2018 11:05:56 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 24 Sep 2018 11:05:55 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 24 Sep 2018 11:05:55 -0500
Received: from UDA0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8OG5sNY011650;
	Mon, 24 Sep 2018 11:05:55 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 24 Sep 2018 12:05:51 -0400
Message-ID: <1537805152-4059-2-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1537805152-4059-1-git-send-email-x0157990@ti.com>
References: <1537805152-4059-1-git-send-email-x0157990@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [rocko][PATCH 2/3] armnn: Add executables to the filesystem
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
X-List-Received-Date: Mon, 24 Sep 2018 16:06:04 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 meta-arago-extras/recipes-support/armnn/armnn_git.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
index 3bd4c82..726a9da 100644
--- a/meta-arago-extras/recipes-support/armnn/armnn_git.bb
+++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
@@ -27,6 +27,8 @@ DEPENDS = " \
     armnn-tensorflow \
 "
 
+RDEPENDS_${PN} = " arm-compute-library protobuf boost "
+
 EXTRA_OECMAKE=" \
     -DBUILD_SHARED_LIBS=ON -DREGISTER_INSTALL_PREFIX=OFF \
     -DARMCOMPUTE_ROOT=${STAGING_DIR_HOST}${datadir}/arm-compute-library \
@@ -39,8 +41,20 @@ EXTRA_OECMAKE=" \
     -DTHIRD_PARTY_INCLUDE_DIRS=${STAGING_DIR_HOST}${includedir} \
 "
 
+do_install_append() {
+    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
+    install -d ${D}${bindir}
+    find ${WORKDIR}/build/tests -maxdepth 1 -type f -executable -exec cp $CP_ARGS {} ${D}${bindir} \;
+    cp $CP_ARGS ${WORKDIR}/build/UnitTests  ${D}${bindir}
+    chrpath -d ${D}${bindir}/*
+}
+
 CXXFLAGS += "-fopenmp"
 LIBS += "-larmpl_lp64_mp"
 
+SOLIBS = ".so"
+FILES_SOLIBSDEV = ""
+FILES_${PN} += "{bindir}/*"
+FILES_${PN} += "{libdir}/*"
 FILES_${PN}-dev += "{libdir}/cmake/*"
 INSANE_SKIP_${PN}-dev = "dev-elf"
-- 
1.9.1


