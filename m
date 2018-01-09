Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 9719A52093
	for <meta-arago@arago-project.org>;
	Tue,  9 Jan 2018 21:48:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w09Lmlij018449
	for <meta-arago@arago-project.org>; Tue, 9 Jan 2018 15:48:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1515534527;
	bh=1aIc4aNJ6J4fw0VXLjRN1C+JV12d3Z2a01fmuVDDGl4=;
	h=From:To:CC:Subject:Date;
	b=dyPLxmO/fW9O9C8oRYJLek6DivA6IF6vauSiNcLjPfOXY/STCEh2NiXJQhRwuKTZn
	4Pl9XUKfbzkXO2lCZ7YDeLnUQ0n3TkVuXZtjSIpnoB/68gjH6RcxXU7BoQAO1I1mKB
	WELqvCbBpAIFv0pWLInKmdivuuOGalTYpkp5S8Uw=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w09Lml7q027151
	for <meta-arago@arago-project.org>; Tue, 9 Jan 2018 15:48:47 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 9 Jan 2018 15:48:46 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 9 Jan 2018 15:48:46 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w09LmkRW011305;
	Tue, 9 Jan 2018 15:48:46 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 9 Jan 2018 16:48:39 -0500
Message-ID: <1515534524-21325-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 0/5] Update/remove recipes which have been upstreamed to meta-arago
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
X-List-Received-Date: Tue, 09 Jan 2018 21:48:55 -0000
Content-Type: text/plain

Hongmei Gou (5):
  ccief-basic: upstreamed to meta-arago
  packagegroup-arago-tisdk-matrix: remove audiocapture demo for AM4 and
    AM5
  packagegroup-arago-tisdk-addons*: remove cmem and cmem-mod for AM4
  packagegroup-arago-test-addons: remove cmem-test for AM4
  ti-tisdk-makefile: remove cmem-mod for AM4

 recipes-core/packagegroups/packagegroup-arago-test-addons.bbappend | 6 +-----
 .../packagegroup-arago-tisdk-addons-sdk-host.bbappend              | 6 +-----
 .../packagegroup-arago-tisdk-addons-sdk-target.bbappend            | 7 +------
 .../packagegroups/packagegroup-arago-tisdk-addons.bbappend         | 6 +-----
 .../packagegroups/packagegroup-arago-tisdk-matrix.bbappend         | 7 +------
 recipes-support/cclink/ccief-basic_git.bbappend                    | 3 ---
 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend     | 6 ++----
 7 files changed, 7 insertions(+), 34 deletions(-)
 delete mode 100644 recipes-support/cclink/ccief-basic_git.bbappend

-- 
1.9.1


