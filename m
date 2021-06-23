Return-Path: <nm@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 5C28F52B91
	for <meta-arago@arago-project.org>;
	Wed, 23 Jun 2021 02:35:39 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15N2ZduL129646;
	Tue, 22 Jun 2021 21:35:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624415739;
	bh=ejrpMt3Iur0E3L3xLmfTeDix9QekiWrAauNvpx7A9nE=;
	h=From:To:CC:Subject:Date;
	b=FTKXOZL4/mGDw81JgLa41lSn9wc96rtd32RF4X/3TLSVuyXqrVj3ekPUHnob9aL3g
	eQ5vPCJLaQanA8OKYeMppSXTlW2pVVEv12s5I22rScyr9XdmSGVZMXSJ03/2VhBt0T
	wG+T4tv33ESOb2To67L8EGJeA63oG4LbGO5GiSJU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15N2Zdvv017163
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Jun 2021 21:35:39 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 22 Jun 2021 21:35:38 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 22 Jun 2021 21:35:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15N2Zc3Y113331;
	Tue, 22 Jun 2021 21:35:38 -0500
From: Nishanth Menon <nm@ti.com>
To: <praneeth@ti.com>, <yogeshs@ti.com>, <denis@denix.org>
Date: Tue, 22 Jun 2021 21:35:35 -0500
Message-ID: <20210623023538.32735-1-nm@ti.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [oe-layersetup PATCH 0/2] Lets start sunsetting arago-project.org
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
X-List-Received-Date: Wed, 23 Jun 2021 02:35:39 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hi All,

   [resend with reduced cc list - mailing list does'nt like too many
   CCs]

This is the first patch in the series of patches to various
repos for us to move away from arago-project.org domain name.

NOTE: we will maintain the meta-arago distro, but we move in steps
towards an integrated ecosystem in yocto project before we attempt to
close the domain name down.

NOTE:
1. I am not modifying release configs since those will need to be
   handled with a variation of url redirection of which a sample is
   provided in this series. Further updates are needed.
2. Existing git repos in arago-project.org are still kept updated, but
   once all references are redirected, we can mark the git repos in
   arago-project.org as no longer maintained.
3. If there are specific additional questions, please pop them out..
   lets discuss - also note that we will migrate the mailing list to
   yoctoproject.org once the infrastructural pieces are in place.

Nishanth Menon (3):
  sample-files: Add a URL redirection gitconfig sample file
  configs: Redirect older meta-ti to yoctoproject primary repo
  configs: *.txt: Revise meta-arago repo towards yoctoproject.org
    primary

 configs/arago-daisy-config.txt        |  4 ++--
 configs/arago-danny-config.txt        |  4 ++--
 configs/arago-denzil-config.txt       |  4 ++--
 configs/arago-dora-config.txt         |  4 ++--
 configs/arago-dunfell-config.txt      |  2 +-
 configs/arago-dunfell-next-config.txt |  2 +-
 configs/arago-dylan-config.txt        |  4 ++--
 configs/arago-fido-config.txt         |  4 ++--
 configs/arago-krogoth-config.txt      |  2 +-
 configs/arago-master-config.txt       |  2 +-
 configs/arago-morty-config.txt        |  2 +-
 configs/arago-rocko-config.txt        |  2 +-
 configs/arago-thud-config.txt         |  2 +-
 configs/arago-zeus-config.txt         |  2 +-
 configs/arago-zeus-next-config.txt    |  2 +-
 configs/latest-all-head-config.txt    |  4 ++--
 sample-files/gitconfig.sample         | 16 ++++++++++++++++
 17 files changed, 39 insertions(+), 23 deletions(-)
 create mode 100644 sample-files/gitconfig.sample

-- 
2.32.0


