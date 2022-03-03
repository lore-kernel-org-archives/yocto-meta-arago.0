Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.7476.1646282079649084395
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 20:34:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CT2X+JpS;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2234Ybtc061260;
	Wed, 2 Mar 2022 22:34:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646282077;
	bh=ylKDcrVkv8KI1Hh4rxY+ruJdo0ZpavbUt5/yrvsbmCY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=CT2X+JpSBZb1zznKO63uG8HZMUUqAcX/GvPtmDSDoAvXGP2jZnKVrjlTHY3PPvRE7
	 Bak+MKprv2dTtUEa4OJRvEbWc4tJp7xKjJKwEy50P7RPbfHwe2m4rC806yudX08fB2
	 I+wdvFFY1LKTh20dRw4rMYd4JNT98CrgNHIx9zNU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2234YbcS062574
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Mar 2022 22:34:37 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Mar 2022 22:34:37 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Mar 2022 22:34:36 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2234YaNe112815;
	Wed, 2 Mar 2022 22:34:36 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nPdAg-00066M-SM; Wed, 02 Mar 2022 22:34:35 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH v2 1/2] optee-client: update to 3.12.0
Date: Wed, 2 Mar 2022 22:34:32 -0600
Message-ID: <20220303043433.22149-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303043433.22149-1-reatmon@ti.com>
References: <20220303043433.22149-1-reatmon@ti.com>
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

