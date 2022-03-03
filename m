Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.7458.1646281897022025385
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 20:31:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Z3PoRsc6;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2234VZZl017273;
	Wed, 2 Mar 2022 22:31:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646281895;
	bh=Jukbcz26jDPAeGlUiubWWPPaLQIQL1xgV+M8I7a3uB4=;
	h=From:To:Subject:Date;
	b=Z3PoRsc6JJ3IyUPYdqmYcC75IjmbhB0nGRPHBwNrEtE2KeCWgJ0ex+vISvuQ8Ydui
	 MUacGeiKsnHD40IRvy6F5tr8F9QwPKwwrpHCmtUl4mlZ1iYiU6yFiqywMa9w9wv1Z+
	 tMFZ2jHCXBlW6+VJTDkmF1h7MVlqufSDHS/NLSzU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2234VZL6045840
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Mar 2022 22:31:35 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Mar 2022 22:31:34 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Mar 2022 22:31:34 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2234VYX7041520;
	Wed, 2 Mar 2022 22:31:34 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nPd7k-00066e-4G; Wed, 02 Mar 2022 22:31:32 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH 0/2] update optee-client and
Date: Wed, 2 Mar 2022 22:31:30 -0600
Message-ID: <20220303043132.13539-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update the optee-client and optee-test recipes to use 3.12.0.

Ryan Eatmon (2):
  optee-client: update to 3.12.0
  optee-test: update to 3.12.0

 .../recipes-security/optee/optee-client_git.bbappend       | 7 +++++++
 .../recipes-security/optee/optee-test_git.bbappend         | 7 +++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta-arago-distro/recipes-security/optee/optee-client_git.bbappend
 create mode 100644 meta-arago-distro/recipes-security/optee/optee-test_git.bbappend

-- 
2.17.1

