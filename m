Return-Path: <nm@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id EA876529A2
	for <meta-arago@arago-project.org>;
	Tue, 16 Mar 2021 17:08:43 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12GH90qX050171;
	Tue, 16 Mar 2021 12:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615914540;
	bh=5UuKsfozBR/NlL+AFxAW+z5ICYja1Q4VN6vRLyh281g=;
	h=From:To:CC:Subject:Date;
	b=JNaBGTMNqFFNf9Hsnivdr2m0q3vtlGnGKoylP+d+MX4nVwrxB42Dho8kO/gfPUtR6
	9aHx6cp3n38N7ps74DuEY4LjA4hHl+ZfKWCpdDia+xVCT2ujxeBUb6HUzb4ArgAOZJ
	XlUqJkelpw35kh+Id01WYF0boWBFIRWMSB0GlQiA=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12GH90Dd108249
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Mar 2021 12:09:00 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 16 Mar 2021 12:08:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 16 Mar 2021 12:09:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12GH8xjw006755;
	Tue, 16 Mar 2021 12:08:59 -0500
From: Nishanth Menon <nm@ti.com>
To: <praneeth@ti.com>, <denis@denix.org>
Date: Tue, 16 Mar 2021 12:08:55 -0500
Message-ID: <20210316170857.9547-1-nm@ti.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b814c1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [oe-layersetup][PATCH 0/2] arago-dunfell/dunfell-next: Move to
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
X-List-Received-Date: Tue, 16 Mar 2021 17:08:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hi,

Series of patches to get ourselves synced with the latest
dunfell to pick up fixes from upstream - esp around thinprovisioning and
dropping our internal version of the fix for mariadb.

This brings arago-config and arago-next-config both in sync with latest
dunfell and dunfell-next tips appropriately.

This series obviously will need to be followed up at an appropriate time
with a stable commit sha patch to pin things up.

Nishanth Menon (2):
  Revert "arago-dunfell-next: Temporarily redirect meta-openembedded"
  Revert "arago-dunfell: Pin all layers to last known good build SHA"

 configs/arago-dunfell-config.txt      | 8 ++++----
 configs/arago-dunfell-next-config.txt | 3 +--
 2 files changed, 5 insertions(+), 6 deletions(-)

-- 
2.25.1.377.g2d2118b814c1


