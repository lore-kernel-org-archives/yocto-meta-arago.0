Return-Path: <x0038811@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 2243352978
	for <meta-arago@arago-project.org>;
	Tue, 12 Jun 2018 04:45:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5C4jGEX000846
	for <meta-arago@arago-project.org>; Mon, 11 Jun 2018 23:45:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528778716;
	bh=Pwy/Qst62XHUixfOGy+6Z3GCmaGmwzVcjqoDRutvs9s=;
	h=From:To:CC:Subject:Date;
	b=Xb7K9N8hTDU1S0/kVIwwUkwQTL9c8K0LX72fNvmoNNdKUkokLGm/YeRgvd4Fsh6HW
	a2PVzJ8N2lxbmkOQElRwxgaAqmZSMPFTIM4LKtf0sHNgvk0N5o1DKGXBmfJnOrEPmP
	T5C5InSZD1VRUpgvh8ztnw+acdmW11a5T1KK9oQk=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5C4jG2D005348
	for <meta-arago@arago-project.org>; Mon, 11 Jun 2018 23:45:16 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 11 Jun 2018 23:45:16 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 11 Jun 2018 23:45:16 -0500
Received: from udx0038811.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5C4jEKt015281;
	Mon, 11 Jun 2018 23:45:15 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 12 Jun 2018 10:15:08 +0530
Message-ID: <1528778710-2395-1-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko V2 0/2] gstreamer 1.12 patches
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
X-List-Received-Date: Tue, 12 Jun 2018 04:45:23 -0000
Content-Type: text/plain

Update SRCREV of gst-vpe and gst-ducati with latest commits

Ramprasad N (2):
  gstvpe: Bump SRCREV with latest fixes
  gst-ducati: Update SRCREV with latest commit

 .../gstreamer1.0-plugins-ducati_git.bb             |  4 +--
 ...late-the-output-structure-with-progressiv.patch | 33 ----------------------
 .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb |  5 ++--
 3 files changed, 4 insertions(+), 38 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/0001-gstvpe-Populate-the-output-structure-with-progressiv.patch

-- 
1.9.1


