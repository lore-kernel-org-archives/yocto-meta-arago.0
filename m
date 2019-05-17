Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id CD5E752A17
	for <meta-arago@arago-project.org>;
	Fri, 17 May 2019 00:59:32 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4H0x1vl100758
	for <meta-arago@arago-project.org>; Thu, 16 May 2019 19:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1558054741;
	bh=jPOoqa7k8p8KgyEeYB1uiPQNDl0JFJM1fVrXS2yggAA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aV6aHtZdA07dYqM3DUYLqVE4B3ylaugtzgx4jpYaDCCLG3eOwdPQ365PzpcrBJQyK
	ZlSYrmyV6U482KaaQIITmImi0YXgBteWQ71FbwKdD4ZpqYsOfqMxbyyuZ/Heh/GjZV
	jiV50g9M1gKgtgwbIlLJ/lxeok92O59ohJ2HoUOY=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4H0x1dQ119815
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 16 May 2019 19:59:01 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 16 May 2019 19:59:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 16 May 2019 19:59:01 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4H0x0lY130902;
	Thu, 16 May 2019 19:59:01 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 17 May 2019 00:47:37 +0000
Message-ID: <20190517004737.16209-2-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517004737.16209-1-denys@ti.com>
References: <20190517004737.16209-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/2] external-arm-toolchain: install ldconfig binary and default ld.so.conf configuration
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
X-List-Received-Date: Fri, 17 May 2019 00:59:33 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/external-arm-toolchain.bbappend        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
index 5cbeedfc..34daa032 100644
--- a/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
+++ b/meta-arago-extras/recipes-core/meta/external-arm-toolchain.bbappend
@@ -1,6 +1,11 @@
 ORIG_TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET_OS'), ''][d.getVar('TARGET_OS') == ('' or 'custom')]}"
 
 do_install_append() {
+	install -d ${D}${base_sbindir}
+	cp -a ${TOOLCHAIN_PATH}/${EAT_TARGET_SYS}/libc/${base_sbindir}/ldconfig ${D}${base_sbindir}/
+	install -d ${D}${sysconfdir}
+	echo -e "/lib\n/usr/lib" >> ${D}${sysconfdir}/ld.so.conf
+
 	if [ ${EAT_TARGET_SYS} != ${ORIG_TARGET_SYS} ]; then
 		ln -sf ${EAT_TARGET_SYS} ${D}${libdir}/${ORIG_TARGET_SYS}
 		ln -sf ${EAT_TARGET_SYS} ${D}${includedir}/c++/${EAT_VER_GCC}/${ORIG_TARGET_SYS}
-- 
2.17.1


