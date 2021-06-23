Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 7AF4752A4F
	for <meta-arago@arago-project.org>;
	Wed, 23 Jun 2021 21:43:22 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15NLhMrv018523;
	Wed, 23 Jun 2021 16:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624484602;
	bh=DWF+Z2i89lSLlET6zjdv0bcOCfNePTk4H2B6/hPBEc4=;
	h=From:To:CC:Subject:Date;
	b=ZVk6UvU5BU0zAAfi4z2IBsej/QwVukklGhUYuUKl3e4msmbEYTCWG2wk1zz31ltTZ
	UXERfpSQaIJ4bCTB0CpwnHy2e0514ClzUsYOgauSapggWB7phPq7nxDIiCw0PtHpkN
	nknwE+mahDA4j8nLcdpp5MzzMx5GowrIhonm9gTk=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15NLhMq5037345
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Jun 2021 16:43:22 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 23 Jun 2021 16:43:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 23 Jun 2021 16:43:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15NLhMk7030847;
	Wed, 23 Jun 2021 16:43:22 -0500
From: Nishanth Menon <nm@ti.com>
To: <praneeth@ti.com>, <yogeshs@ti.com>, <denis@denix.org>
Date: Wed, 23 Jun 2021 16:43:17 -0500
Message-ID: <20210623214320.9645-1-nm@ti.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [oe-layersetup PATCH V2 0/3] Lets start sunsetting arago-project.org
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
X-List-Received-Date: Wed, 23 Jun 2021 21:43:23 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hi All,

V2 of the series posted [1] - Update is patch #2 is new in the series
and replaces the previous cleanup by dropping things.

This is the first patch in the series of patches to various
repos for us to move away from arago-project.org domain name.

NOTE: we will maintain the meta-arago distro, but we move in steps
towards an integrated ecosystem in yocto project before we attempt to
close the domain name down.

NOTE:
1. I am not modifying release configs since those will need to be
   handled with a variation of url redirection of which a sample is
   provided in this series. Further updates are needed.
3. Existing git repos in arago-project.org are still kept updated, but
   once all references are redirected, we can mark the git repos in
   arago-project.org as no longer maintained.
3. If there are specific additional questions, please pop them out..
   lets discuss - also note that we will migrate the mailing list to
   yoctoproject.org once the infrastructural pieces are in place.


Nishanth Menon (3):
  sample-files: Add a URL redirection gitconfig sample file
  configs: Get rid of ancient tracking configs
  configs: arago*.txt: Revise meta-arago repo towards yoctoproject.org
    primary

 configs/arago-daisy-config.txt        | 12 ------------
 configs/arago-danny-config.txt        | 11 -----------
 configs/arago-denzil-config.txt       | 11 -----------
 configs/arago-dora-config.txt         | 12 ------------
 configs/arago-dunfell-config.txt      |  2 +-
 configs/arago-dunfell-next-config.txt |  2 +-
 configs/arago-dylan-config.txt        | 12 ------------
 configs/arago-fido-config.txt         | 12 ------------
 configs/arago-krogoth-config.txt      | 12 ------------
 configs/arago-master-config.txt       |  2 +-
 configs/arago-morty-config.txt        | 14 --------------
 configs/arago-rocko-config.txt        | 13 -------------
 configs/arago-thud-config.txt         | 15 ---------------
 configs/arago-zeus-config.txt         | 15 ---------------
 configs/arago-zeus-next-config.txt    | 15 ---------------
 configs/distroless-morty-config.txt   |  7 -------
 configs/distroless-rocko-config.txt   |  7 -------
 configs/distroless-thud-config.txt    |  7 -------
 configs/distroless-zeus-config.txt    |  7 -------
 configs/latest-all-head-config.txt    | 11 -----------
 configs/poky-morty-config.txt         |  7 -------
 configs/poky-rocko-config.txt         |  7 -------
 configs/poky-thud-config.txt          |  7 -------
 configs/poky-zeus-config.txt          |  7 -------
 sample-files/gitconfig.sample         | 16 ++++++++++++++++
 25 files changed, 19 insertions(+), 224 deletions(-)
 delete mode 100644 configs/arago-daisy-config.txt
 delete mode 100644 configs/arago-danny-config.txt
 delete mode 100644 configs/arago-denzil-config.txt
 delete mode 100644 configs/arago-dora-config.txt
 delete mode 100644 configs/arago-dylan-config.txt
 delete mode 100644 configs/arago-fido-config.txt
 delete mode 100644 configs/arago-krogoth-config.txt
 delete mode 100644 configs/arago-morty-config.txt
 delete mode 100644 configs/arago-rocko-config.txt
 delete mode 100644 configs/arago-thud-config.txt
 delete mode 100644 configs/arago-zeus-config.txt
 delete mode 100644 configs/arago-zeus-next-config.txt
 delete mode 100644 configs/distroless-morty-config.txt
 delete mode 100644 configs/distroless-rocko-config.txt
 delete mode 100644 configs/distroless-thud-config.txt
 delete mode 100644 configs/distroless-zeus-config.txt
 delete mode 100644 configs/latest-all-head-config.txt
 delete mode 100644 configs/poky-morty-config.txt
 delete mode 100644 configs/poky-rocko-config.txt
 delete mode 100644 configs/poky-thud-config.txt
 delete mode 100644 configs/poky-zeus-config.txt
 create mode 100644 sample-files/gitconfig.sample

[1] http://arago-project.org/pipermail/meta-arago/2021-June/013222.html
-- 
2.32.0


