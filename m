Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.7468.1646282079615360888
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 20:34:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Y5Za9waw;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2234YaXd061255;
	Wed, 2 Mar 2022 22:34:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646282076;
	bh=87fFYg6+bV5p4ujdbX+Rb66iTUxdEENeGM6IDN27KWw=;
	h=From:To:Subject:Date;
	b=Y5Za9wawaPNcOFTHyWcQIHAItlMDzhc7TnfHq+CYwMbYug62UMh4nT68A1ViWwPFF
	 flBR5N4EUn8iq2H75N88/sWPF/3jtbIIg/eH7VUX24+CivExVXkZIPIk99ChGoFA4R
	 OaM7HLi4jbJ+sfaQOvpmIdkYs0DyYtrMd17Wbp6A=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2234Ya4S049976
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Mar 2022 22:34:36 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Mar 2022 22:34:36 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Mar 2022 22:34:36 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2234YYLa021017;
	Wed, 2 Mar 2022 22:34:34 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nPdAf-0005sj-4N; Wed, 02 Mar 2022 22:34:33 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH v2 0/2] update optee-client and optee-test to 3.12.0
Date: Wed, 2 Mar 2022 22:34:31 -0600
Message-ID: <20220303043433.22149-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update the optee-client and optee-test recipes to use 3.12.0.

Ryan Eatmon (2):
  optee-client: update to 3.12.0
  optee-test: update to 3.12.0

Changes from v1:
  - subject of cover letter.

 .../recipes-security/optee/optee-client_git.bbappend       | 7 +++++++
 .../recipes-security/optee/optee-test_git.bbappend         | 7 +++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta-arago-distro/recipes-security/optee/optee-client_git.bbappend
 create mode 100644 meta-arago-distro/recipes-security/optee/optee-test_git.bbappend

-- 
2.17.1

