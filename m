Return-Path: <vigneshr@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 687085297D
	for <meta-arago@arago-project.org>;
	Tue,  8 Sep 2020 07:31:46 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0887SqYK061215
	for <meta-arago@arago-project.org>; Tue, 8 Sep 2020 02:28:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1599550132;
	bh=znOPP1P1OdtAPLH7rn4Qwx4IHjA+Hia0eQFJYdshy24=;
	h=From:To:CC:Subject:Date;
	b=NIP81KRQ8eJlqeCLHFlIBlcFlkr0aO6hpKPAWGR96yJ9ZIR+ElXZ/eG7+NYVnntV4
	zUVn4UWZhqf9CNM3X06pJY4aewHel48EMpQ5Vo9QjxubT/ErY4C4OYgElCsnkbL/9B
	o4xvLRF4jlOADV9+mp0425GyrWtgZkjMUmm4fN5o=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0887SqxT112157
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 8 Sep 2020 02:28:52 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 8 Sep 2020 02:28:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 8 Sep 2020 02:28:52 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0887SiAP114454;
	Tue, 8 Sep 2020 02:28:46 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 8 Sep 2020 12:58:02 +0530
Message-ID: <20200908072802.5682-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
	m-erdahl@ti.com, Roger Quadros <rogerq@ti.com>
Subject: [PATCH] mstpd: Remove python2 dependency
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
X-List-Received-Date: Tue, 08 Sep 2020 07:31:46 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

It looks like ifquery tool under mstpd/utils is the only python script
and the script is python3 compatible. See:
https://github.com/mstpd/mstpd/commit/53d35f49502fb453d5b24a8971b86fa19702113e
for more details

Therefore remove python2 dependency by replacing the shebang in
do_compile_prepend()

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb | 2 +-
 meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb  | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 5dcefea6..b9a5965b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -30,7 +30,7 @@ ARAGO_TEST = "\
     procps \
     mtd-utils-ubifs-tests \
     pcitest \
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "mstpd", "", d)} \
+    mstpd \
     fio \
     git \
 "
diff --git a/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb b/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
index db8f08c4..2bac72f3 100644
--- a/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
+++ b/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
@@ -12,14 +12,13 @@ SRCREV = "e4f0ba5a48649a3253f8b353c87c965e12aafc50"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "python"
-RDEPENDS_${PN} = "python-core"
+DEPENDS = "python3"
+RDEPENDS_${PN} = "python3-core"
 
 inherit autotools
 
 EXTRA_OECONF = "--sbindir=/sbin"
 
-python() {
-    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
-        raise bb.parse.SkipRecipe('Requires meta-python2 to be present.')
+do_configure_prepend() {
+	 sed -i -e "s,#!.*python.*,#!${USRBINPATH}/env python3," ${S}/utils/ifquery
 }
-- 
2.28.0


