Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.7640.1646281897007218233
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 20:31:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TDzgYhh1;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2234VZs8037615;
	Wed, 2 Mar 2022 22:31:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646281895;
	bh=ylKDcrVkv8KI1Hh4rxY+ruJdo0ZpavbUt5/yrvsbmCY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=TDzgYhh1mGQQcM2rY1Nym+6g+eQmU9fCs3VA4EBpTyDeVO/OvGze5GvVvwcLmzHRo
	 aJ0EOo2gRktLak1EVWDQ38q2qAW13Bf5cdG1wCN6uB+zYSBmQidA/yguVuUrO+FCsH
	 fecjndOMHL7eOJ8yab4ThuJZAoFGxGidjcz/35L4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2234VZ6f078177
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Mar 2022 22:31:35 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Mar 2022 22:31:35 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Mar 2022 22:31:35 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2234VZkS107213;
	Wed, 2 Mar 2022 22:31:35 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nPd7l-0006Cm-Iw; Wed, 02 Mar 2022 22:31:34 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH 1/2] optee-client: update to 3.12.0
Date: Wed, 2 Mar 2022 22:31:31 -0600
Message-ID: <20220303043132.13539-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303043132.13539-1-reatmon@ti.com>
References: <20220303043132.13539-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-security/optee/optee-client_git.bbappend       | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-arago-distro/recipes-security/optee/optee-client_git.bbappend

diff --git a/meta-arago-distro/recipes-security/optee/optee-client_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-client_git.bbappend
new file mode 100644
index 00000000..a9cb5898
--- /dev/null
+++ b/meta-arago-distro/recipes-security/optee/optee-client_git.bbappend
@@ -0,0 +1,7 @@
+
+PR_append = ".arago0"
+
+PV = "3.12.0+git${SRCPV}"
+
+SRCREV = "347144b79964233e718347e3f0fbe89ab5be46ae"
+
-- 
2.17.1

