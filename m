Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 424FF52A34
	for <meta-arago@arago-project.org>;
	Fri,  9 Jul 2021 18:03:58 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 169I44Ld107442;
	Fri, 9 Jul 2021 13:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625853844;
	bh=3nSXdrQWmljBd7ynU3tEQrvVUSKbPa1kW88ZUo53EIw=;
	h=From:To:CC:Subject:Date;
	b=tnn4TS0w9y6gfNsj9V+8SICYYvuVU6E3hXmiYqP4aMRiXkutH/q8FtSb16Pysk3O/
	k2H7MSz/3JtWn7Y6d5dPrsOrIWIchGQ/0EnfXsgxZx6twS2HUHWqfTCpjIE5dYCANh
	4yeT1UUGrVLGy1P+dXLSo84pfupIS3giwzgR3sII=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 169I447E083496
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jul 2021 13:04:04 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 9 Jul 2021 13:04:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 9 Jul 2021 13:04:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 169I43DH066557;
	Fri, 9 Jul 2021 13:04:03 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <praneeth@ti.com>, <yogeshs@ti.com>
Date: Fri, 9 Jul 2021 13:03:56 -0500
Message-ID: <20210709180401.2977-1-nm@ti.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [tisdk-build-scripts PATCH 0/5] config-build-env: Switch to arago-project git
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
X-List-Received-Date: Fri, 09 Jul 2021 18:03:59 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Here are a series of patches that are meant to:
a) be more paranoid in checking the environment it runs in
b) additional cleanups in case of weird corner cases where build folder
   is left in weird state
c) Finally switch over to git.ti.com tree instead of arago-project.org
   tree for the new location of oe-layer-setup

Nishanth Menon (5):
  config-build-env: Move the oe-layer-setup to a variable
  config-build-env: Lets make sure we are really in a build folder
  config-build-env: Refactor to cleanup messed up build folder
  config-build-env: Make sure that the git url points correctly
  config-build-env: Switch arago-project git repo to ti git repo

 lib/oesdk/config-build-env | 46 +++++++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 10 deletions(-)

-- 
2.32.0


